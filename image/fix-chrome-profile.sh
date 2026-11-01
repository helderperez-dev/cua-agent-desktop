#!/usr/bin/env bash
# Railway (and fresh local) volumes mount as root with only lost+found.
# Chrome must own its profile dir or it cannot write Preferences/Crashpad.
# After a seat rebuild/redeploy, Singleton* files still point at the old
# hostname and Chrome exits 21 ("profile in use by another computer").
#
# Chrome ≥136 ignores --remote-debugging-port on the *default* user-data-dir
# (~/.config/google-chrome). Seat volumes still mount there for continuity, so
# we keep persistent data under a nested non-default dir that the wrapper
# passes as --user-data-dir (same volume, CDP works).
set -euo pipefail

HOME_DIR="${HOME:-/home/reavion}"
VOLUME_ROOT="${CHROME_PROFILE_DIR:-${HOME_DIR}/.config/google-chrome}"
USER_DATA="${CHROME_USER_DATA_DIR:-${VOLUME_ROOT}/cdp-userdata}"

mkdir -p "${HOME_DIR}/.config"
chown reavion:reavion "${HOME_DIR}/.config" || true

mkdir -p "$VOLUME_ROOT"
chown reavion:reavion "$VOLUME_ROOT" || true
chmod 0700 "$VOLUME_ROOT" || true

# Migrate legacy default-profile layout into the non-default CDP dir once.
if [[ ! -e "${USER_DATA}/Local State" ]] && [[ -e "${VOLUME_ROOT}/Local State" ]]; then
  mkdir -p "$USER_DATA"
  # Move profile roots Chrome keeps at user-data-dir (not nested already).
  for name in \
    "Local State" \
    "Local State.bak" \
    "Default" \
    "System Profile" \
    "Guest Profile" \
    "Profile 1" \
    "Profile 2" \
    "Profile 3" \
    "First Run" \
    "Last Version" \
    "Variations" \
    "ChromeFeatureState" \
    "Safe Browsing" \
    "segmentation_platform" \
    "optimization_guide_model_store" \
    "component_crx_cache" \
    "extensions_crx_cache" \
    "GraphiteDawnCache" \
    "GrShaderCache" \
    "ShaderCache" \
    "pnacl" \
    "WidevineCdm" \
    "MEIPreload" \
    "hyphen-data" \
    "PKIMetadata" \
    "PrivacySandboxAttestationsPreloaded"
  do
    if [[ -e "${VOLUME_ROOT}/${name}" ]] && [[ ! -e "${USER_DATA}/${name}" ]]; then
      mv "${VOLUME_ROOT}/${name}" "${USER_DATA}/${name}" || true
    fi
  done
fi

mkdir -p "$USER_DATA"
chown -R reavion:reavion "$VOLUME_ROOT" || true
chmod 0700 "$USER_DATA" || true

clear_singletons() {
  local dir="$1"
  [[ -d "$dir" ]] || return 0
  rm -f \
    "${dir}/SingletonLock" \
    "${dir}/SingletonCookie" \
    "${dir}/SingletonSocket" \
    || true
}

clear_singletons "$VOLUME_ROOT"
clear_singletons "$USER_DATA"

exit 0
