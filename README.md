# cua-agent-desktop

Isolated Linux desktop sandbox for AI agents: XFCE runs inside Docker, **Cua Driver** exposes computer-use tools over MCP, and a human can watch or take over via **noVNC** in a browser.

Locally you can use a stdio MCP bridge. For **Railway / remote**, the same container exposes **Streamable HTTP MCP** and noVNC behind Caddy on a single `$PORT`.

## Requirements

- Docker Desktop / Engine (or Podman with `CUA_RUNTIME=podman`)
- ~4 GB RAM reserved for the container (compose sets `mem_limit: 4g`)
- macOS, Linux, or Windows with a working Docker CLI

## Quick start (local)

```bash
cp .env.example .env   # set VNC_PW (and optionally MCP_API_KEY)
./scripts/build.sh
./scripts/up.sh
open http://127.0.0.1:6080/vnc.html   # password = VNC_PW
```

- Viewer + MCP edge: `http://127.0.0.1:6080` (Caddy → noVNC + `/mcp`)
- Local stdio MCP: `scripts/mcp-bridge.sh` (Cursor project example in `.cursor/mcp.json.example`)

```bash
./scripts/status.sh
./scripts/down.sh   # keeps ./workspace and ./data/chrome-profile
```

Google Chrome is the default browser. Profile (cookies/logins) persists at `./data/chrome-profile`.

## Connect MCP

### Local stdio (Cursor / Claude / Codex)

Point the client at `scripts/mcp-bridge.sh` — see `.cursor/mcp.json.example` and `configs/*-mcp.example.*`.

### Remote HTTP (Railway or local edge)

```json
{
  "mcpServers": {
    "cua-desktop": {
      "url": "https://YOUR-SERVICE.up.railway.app/mcp",
      "headers": {
        "Authorization": "Bearer YOUR_MCP_API_KEY"
      }
    }
  }
}
```

Examples: `configs/cursor-mcp.remote.example.json`, `configs/claude-mcp.remote.example.json`, `configs/codex-mcp.remote.example.toml`.

Local edge equivalent: `http://127.0.0.1:6080/mcp` (set `MCP_API_KEY` in `.env`).

## Deploy on Railway

See **[docs/railway.md](docs/railway.md)**. Summary:

1. Deploy this repo (Dockerfile / `railway.toml`)
2. Set `VNC_PW`, `MCP_API_KEY`, `REQUIRE_MCP_API_KEY=1`
3. ≥4 GB memory; optional volumes for Chrome profile + workspace
4. Open `https://<domain>/vnc.html` and point MCP clients at `https://<domain>/mcp`

## Architecture

```text
Client (browser / MCP HTTP)
        │
        ▼
   Caddy :$PORT
     ├─ /vnc.html  → noVNC :6901
     └─ /mcp       → supergateway → cua-driver mcp (unix socket)
```

More detail: [docs/architecture.md](docs/architecture.md).

## Security notes

- **Local compose** publishes **`127.0.0.1:6080` only**.
- **Railway** exposes the service publicly — use a strong `VNC_PW` and required `MCP_API_KEY`.
- Docker group ≈ host root; workspace/profile mounts are convenience, not multi-tenant isolation.
- Compose drops capabilities (`cap_drop: ALL`) and adds `SETUID` / `SETGID`. No `--privileged`, no Docker socket mount.

## Troubleshooting

| Symptom | What to try |
|---|---|
| Container / socket not ready | `./scripts/status.sh`; `docker exec cua-agent-desktop supervisorctl status` |
| `/health` fails | Wait for Caddy; check `edge-proxy` logs |
| MCP HTTP 401 | Set matching `MCP_API_KEY` / Bearer header |
| VNC password rejected | `VNC_PW` in `.env` / Railway vars; recreate container after change |
| Local stdio bridge fails | Container running + socket ready; use absolute path in mcp.json |

## License / attribution

- This harness: [MIT](LICENSE).
- [Cua Driver](https://cua.ai/docs/cua-driver/quickstart) and `trycua/xfce-cua` — [trycua](https://github.com/trycua/cua).
- noVNC is bundled in the base image; [supergateway](https://github.com/supercorp-ai/supergateway) bridges stdio MCP to HTTP.
