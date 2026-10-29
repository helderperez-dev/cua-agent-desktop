# cua-agent-desktop: XFCE sandbox + cua-driver + noVNC + remote MCP/VNC edge
FROM docker.io/trycua/xfce-cua@sha256:274eb636f5cf3fc58f705916ee72b7a701270b3877369d08533a385c5325be9b

ARG CUA_DRIVER_VERSION=0.38.0
ARG TARGETARCH
ARG CADDY_VERSION=2.10.2

# Pinned manylinux wheels (PyPI, verified at build time)
ARG CUA_DRIVER_SHA256_AARCH64=7f4162bdc4f62fe6482a7f5158892b2f0fc2f071f1d80f6fbc4989a351cb19fa
ARG CUA_DRIVER_SHA256_X86_64=9b8ef76b1cab76de2ea0804f77b5ccd6fe7403a2a26d0249fd3a7aa8acb0250a

LABEL org.opencontainers.image.title="cua-agent-desktop" \
      org.opencontainers.image.description="Isolated Linux desktop for AI agents via Cua Driver MCP + noVNC" \
      cua.agent.desktop.managed="true" \
      cua.agent.desktop.driver.version="0.38.0" \
      cua.agent.desktop.base.digest="sha256:274eb636f5cf3fc58f705916ee72b7a701270b3877369d08533a385c5325be9b"

# Edge / remote defaults (Railway injects PORT; set MCP_API_KEY in the service)
ENV PORT=8080 \
    MCP_GATEWAY_PORT=8200 \
    MCP_API_KEY= \
    REQUIRE_MCP_API_KEY=0 \
    RAILWAY_ENVIRONMENT= \
    CUA_DRIVER_RS_TELEMETRY_ENABLED=0

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
# Wrapper adds --no-sandbox flags required under cap_drop ALL.
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

RUN set -eux; \
    case "${TARGETARCH}" in \
      arm64|aarch64) arch=aarch64; sha="${CUA_DRIVER_SHA256_AARCH64}"; \
        url="https://files.pythonhosted.org/packages/01/27/b06921ff828c41c9be25de3509f200033b3ba2fd558447d3e262b5329b25/cua_driver-${CUA_DRIVER_VERSION}-py3-none-manylinux_2_31_${arch}.whl" ;; \
      amd64|x86_64)  arch=x86_64;  sha="${CUA_DRIVER_SHA256_X86_64}"; \
        url="https://files.pythonhosted.org/packages/db/82/7594803d8794fd3d5a6d8d459174885b844276a525832e0532af14eaaebb/cua_driver-${CUA_DRIVER_VERSION}-py3-none-manylinux_2_31_${arch}.whl" ;; \
      *) echo "unsupported TARGETARCH=${TARGETARCH}" >&2; exit 1 ;; \
    esac; \
    wheel="cua_driver-${CUA_DRIVER_VERSION}-py3-none-manylinux_2_31_${arch}.whl"; \
    mkdir -p /tmp/wheels; \
    cd /tmp/wheels; \
    curl -fsSL -o "${wheel}" "${url}"; \
    echo "${sha}  ${wheel}" | sha256sum -c -; \
    if [ -x /opt/venv/bin/pip ]; then \
      /opt/venv/bin/pip install --force-reinstall --no-deps "${wheel}"; \
    else \
      uv pip install --python /opt/venv/bin/python3 --force-reinstall --no-deps "${wheel}"; \
    fi; \
    install -d -m 0755 /usr/local/libexec/cua-desktop; \
    bin_path="$(/opt/venv/bin/python3 -c 'from cua_driver import get_binary_path; print(get_binary_path())')"; \
    cp -a "${bin_path}" /usr/local/libexec/cua-desktop/cua-driver; \
    chmod 0755 /usr/local/libexec/cua-desktop/cua-driver; \
    ln -sfn /usr/local/libexec/cua-desktop/cua-driver /usr/local/bin/cua-driver; \
    /usr/local/libexec/cua-desktop/cua-driver --version | tee /tmp/cua-driver-version.txt; \
    grep -F "${CUA_DRIVER_VERSION}" /tmp/cua-driver-version.txt; \
    install -d -o cua -g cua -m 0700 /run/user/1000; \
    install -d -o cua -g cua -m 0755 /home/cua/workspace; \
    rm -rf /tmp/wheels /tmp/cua-driver-version.txt

COPY image/start-cua-driver.sh /usr/local/bin/start-cua-driver.sh
COPY image/start-mcp-gateway.sh /usr/local/bin/start-mcp-gateway.sh
COPY image/start-edge-proxy.sh /usr/local/bin/start-edge-proxy.sh
COPY image/Caddyfile /etc/caddy/Caddyfile
COPY image/cua-driver.conf /etc/supervisor/conf.d/cua-driver.conf
COPY image/mcp-gateway.conf /etc/supervisor/conf.d/mcp-gateway.conf
COPY image/edge-proxy.conf /etc/supervisor/conf.d/edge-proxy.conf

RUN chmod 0755 \
      /usr/local/bin/start-cua-driver.sh \
      /usr/local/bin/start-mcp-gateway.sh \
      /usr/local/bin/start-edge-proxy.sh \
 && for conf in cua-driver mcp-gateway edge-proxy; do \
      if [ -f /etc/supervisor/conf.d/supervisord.conf ] \
         && ! grep -q "\\[program:${conf}\\]" /etc/supervisor/conf.d/supervisord.conf; then \
        printf '\n' >> /etc/supervisor/conf.d/supervisord.conf; \
        cat "/etc/supervisor/conf.d/${conf}.conf" >> /etc/supervisor/conf.d/supervisord.conf; \
      fi; \
    done \
 && if [ -f /etc/supervisor/supervisord.conf ] \
      && ! grep -q 'files *= */etc/supervisor/conf.d' /etc/supervisor/supervisord.conf \
      && ! grep -q '\\[program:cua-driver\\]' /etc/supervisor/supervisord.conf; then \
      printf '\n[include]\nfiles = /etc/supervisor/conf.d/*.conf\n' >> /etc/supervisor/supervisord.conf; \
    fi

EXPOSE 8080

# Base image CMD already starts supervisord; edge + MCP programs are registered above.
