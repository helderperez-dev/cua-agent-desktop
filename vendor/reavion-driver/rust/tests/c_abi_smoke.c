/* SPDX-License-Identifier: MIT */
#define _DEFAULT_SOURCE
#include "reavion_driver_abi.h"

#include <stdatomic.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

typedef struct CompletionState {
  atomic_int done;
  atomic_int status;
} CompletionState;

static void complete(void *context, ReavionDriverStatus status,
                     ReavionDriverBuffer result, ReavionDriverBuffer error) {
  CompletionState *state = (CompletionState *)context;
  reavion_driver_buffer_free_v1(&result);
  reavion_driver_buffer_free_v1(&error);
  atomic_store(&state->status, (int)status);
  atomic_store(&state->done, 1);
}

static int fail(const char *message, ReavionDriverBuffer *error) {
  if (error != NULL && error->data != NULL) {
    fprintf(stderr, "%s: %.*s\n", message, (int)error->len,
            (const char *)error->data);
    reavion_driver_buffer_free_v1(error);
  } else {
    fprintf(stderr, "%s\n", message);
  }
  return 1;
}

static bool contains(ReavionDriverBuffer buffer, const char *needle) {
  size_t needle_len = strlen(needle);
  if (needle_len > buffer.len) {
    return false;
  }
  for (size_t offset = 0; offset + needle_len <= buffer.len; ++offset) {
    if (memcmp(buffer.data + offset, needle, needle_len) == 0) {
      return true;
    }
  }
  return false;
}

static bool wait_for_completion(CompletionState *completion) {
  for (int attempt = 0; attempt < 2000 && !atomic_load(&completion->done);
       ++attempt) {
    usleep(1000);
  }
  return atomic_load(&completion->done) != 0;
}

int main(void) {
  ReavionDriverAbiVersion version = {0};
  if (reavion_driver_abi_version_v1(&version) != REAVION_DRIVER_STATUS_OK ||
      version.struct_size != sizeof(ReavionDriverAbiVersion) ||
      version.major != REAVION_DRIVER_ABI_MAJOR ||
      !reavion_driver_abi_is_compatible_v1(REAVION_DRIVER_ABI_MAJOR,
                                       REAVION_DRIVER_ABI_MINOR)) {
    return fail("ABI version negotiation failed", NULL);
  }

  ReavionDriverHandle *driver = NULL;
  ReavionDriverBuffer error = {0};
  if (reavion_driver_create_v1(NULL, 0, &driver, &error) !=
          REAVION_DRIVER_STATUS_OK ||
      driver == NULL) {
    return fail("driver creation failed", &error);
  }

  bool available = false;
  if (reavion_driver_is_available_v1(driver, &available, &error) !=
          REAVION_DRIVER_STATUS_OK ||
      !available) {
    return fail("new driver is unavailable", &error);
  }

  ReavionDriverBuffer metadata = {0};
  if (reavion_driver_metadata_json_v1(driver, &metadata, &error) !=
          REAVION_DRIVER_STATUS_OK ||
      metadata.len == 0 ||
      !contains(metadata, "\"embedded\":true")) {
    return fail("metadata contract failed", &error);
  }
  reavion_driver_buffer_free_v1(&metadata);
  reavion_driver_buffer_free_v1(&metadata);

  ReavionDriverBuffer tools = {0};
  if (reavion_driver_list_tools_json_v1(driver, &tools, &error) !=
          REAVION_DRIVER_STATUS_OK ||
      tools.len == 0 ||
      !contains(tools, "get_desktop_state")) {
    return fail("tool discovery contract failed", &error);
  }
  reavion_driver_buffer_free_v1(&tools);

  CompletionState completion;
  atomic_init(&completion.done, 0);
  atomic_init(&completion.status, REAVION_DRIVER_STATUS_INTERNAL);
  ReavionDriverOperation *operation = NULL;
  const char *missing_tool = "c_abi_smoke_missing_tool";
  const char *empty_arguments = "{}";
  if (reavion_driver_invoke_v1(
          driver, (const uint8_t *)missing_tool, strlen(missing_tool),
          (const uint8_t *)empty_arguments, strlen(empty_arguments), complete,
          &completion, &operation, &error) != REAVION_DRIVER_STATUS_OK ||
      operation == NULL || !wait_for_completion(&completion) ||
      atomic_load(&completion.status) != REAVION_DRIVER_STATUS_OK) {
    return fail("async invocation failed", &error);
  }
  reavion_driver_operation_release_v1(&operation);

  atomic_store(&completion.done, 0);
  atomic_store(&completion.status, REAVION_DRIVER_STATUS_INTERNAL);
  if (reavion_driver_shutdown_v1(driver, complete, &completion, &operation,
                             &error) != REAVION_DRIVER_STATUS_OK ||
      operation == NULL) {
    return fail("async shutdown submission failed", &error);
  }
  if (!wait_for_completion(&completion) ||
      atomic_load(&completion.status) != REAVION_DRIVER_STATUS_OK) {
    return fail("async shutdown completion failed", NULL);
  }
  reavion_driver_operation_release_v1(&operation);
  reavion_driver_operation_release_v1(&operation);

  available = true;
  if (reavion_driver_is_available_v1(driver, &available, &error) !=
          REAVION_DRIVER_STATUS_OK ||
      available) {
    return fail("shutdown driver remained available", &error);
  }

  reavion_driver_destroy_v1(&driver);
  reavion_driver_destroy_v1(&driver);
  if (driver != NULL) {
    return fail("driver destruction did not clear the handle", NULL);
  }
  return 0;
}
