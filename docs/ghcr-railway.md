# GHCR + Railway cutover

## Done in CI

- `REAVION_DISPATCH_TOKEN` set on cascade repos (`repo` + `write:packages`)
- Seat/images Actions log into GHCR with that token so private sibling images pull
- Control plane defaults: `MACHINE_SOURCE_IMAGE=ghcr.io/helderperez-dev/reavion-desktop:main`
- Volume remount helper: `reavion-app-backend/scripts/migrate_volume_mounts.py`

## You still need (manual, ~2 minutes)

### 1. Optional: make packages public

Opened package settings tabs. For each of `reavion-desktop`, `reavion-xfce`, `reavion-driver`, `reavion-vnc`:

Package settings → Danger Zone → Change visibility → **Public**

(OAuth tokens cannot change visibility via API; UI or a classic PAT is required. Public is irreversible.)

### 2. Railway registry credentials

Template / seat service → Settings → add private registry:

| Field | Value |
|---|---|
| Host | `ghcr.io` |
| Username | `helderperez-dev` |
| Password | GitHub PAT with `read:packages` (or reuse dispatch token) |

Point the service at image `ghcr.io/helderperez-dev/reavion-desktop:main` (or rely on control-plane `MACHINE_SOURCE_IMAGE`).

### 3. Volume remount + API token

1. Put `RAILWAY_API_TOKEN=...` in `reavion-app-backend/.env` (Railway → Account → Tokens).
2. Dry-run: `cd reavion-app-backend && python scripts/migrate_volume_mounts.py`
3. Apply: `python scripts/migrate_volume_mounts.py --apply`  
   **Warning:** recreate mounts are empty — copy Chrome profile out first if you need cookies.

4. Redeploy seats after remount.

## Railway Hobby workaround (active)

Private GHCR pulls need Railway **Pro** registry credentials. Until packages are public or Pro is enabled:

- Seats/template build from GitHub with `dockerfilePath=Dockerfile.vendor` (no GHCR `FROM`)
- Control plane: leave `MACHINE_SOURCE_IMAGE` empty so new seats use `MACHINE_SOURCE_REPO`
- `cua-agent-desktop` was set **public** so Railway can clone; GHCR packages remain private

