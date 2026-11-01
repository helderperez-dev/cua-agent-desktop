# Reavion XFCE desktop (forked from trycua libs/xfce-cua).
#
# Application-neutral Linux desktop: XFCE + TigerVNC + noVNC.
# Computer-use binary is NOT baked here — seat images (reavion-desktop)
# install reavion-driver on top.
FROM python:3.13-slim-bookworm

LABEL org.opencontainers.image.title="reavion/xfce"
LABEL org.opencontainers.image.description="Multi-architecture XFCE desktop for Reavion seats"
LABEL org.opencontainers.image.source="https://github.com/helderperez-dev/reavion-images"

ENV DEBIAN_FRONTEND=noninteractive \
    HOME=/home/reavion \
    DISPLAY=:1 \
    DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus \
    VNC_PORT=5901 \
    NOVNC_PORT=6901 \
    VNC_RESOLUTION=1280x900 \
    VNC_COL_DEPTH=24 \
    PATH=/opt/venv/bin:$PATH

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    at-spi2-core \
    ca-certificates \
    curl \
    dbus-x11 \
    ffmpeg \
    firefox-esr \
    fonts-dejavu-core \
    libglib2.0-bin \
    netcat-openbsd \
    procps \
    sudo \
    supervisor \
    tigervnc-standalone-server \
    tigervnc-tools \
    websockify \
    x11-xserver-utils \
    xdg-utils \
    xfce4 \
    xfce4-terminal \
    && apt-get clean \
    && find /var/lib/apt/lists -mindepth 1 -delete

# CUA-1948: the compromised eMudhra intermediates. Ubuntu's ca-certificates >= 20260816ubuntu0.<release>.1 drops the
# roots they chain to; Debian has not shipped that yet, so disable both roots explicitly (a no-op once they are gone).
RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates \
 && sed -i -E 's#^(mozilla/(emSign_ECC_Root_CA_-_G3|Comodo_AAA_Services_root)\.crt)$#!\1#' /etc/ca-certificates.conf \
 && update-ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN useradd --uid 1000 --create-home --shell /bin/bash --groups sudo reavion \
    && echo "reavion ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/reavion \
    && chmod 0440 /etc/sudoers.d/reavion

RUN python -m venv /opt/venv \
    && /opt/venv/bin/python -m pip install --no-cache-dir --upgrade pip

RUN printf '%s\n' \
      'pref("datareporting.policy.firstRunURL", "");' \
      'pref("datareporting.policy.dataSubmissionEnabled", false);' \
      'pref("datareporting.healthreport.uploadEnabled", false);' \
      'pref("browser.aboutwelcome.enabled", false);' \
      > /etc/firefox-esr/reavion.js

COPY src/supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY src/scripts/ /usr/local/bin/
COPY vendor/reavion-vnc/ /usr/share/reavion-vnc/
# Compat path some docs still mention
RUN ln -sfn /usr/share/reavion-vnc /usr/share/novnc
COPY --chown=reavion:reavion src/xfce/ /home/reavion/.config/xfce4/

RUN chmod +x /usr/local/bin/*.sh \
    && mkdir -p \
        /home/reavion/.cache/dconf \
        /home/reavion/.config/autostart \
        /home/reavion/.mozilla/firefox \
        /home/reavion/.vnc \
        /home/reavion/shared \
        /home/reavion/storage \
        /run/user/1000 \
    && printf '[Desktop Entry]\nHidden=true\n' > /home/reavion/.config/autostart/xfce4-power-manager.desktop \
    && printf '[Desktop Entry]\nHidden=true\n' > /home/reavion/.config/autostart/xfce4-screensaver.desktop \
    && chown -R reavion:reavion /home/reavion /run/user/1000 \
    && chmod 0700 /run/user/1000

WORKDIR /home/reavion

EXPOSE 5901 6901

HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=6 \
  CMD curl --fail --silent "http://127.0.0.1:${NOVNC_PORT}/vnc.html" >/dev/null || exit 1

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
