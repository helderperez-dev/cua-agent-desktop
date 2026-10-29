# Deploy on Railway

One service runs the full stack: XFCE desktop, Cua Driver, noVNC, and a **remote MCP** gateway (Streamable HTTP — not stdio). Caddy listens on Railway’s `$PORT` and routes:

| Path | Backend |
|---|---|
| `/` / `/vnc.html` | noVNC desktop viewer |
| `/mcp` | MCP Streamable HTTP (supergateway → `cua-driver mcp`) |
| `/health` | liveness (`ok`) |

## 1. Create the service

1. New Railway project → Deploy from GitHub (`cua-agent-desktop`).
2. Builder: Dockerfile (see `railway.toml`).
3. Generate a public domain; target port **8080** (or whatever `$PORT` Railway assigns — the app reads `PORT`).

## 2. Required variables

| Variable | Notes |
|---|---|
| `VNC_PW` | Strong password for noVNC (not `changeme`) |
| `MCP_API_KEY` | Long random secret; clients send `Authorization: Bearer <key>` |
| `REQUIRE_MCP_API_KEY` | Set to `1` on Railway |
| `PORT` | Set by Railway automatically |

Optional:

| Variable | Default | Notes |
|---|---|---|
| `MCP_GATEWAY_PORT` | `8200` | Internal only |

## 3. Resources

- Memory: **≥ 4 GB** (XFCE + Chrome)
- Persistent volumes (recommended):
  - mount → `/home/cua/.config/google-chrome` (cookies / profile)
  - mount → `/home/cua/workspace` (shared files)

## 4. Connect the viewer

Open:

`https://<your-railway-domain>/vnc.html`

Password = `VNC_PW`.

## 5. Connect MCP remotely (Cursor / Claude / Codex)

Use Streamable HTTP (not the local stdio bridge):

```json
{
  "mcpServers": {
    "cua-desktop": {
      "url": "https://<your-railway-domain>/mcp",
      "headers": {
        "Authorization": "Bearer <MCP_API_KEY>"
      }
    }
  }
}
```

Example files:

- [`configs/cursor-mcp.remote.example.json`](../configs/cursor-mcp.remote.example.json)
- [`configs/claude-mcp.remote.example.json`](../configs/claude-mcp.remote.example.json)

## 6. Security

- Anyone with the public URL can reach the viewer path; protect with a strong `VNC_PW`.
- MCP requires `MCP_API_KEY` when `REQUIRE_MCP_API_KEY=1` or `RAILWAY_ENVIRONMENT` is set.
- This is a full desktop in the cloud — treat it like a privileged workstation, not a multi-tenant sandbox.
