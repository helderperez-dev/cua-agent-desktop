#!/bin/bash
# System D-Bus is required by Chrome/Chromium 150+; without it the browser
# SIGTRAPs on launch (exit 133) even with --no-sandbox.
set -euo pipefail

mkdir -p /run/dbus /var/run/dbus
rm -f /run/dbus/pid /var/run/dbus/pid

exec /usr/bin/dbus-daemon --system --nofork --nopidfile
