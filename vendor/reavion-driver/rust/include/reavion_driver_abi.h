/* SPDX-License-Identifier: MIT */

#ifndef REAVION_DRIVER_ABI_H
#define REAVION_DRIVER_ABI_H

/* Generated from reavion-driver-sdk/src/abi.rs by reavion-driver-abi-header. Do not edit. */

#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#if defined(_WIN32)
#if defined(REAVION_DRIVER_ABI_BUILD)
#define REAVION_DRIVER_API __declspec(dllexport)
#else
#define REAVION_DRIVER_API __declspec(dllimport)
#endif
#else
#define REAVION_DRIVER_API __attribute__((visibility("default")))
#endif


#define REAVION_DRIVER_ABI_MAJOR 1

#define REAVION_DRIVER_ABI_MINOR 1

#define REAVION_DRIVER_ABI_PATCH 0

#define DRIVER_ENVELOPE_VERSION 1

#define PRIVATE_WORKER_PROTOCOL_VERSION 1

/**
 * Stable status codes returned across the C ABI.
 */
enum ReavionDriverStatus
#if defined(__cplusplus) || __STDC_VERSION__ >= 202311L
  : int32_t
#endif // defined(__cplusplus) || __STDC_VERSION__ >= 202311L
 {
  REAVION_DRIVER_STATUS_OK = 0,
  REAVION_DRIVER_STATUS_INVALID_ARGUMENT = 1,
  REAVION_DRIVER_STATUS_NULL_POINTER = 2,
  REAVION_DRIVER_STATUS_RUNTIME_UNAVAILABLE = 3,
  REAVION_DRIVER_STATUS_SHUTDOWN = 4,
  REAVION_DRIVER_STATUS_CANCELLED = 5,
  REAVION_DRIVER_STATUS_INTERNAL = 6,
  REAVION_DRIVER_STATUS_PANIC = 7,
  REAVION_DRIVER_STATUS_RUNTIME_CONFLICT = 8,
};
#ifndef __cplusplus
#if __STDC_VERSION__ >= 202311L
typedef enum ReavionDriverStatus ReavionDriverStatus;
#else
typedef int32_t ReavionDriverStatus;
#endif // __STDC_VERSION__ >= 202311L
#endif // __cplusplus

/**
 * Opaque driver runtime handle.
 */
typedef struct ReavionDriverHandle ReavionDriverHandle;

/**
 * Opaque token for one asynchronous operation.
 */
typedef struct ReavionDriverOperation ReavionDriverOperation;

/**
 * Opaque session handle whose actions are already bound to one immutable
 * authorization context.
 */
typedef struct ReavionDriverSessionHandle ReavionDriverSessionHandle;

/**
 * Version of the implementation-neutral Cua Driver ABI.
 */
typedef struct {
  uint32_t struct_size;
  uint16_t major;
  uint16_t minor;
  uint16_t patch;
  uint16_t reserved;
} ReavionDriverAbiVersion;

/**
 * Caller-owned byte buffer returned by the ABI.
 * Pass it to `reavion_driver_buffer_free_v1`; freeing an empty buffer is harmless.
 */
typedef struct {
  uint8_t *data;
  size_t len;
  size_t capacity;
} ReavionDriverBuffer;

/**
 * Completion callback for asynchronous operations. It is called exactly once
 * unless the process terminates. Result and error buffers are caller-owned.
 */
typedef void (*ReavionDriverCompletionV1)(void *context,
                                      ReavionDriverStatus status,
                                      ReavionDriverBuffer result,
                                      ReavionDriverBuffer error);

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

/**
 * Read the runtime ABI version into `out_version`.
 */
REAVION_DRIVER_API ReavionDriverStatus reavion_driver_abi_version_v1(ReavionDriverAbiVersion *out_version);

/**
 * Return whether this runtime supports a caller compiled for `major.minor`.
 */
REAVION_DRIVER_API bool reavion_driver_abi_is_compatible_v1(uint16_t major, uint16_t minor);

/**
 * Free and clear a buffer returned by this ABI. Repeated calls are harmless.
 */
REAVION_DRIVER_API void reavion_driver_buffer_free_v1(ReavionDriverBuffer *buffer);

