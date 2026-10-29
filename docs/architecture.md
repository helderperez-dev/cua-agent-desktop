# Architecture

## Overview

```text
Browser / MCP HTTP client
        │
        ▼
┌─ Edge (Caddy :$PORT) ──────────────────────────────────────┐
│  /vnc.html  → noVNC :6901                                  │
│  /mcp       → supergateway :8200                           │
│  /health    → ok                                           │
└────────────────────────────────────────────────────────────┘
        │                              │
        ▼                              ▼
┌─ Linux desktop container ──────────────────────────────────┐
│  XFCE on DISPLAY=:1                                        │
│  cua-driver serve --socket /run/user/1000/cua.sock         │
│  Chrome profile → /home/cua/.config/google-chrome          │
│  workspace → /home/cua/workspace                           │
└────────────────────────────────────────────────────────────┘

Local optional path (stdio):
  MCP client → scripts/mcp-bridge.sh → docker exec → cua-driver mcp
```

## Ownership

| Component | Owns |
|---|---|
| This project | Image build, lifecycle, edge proxy, MCP HTTP gateway, Chrome + profile volume |
| Cua Driver | Screenshots, clicks, typing, window discovery (MCP tools) |
| Base image (`trycua/xfce-cua`) | XFCE + noVNC stack |
| Supergateway | stdio MCP → Streamable HTTP |

## Agent path vs human viewer path

**Agent (remote):** MCP client → `https://…/mcp` (Bearer `MCP_API_KEY`) → Caddy → supergateway → `cua-driver mcp` → unix socket → `cua-driver serve` on `DISPLAY=:1`.

**Agent (local stdio):** MCP client → `scripts/mcp-bridge.sh` → `docker exec` → same `cua-driver mcp`.

**Human:** Browser → `/vnc.html` → noVNC → same XFCE desktop. Password = `VNC_PW`.

## Security boundaries

- Local compose: viewer/MCP edge on `127.0.0.1` only.
- Railway: public HTTPS via Railway edge; require strong `VNC_PW` + `MCP_API_KEY`.
- Workspace / Chrome profile mounts are convenience, not a hostile multi-tenant sandbox.
