#!/bin/bash
set -euo pipefail

rm -f /tmp/.X1-lock /tmp/.X11-unix/X1

security_args=(-SecurityTypes None --I-KNOW-THIS-IS-INSECURE)
if [[ -n "${VNC_PW:-}" ]]; then
  mkdir -p /home/reavion/.vnc
  printf '%s\n' "$VNC_PW" | vncpasswd -f > /home/reavion/.vnc/passwd
  chmod 0600 /home/reavion/.vnc/passwd
  security_args=(-SecurityTypes VncAuth -rfbauth /home/reavion/.vnc/passwd)
  unset VNC_PW
fi

vncserver :1 \
  -geometry "${VNC_RESOLUTION:-1280x900}" \
  -depth "${VNC_COL_DEPTH:-24}" \
  -rfbport "${VNC_PORT:-5901}" \
  -localhost no \
  "${security_args[@]}" \
  -AlwaysShared \
  -AcceptPointerEvents \
  -AcceptKeyEvents \
  -AcceptCutText \
  -SendCutText \
  -xstartup /usr/local/bin/xstartup.sh

exec tail -F /home/reavion/.vnc/*.log
