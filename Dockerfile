# cua-agent-desktop: XFCE sandbox + reavion-driver + noVNC + remote MCP/VNC edge
#
# Builds Reavion Driver from vendor/reavion-driver (run scripts/sync-driver.sh
# before commit/deploy). Base desktop stack remains trycua/xfce-cua.

ARG RUST_VERSION=1.97.1

# ---------------------------------------------------------------------------
# Stage 1: compile reavion-driver for Linux
# ---------------------------------------------------------------------------
FROM docker.io/library/rust:${RUST_VERSION}-bookworm AS driver-builder

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      pkg-config \
      clang \
      libclang-dev \
      cmake \
      libx11-dev \
      libxtst-dev \
      libxfixes-dev \
      libxi-dev \
      libxrandr-dev \
      libxcomposite-dev \
      libxdamage-dev \
      libxext-dev \
      libxkbcommon-dev \
      libdbus-1-dev \
      libwayland-dev \
      libpipewire-0.3-dev \
    ; \
    rm -rf /var/lib/apt/lists/*

WORKDIR /src
COPY vendor/reavion-driver/rust /src

RUN set -eux; \
    cargo build --locked --release -p reavion-driver; \
    install -D -m 0755 target/release/reavion-driver /out/reavion-driver; \
    /out/reavion-driver --version

# ---------------------------------------------------------------------------
# Stage 2: desktop runtime image
# ---------------------------------------------------------------------------
FROM docker.io/trycua/xfce-cua@sha256:274eb636f5cf3fc58f705916ee72b7a701270b3877369d08533a385c5325be9b

ARG TARGETARCH
ARG CADDY_VERSION=2.10.2
ARG REAVION_DRIVER_VERSION=0.38.0

LABEL org.opencontainers.image.title="cua-agent-desktop" \
      org.opencontainers.image.description="Isolated Linux desktop for AI agents via Reavion Driver MCP + noVNC" \
      cua.agent.desktop.managed="true" \
      cua.agent.desktop.driver="reavion-driver" \
      cua.agent.desktop.driver.version="0.38.0" \
      cua.agent.desktop.base.digest="sha256:274eb636f5cf3fc58f705916ee72b7a701270b3877369d08533a385c5325be9b"

# Edge / remote defaults (Railway injects PORT; set MCP_API_KEY in the service)
# VNC_RESOLUTION is read by base start-vnc.sh (-geometry). 1280x720 scales cleanly
# into phone WebViews with noVNC resize=scale; change only takes effect on container start.
ENV PORT=8080 \
    MCP_GATEWAY_PORT=8200 \
    MCP_API_KEY= \
    REQUIRE_MCP_API_KEY=0 \
    RAILWAY_ENVIRONMENT= \
    CUA_DRIVER_RS_TELEMETRY_ENABLED=0 \
    REAVION_DRIVER_RS_TELEMETRY_ENABLED=0 \
    VNC_RESOLUTION=1280x720 \
    VNC_COL_DEPTH=24 \
    REAVION_SOCKET=/run/user/1000/reavion.sock \
    REAVION_DRIVER=/usr/local/libexec/reavion-desktop/reavion-driver \
    CUA_SOCKET=/run/user/1000/reavion.sock \
    CUA_DRIVER=/usr/local/libexec/reavion-desktop/reavion-driver

USER root

# --- Node (supergateway) + Caddy (single public PORT) ---
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends ca-certificates curl nodejs npm; \
    case "${TARGETARCH}" in \
      arm64|aarch64) caddy_arch=arm64 ;; \
      amd64|x86_64)  caddy_arch=amd64 ;; \
      *) echo "unsupported TARGETARCH=${TARGETARCH}" >&2; exit 1 ;; \
    esac; \
    curl -fsSL -o /tmp/caddy.tgz \
      "https://github.com/caddyserver/caddy/releases/download/v${CADDY_VERSION}/caddy_${CADDY_VERSION}_linux_${caddy_arch}.tar.gz"; \
    tar -xzf /tmp/caddy.tgz -C /usr/local/bin caddy; \
    chmod 0755 /usr/local/bin/caddy; \
    caddy version; \
    node --version; \
    npm --version; \
    npm install -g "supergateway@4.2.1"; \
    rm -f /tmp/caddy.tgz; \
    rm -rf /var/lib/apt/lists/*; \
    install -d -o cua -g cua -m 0755 /home/cua/.npm

# Google Chrome (default browser). Official .deb for amd64 + arm64.
COPY image/google-chrome-wrapper.sh /usr/local/bin/google-chrome-wrapper.sh
RUN set -eux; \
    case "${TARGETARCH}" in \
      arm64|aarch64) deb_arch=arm64 ;; \
      amd64|x86_64)  deb_arch=amd64 ;; \
      *) echo "unsupported TARGETARCH=${TARGETARCH}" >&2; exit 1 ;; \
    esac; \
    curl -fsSL -o /tmp/chrome.deb \
      "https://dl.google.com/linux/direct/google-chrome-stable_current_${deb_arch}.deb"; \
    apt-get update; \
    apt-get install -y --no-install-recommends /tmp/chrome.deb || \
      apt-get install -y --no-install-recommends -f; \
    rm -f /tmp/chrome.deb; \
    rm -rf /var/lib/apt/lists/*; \
    chmod 0755 /usr/local/bin/google-chrome-wrapper.sh; \
    if [ -x /usr/bin/google-chrome-stable ]; then \
      mv /usr/bin/google-chrome-stable /usr/bin/google-chrome-stable.real; \
      ln -sfn /usr/local/bin/google-chrome-wrapper.sh /usr/bin/google-chrome-stable; \
      ln -sfn /usr/local/bin/google-chrome-wrapper.sh /usr/bin/google-chrome; \
      ln -sfn /usr/local/bin/google-chrome-wrapper.sh /usr/local/bin/google-chrome; \
      ln -sfn /usr/local/bin/google-chrome-wrapper.sh /usr/local/bin/chrome; \
    fi; \
    update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/local/bin/google-chrome-wrapper.sh 200; \
    update-alternatives --install /usr/bin/gnome-www-browser gnome-www-browser /usr/local/bin/google-chrome-wrapper.sh 200; \
    install -d -o cua -g cua -m 0700 /home/cua/.config/google-chrome; \
    install -d -o cua -g cua /home/cua/.config/xfce4; \
    printf 'WebBrowser=google-chrome\nTerminalEmulator=xfce4-terminal\n' \
      > /home/cua/.config/xfce4/helpers.rc; \
    chown cua:cua /home/cua/.config/xfce4/helpers.rc; \
    google-chrome-stable --version

# Install Reavion Driver binary built in stage 1.
COPY --from=driver-builder /out/reavion-driver /usr/local/libexec/reavion-desktop/reavion-driver
RUN set -eux; \
    chmod 0755 /usr/local/libexec/reavion-desktop/reavion-driver; \
    ln -sfn /usr/local/libexec/reavion-desktop/reavion-driver /usr/local/bin/reavion-driver; \
    # Compat shims for scripts that still say cua-driver
    ln -sfn /usr/local/libexec/reavion-desktop/reavion-driver /usr/local/bin/cua-driver; \
    install -d -m 0755 /usr/local/libexec/cua-desktop; \
    ln -sfn /usr/local/libexec/reavion-desktop/reavion-driver /usr/local/libexec/cua-desktop/cua-driver; \
    /usr/local/libexec/reavion-desktop/reavion-driver --version | tee /tmp/reavion-driver-version.txt; \
    grep -F "reavion-driver ${REAVION_DRIVER_VERSION}" /tmp/reavion-driver-version.txt; \
    install -d -o cua -g cua -m 0700 /run/user/1000; \
    install -d -o cua -g cua -m 0755 /home/cua/workspace; \
    rm -f /tmp/reavion-driver-version.txt

COPY image/start-reavion-driver.sh /usr/local/bin/start-reavion-driver.sh
COPY image/start-mcp-gateway.sh /usr/local/bin/start-mcp-gateway.sh
COPY image/start-edge-proxy.sh /usr/local/bin/start-edge-proxy.sh
COPY image/Caddyfile /etc/caddy/Caddyfile
COPY image/reavion-driver.conf /etc/supervisor/conf.d/reavion-driver.conf
COPY image/mcp-gateway.conf /etc/supervisor/conf.d/mcp-gateway.conf
COPY image/edge-proxy.conf /etc/supervisor/conf.d/edge-proxy.conf

RUN ln -sfn /usr/local/bin/start-reavion-driver.sh /usr/local/bin/start-cua-driver.sh

RUN chmod 0755 \
      /usr/local/bin/start-reavion-driver.sh \
      /usr/local/bin/start-mcp-gateway.sh \
      /usr/local/bin/start-edge-proxy.sh \
 && rm -f /etc/supervisor/conf.d/cua-driver.conf \
 && for conf in reavion-driver mcp-gateway edge-proxy; do \
      if [ -f /etc/supervisor/conf.d/supervisord.conf ] \
         && ! grep -Fq "[program:${conf}]" /etc/supervisor/conf.d/supervisord.conf; then \
        printf '\n' >> /etc/supervisor/conf.d/supervisord.conf; \
        cat "/etc/supervisor/conf.d/${conf}.conf" >> /etc/supervisor/conf.d/supervisord.conf; \
      fi; \
    done \
 && if [ -f /etc/supervisor/supervisord.conf ] \
      && ! grep -Eq 'files[[:space:]]*=[[:space:]]*/etc/supervisor/conf.d' /etc/supervisor/supervisord.conf \
      && ! grep -Fq '[program:reavion-driver]' /etc/supervisor/supervisord.conf; then \
      printf '\n[include]\nfiles = /etc/supervisor/conf.d/*.conf\n' >> /etc/supervisor/supervisord.conf; \
    fi

EXPOSE 8080
