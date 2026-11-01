#!/bin/bash
# Apply Reavion XFCE desktop branding into the user home.
# Safe for persistent VOLUME /home/reavion — reseeds when THEME_VERSION bumps.
set -euo pipefail

THEME_VERSION="5"
STAMP="${HOME}/.config/reavion-desktop-theme.version"
SHARE="/usr/share/reavion-desktop"
WALLPAPER="/usr/share/backgrounds/reavion/reavion-mountains.jpg"
SKEL="${SHARE}/skel"

mkdir -p \
  "${HOME}/.config/xfce4/terminal" \
  "${HOME}/.config/xfce4/xfconf/xfce-perchannel-xml" \
  "${HOME}/.config/gtk-3.0" \
  "${HOME}/.config/autostart" \
  "$(dirname "${STAMP}")"

current="$(cat "${STAMP}" 2>/dev/null || true)"
need_seed=0
if [[ "${current}" != "${THEME_VERSION}" || "${REAVION_FORCE_THEME:-0}" == "1" ]]; then
  need_seed=1
fi

if [[ "${need_seed}" == "1" ]]; then
  if [[ -d "${SKEL}/xfce" ]]; then
    cp -a "${SKEL}/xfce/terminal/." "${HOME}/.config/xfce4/terminal/" 2>/dev/null || true
    # Seed xfconf channels except panel — let XFCE keep/repair a stock panel.
    if [[ -d "${SKEL}/xfce/xfconf/xfce-perchannel-xml" ]]; then
      for f in "${SKEL}/xfce/xfconf/xfce-perchannel-xml/"*.xml; do
        base="$(basename "${f}")"
        if [[ "${base}" == "xfce4-panel.xml" ]]; then
          continue
        fi
        cp -a "${f}" "${HOME}/.config/xfce4/xfconf/xfce-perchannel-xml/"
      done
    fi
  fi
  if [[ -d "${SKEL}/gtk-3.0" ]]; then
    cp -a "${SKEL}/gtk-3.0/." "${HOME}/.config/gtk-3.0/"
  fi

  # Tear down the broken Plank experiment (giant translucent bar on VNC).
  pkill -u "$(id -u)" -x plank 2>/dev/null || true
  rm -rf "${HOME}/.config/plank"
  rm -f "${HOME}/.config/autostart/plank.desktop"

  # Drop a corrupted custom panel so XFCE recreates a normal top/bottom panel.
  rm -f "${HOME}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml"

  if [[ ! -f "${HOME}/.config/xfce4/helpers.rc" ]]; then
    if [[ -f /usr/share/applications/google-chrome.desktop ]]; then
      printf 'WebBrowser=google-chrome\nTerminalEmulator=xfce4-terminal\n' \
        > "${HOME}/.config/xfce4/helpers.rc"
    else
      printf 'WebBrowser=firefox-esr\nTerminalEmulator=xfce4-terminal\n' \
        > "${HOME}/.config/xfce4/helpers.rc"
    fi
  fi

  printf '%s\n' "${THEME_VERSION}" > "${STAMP}"
fi

# Live display tweaks when X is up.
if command -v xfconf-query >/dev/null 2>&1 && xset q >/dev/null 2>&1; then
  xfconf-query -c xsettings -p /Gtk/FontName -n -t string -s "Inter 10" 2>/dev/null || true
  xfconf-query -c xsettings -p /Gtk/MonospaceFontName -n -t string -s "JetBrains Mono 11" 2>/dev/null || true
  xfconf-query -c xsettings -p /Net/ThemeName -n -t string -s "Arc-Dark" 2>/dev/null || true
  xfconf-query -c xsettings -p /Net/IconThemeName -n -t string -s "Papirus" 2>/dev/null || true
  xfconf-query -c xfwm4 -p /general/theme -n -t string -s "Arc-Dark" 2>/dev/null || true
  xfconf-query -c xfwm4 -p /general/title_font -n -t string -s "Inter Bold 10" 2>/dev/null || true
  xfconf-query -c xfwm4 -p /general/use_compositing -n -t bool -s true 2>/dev/null || true

  xfconf-query -c xfce4-desktop -p /desktop-icons/style -n -t int -s 0 2>/dev/null || true
  xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-home -n -t bool -s false 2>/dev/null || true
  xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-filesystem -n -t bool -s false 2>/dev/null || true
  xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-trash -n -t bool -s false 2>/dev/null || true

  # Prefer Reavion mark on Applications menu when that plugin exists.
  while IFS= read -r prop; do
    case "${prop}" in
      /plugins/plugin-*/button-icon)
        xfconf-query -c xfce4-panel -p "${prop}" -n -t string -s "reavion-mark" 2>/dev/null || true
        ;;
    esac
  done < <(xfconf-query -c xfce4-panel -l 2>/dev/null || true)

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

  # Never leave a stray Plank process painting over the desktop.
  if pgrep -u "$(id -u)" -x plank >/dev/null 2>&1; then
    pkill -u "$(id -u)" -x plank 2>/dev/null || true
  fi
fi

exit 0
