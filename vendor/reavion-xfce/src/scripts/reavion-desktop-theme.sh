#!/bin/bash
# Apply Reavion XFCE desktop branding into the user home.
# Safe for persistent VOLUME /home/reavion — reseeds when THEME_VERSION bumps.
set -euo pipefail

THEME_VERSION="4"
STAMP="${HOME}/.config/reavion-desktop-theme.version"
SHARE="/usr/share/reavion-desktop"
WALLPAPER="/usr/share/backgrounds/reavion/reavion-mountains.jpg"
SKEL="${SHARE}/skel"

mkdir -p \
  "${HOME}/.config/xfce4/terminal" \
  "${HOME}/.config/xfce4/xfconf/xfce-perchannel-xml" \
  "${HOME}/.config/gtk-3.0" \
  "${HOME}/.config/plank/dock1/launchers" \
  "${HOME}/.config/autostart" \
  "$(dirname "${STAMP}")"

current="$(cat "${STAMP}" 2>/dev/null || true)"
need_seed=0
if [[ "${current}" != "${THEME_VERSION}" || "${REAVION_FORCE_THEME:-0}" == "1" ]]; then
  need_seed=1
fi

pick_browser_desktop() {
  for cand in \
    /usr/share/applications/google-chrome.desktop \
    /usr/share/applications/google-chrome-stable.desktop \
    /usr/share/applications/firefox-esr.desktop \
    /usr/share/applications/firefox.desktop
  do
    if [[ -f "${cand}" ]]; then
      printf '%s\n' "${cand}"
      return 0
    fi
  done
  printf '%s\n' "/usr/share/applications/firefox-esr.desktop"
}

if [[ "${need_seed}" == "1" ]]; then
  if [[ -d "${SKEL}/xfce" ]]; then
    cp -a "${SKEL}/xfce/terminal/." "${HOME}/.config/xfce4/terminal/" 2>/dev/null || true
    cp -a "${SKEL}/xfce/xfconf/." "${HOME}/.config/xfce4/xfconf/" 2>/dev/null || true
  fi
  if [[ -d "${SKEL}/gtk-3.0" ]]; then
    cp -a "${SKEL}/gtk-3.0/." "${HOME}/.config/gtk-3.0/"
  fi
  if [[ -d "${SKEL}/plank" ]]; then
    cp -a "${SKEL}/plank/." "${HOME}/.config/plank/"
  fi
  if [[ -d "${SKEL}/autostart" ]]; then
    cp -a "${SKEL}/autostart/." "${HOME}/.config/autostart/"
  fi

  browser="$(pick_browser_desktop)"
  printf '[PlankDockItemPreferences]\nLauncher=file://%s\n' "${browser}" \
    > "${HOME}/.config/plank/dock1/launchers/browser.dockitem"

  # Prefer Chrome helper when seat image provides it; do not clobber an existing Chrome helpers.rc.
  if [[ ! -f "${HOME}/.config/xfce4/helpers.rc" ]]; then
    if [[ "${browser}" == *chrome* ]]; then
      printf 'WebBrowser=google-chrome\nTerminalEmulator=xfce4-terminal\n' \
        > "${HOME}/.config/xfce4/helpers.rc"
    else
      printf 'WebBrowser=firefox-esr\nTerminalEmulator=xfce4-terminal\n' \
        > "${HOME}/.config/xfce4/helpers.rc"
    fi
  fi

  printf '%s\n' "${THEME_VERSION}" > "${STAMP}"
fi

# Live display tweaks when X is up. Safe every call.
if command -v xfconf-query >/dev/null 2>&1 && xset q >/dev/null 2>&1; then
  # Always reinforce look (volume homes / late xfsettingsd).
  xfconf-query -c xsettings -p /Gtk/FontName -n -t string -s "Inter 10" 2>/dev/null || true
  xfconf-query -c xsettings -p /Gtk/MonospaceFontName -n -t string -s "JetBrains Mono 11" 2>/dev/null || true
  xfconf-query -c xsettings -p /Net/ThemeName -n -t string -s "Arc-Dark" 2>/dev/null || true
  xfconf-query -c xsettings -p /Net/IconThemeName -n -t string -s "Papirus" 2>/dev/null || true
  xfconf-query -c xfwm4 -p /general/theme -n -t string -s "Arc-Dark" 2>/dev/null || true
  xfconf-query -c xfwm4 -p /general/title_font -n -t string -s "Inter Bold 10" 2>/dev/null || true
  xfconf-query -c xfwm4 -p /general/use_compositing -n -t bool -s true 2>/dev/null || true

  # Quiet desktop — no Home / File System icons.
  xfconf-query -c xfce4-desktop -p /desktop-icons/style -n -t int -s 0 2>/dev/null || true
  xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-home -n -t bool -s false 2>/dev/null || true
  xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-filesystem -n -t bool -s false 2>/dev/null || true
  xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-trash -n -t bool -s false 2>/dev/null || true

  # Applications menu → Reavion mark (plugin id may vary on old volumes).
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

  # Ensure Plank is running (autostart can race on first session).
  if command -v plank >/dev/null 2>&1; then
    if ! pgrep -u "$(id -u)" -x plank >/dev/null 2>&1; then
      nohup plank >/dev/null 2>&1 &
    fi
  fi
fi

exit 0
