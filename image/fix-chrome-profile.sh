#!/usr/bin/env bash
# Railway (and fresh local) volumes mount as root with only lost+found.
# Chrome must own its profile dir or it cannot write Preferences/Crashpad.
# After a seat rebuild/redeploy, Singleton* files still point at the old
# hostname and Chrome exits 21 ("profile in use by another computer").
set -euo pipefail

PROFILE="${CHROME_PROFILE_DIR:-/home/reavion/.config/google-chrome}"

mkdir -p /home/reavion/.config
chown reavion:reavion /home/reavion/.config || true

if [[ -d "$PROFILE" ]]; then
  chown -R reavion:reavion "$PROFILE" || true
  chmod 0700 "$PROFILE" || true
  rm -f \
    "$PROFILE/SingletonLock" \
    "$PROFILE/SingletonCookie" \
    "$PROFILE/SingletonSocket" \
    || true
fi

exit 0