/**
 * Create an in-process driver. `options_json` is empty or a UTF-8 JSON object.
 * It accepts `claude_code_compatibility` and an optional immutable
 * `authorization` ceiling. Unknown fields fail closed.
 */
REAVION_DRIVER_API
ReavionDriverStatus reavion_driver_create_v1(const uint8_t *options_json,
                                     size_t options_len,
                                     ReavionDriverHandle **out_handle,
                                     ReavionDriverBuffer *out_error);

/**
 * Destroy and clear a driver handle. Repeated calls are harmless.
 */
REAVION_DRIVER_API void reavion_driver_destroy_v1(ReavionDriverHandle **handle);

/**
 * Return whether the driver still accepts operations.
 */
REAVION_DRIVER_API
ReavionDriverStatus reavion_driver_is_available_v1(ReavionDriverHandle *handle,
                                           bool *out_available,
                                           ReavionDriverBuffer *out_error);

/**
 * Return driver metadata as caller-owned UTF-8 JSON.
 */
REAVION_DRIVER_API
ReavionDriverStatus reavion_driver_metadata_json_v1(ReavionDriverHandle *handle,
                                            ReavionDriverBuffer *out_json,
                                            ReavionDriverBuffer *out_error);

/**
 * Return the canonical SDK/MCP tool inventory as caller-owned UTF-8 JSON.
 */
REAVION_DRIVER_API
ReavionDriverStatus reavion_driver_list_tools_json_v1(ReavionDriverHandle *handle,
                                              ReavionDriverBuffer *out_json,
                                              ReavionDriverBuffer *out_error);

/**
 * Invoke a named tool asynchronously. Cancellation is requested with
 * `reavion_driver_operation_cancel_v1`; release the token after completion.
 */
REAVION_DRIVER_API
ReavionDriverStatus reavion_driver_invoke_v1(ReavionDriverHandle *handle,
                                     const uint8_t *name,
                                     size_t name_len,
                                     const uint8_t *arguments_json,
                                     size_t arguments_len,
                                     ReavionDriverCompletionV1 callback,
                                     void *context,
                                     ReavionDriverOperation **out_operation,
                                     ReavionDriverBuffer *out_error);

/**
 * Create a trusted, immutable session binding below this runtime's ceiling.
 *
 * This is a host API, not an agent tool. The returned handle carries its
 * authority in memory and cannot be reconstructed from a public session ID.
 */
REAVION_DRIVER_API
ReavionDriverStatus reavion_driver_session_create_v1(ReavionDriverHandle *handle,
                                             const uint8_t *options_json,
                                             size_t options_len,
                                             ReavionDriverSessionHandle **out_session,
                                             ReavionDriverBuffer *out_error);

/**
 * Destroy a trusted session handle and revoke its connection-bound grants.
 */
REAVION_DRIVER_API void reavion_driver_session_destroy_v1(ReavionDriverSessionHandle **handle);

/**
 * Invoke through an already-bound trusted session context.
 */
REAVION_DRIVER_API
ReavionDriverStatus reavion_driver_session_invoke_v1(ReavionDriverSessionHandle *handle,
                                             const uint8_t *name,
                                             size_t name_len,
                                             const uint8_t *arguments_json,
                                             size_t arguments_len,
                                             ReavionDriverCompletionV1 callback,
                                             void *context,
                                             ReavionDriverOperation **out_operation,
                                             ReavionDriverBuffer *out_error);

/**
 * Stop admission, drain admitted calls, and finalize SDK-owned resources.
 */
REAVION_DRIVER_API
ReavionDriverStatus reavion_driver_shutdown_v1(ReavionDriverHandle *handle,
                                       ReavionDriverCompletionV1 callback,
                                       void *context,
                                       ReavionDriverOperation **out_operation,
                                       ReavionDriverBuffer *out_error);

/**
 * Request cancellation of an asynchronous operation.
 */
REAVION_DRIVER_API void reavion_driver_operation_cancel_v1(ReavionDriverOperation *operation);

/**
 * Release and clear an operation token. Repeated calls are harmless.
 */
REAVION_DRIVER_API void reavion_driver_operation_release_v1(ReavionDriverOperation **operation);

#ifdef __cplusplus
}  // extern "C"
#endif  // __cplusplus

#endif  /* REAVION_DRIVER_ABI_H */
