#!/bin/bash
# Apply Reavion XFCE desktop branding into the user home.
# Safe for persistent VOLUME /home/reavion — reseeds when THEME_VERSION bumps.
set -euo pipefail

THEME_VERSION="2"
STAMP="${HOME}/.config/reavion-desktop-theme.version"
SHARE="/usr/share/reavion-desktop"
WALLPAPER="/usr/share/backgrounds/reavion/reavion-mountains.jpg"
SKEL="${SHARE}/skel"

mkdir -p \
  "${HOME}/.config/xfce4/terminal" \
  "${HOME}/.config/xfce4/xfconf/xfce-perchannel-xml" \
  "${HOME}/.config/gtk-3.0" \
  "$(dirname "${STAMP}")"

current="$(cat "${STAMP}" 2>/dev/null || true)"
need_seed=0
if [[ "${current}" != "${THEME_VERSION}" || "${REAVION_FORCE_THEME:-0}" == "1" ]]; then
  need_seed=1
fi

if [[ "${need_seed}" == "1" ]]; then
  if [[ -d "${SKEL}/xfce" ]]; then
    cp -a "${SKEL}/xfce/terminal/." "${HOME}/.config/xfce4/terminal/" 2>/dev/null || true
    cp -a "${SKEL}/xfce/xfconf/." "${HOME}/.config/xfce4/xfconf/" 2>/dev/null || true
  fi
  if [[ -d "${SKEL}/gtk-3.0" ]]; then
    cp -a "${SKEL}/gtk-3.0/." "${HOME}/.config/gtk-3.0/"
  fi
  if [[ ! -f "${HOME}/.config/xfce4/helpers.rc" ]]; then
    printf 'WebBrowser=firefox-esr\nTerminalEmulator=xfce4-terminal\n' \
      > "${HOME}/.config/xfce4/helpers.rc"
  fi
  printf '%s\n' "${THEME_VERSION}" > "${STAMP}"
fi

# Live display tweaks when X is up (wallpaper + compositing). Safe every call.
if command -v xfconf-query >/dev/null 2>&1 && xset q >/dev/null 2>&1; then
  if [[ "${need_seed}" == "1" ]]; then
    xfconf-query -c xsettings -p /Gtk/FontName -n -t string -s "Inter 10" 2>/dev/null || true
    xfconf-query -c xsettings -p /Gtk/MonospaceFontName -n -t string -s "JetBrains Mono 11" 2>/dev/null || true
    xfconf-query -c xsettings -p /Net/ThemeName -n -t string -s "Arc-Dark" 2>/dev/null || true
    xfconf-query -c xsettings -p /Net/IconThemeName -n -t string -s "Papirus-Dark" 2>/dev/null || true
    xfconf-query -c xfwm4 -p /general/theme -n -t string -s "Arc-Dark" 2>/dev/null || true
    xfconf-query -c xfwm4 -p /general/title_font -n -t string -s "Inter Bold 10" 2>/dev/null || true
  fi
  xfconf-query -c xfwm4 -p /general/use_compositing -n -t bool -s true 2>/dev/null || true

  if [[ -f "${WALLPAPER}" ]]; then
    while IFS= read -r prop; do
      case "${prop}" in
        */last-image)
          xfconf-query -c xfce4-desktop -p "${prop}" -n -t string -s "${WALLPAPER}" 2>/dev/null || true
          ;;
        */image-style)
          xfconf-query -c xfce4-desktop -p "${prop}" -n -t int -s 5 2>/dev/null || true
          ;;
      esac
    done < <(xfconf-query -c xfce4-desktop -l 2>/dev/null || true)

    for mon in monitor0 monitorVNC-0 monitorVNC-1 monitorVirtual-1 monitoreDP-1; do
      base="/backdrop/screen0/${mon}/workspace0"
      xfconf-query -c xfce4-desktop -p "${base}/last-image" -n -t string -s "${WALLPAPER}" 2>/dev/null || true
      xfconf-query -c xfce4-desktop -p "${base}/image-style" -n -t int -s 5 2>/dev/null || true
      xfconf-query -c xfce4-desktop -p "${base}/color-style" -n -t int -s 0 2>/dev/null || true
    done
  fi
fi

exit 0
