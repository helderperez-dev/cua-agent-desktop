# reavion/xfce

Reavion fork of Cua `libs/xfce-cua`: application-neutral XFCE desktop with
TigerVNC + noVNC. Built for `linux/amd64` and `linux/arm64`.

Does **not** ship a computer-use driver. Seat images install `reavion-driver`.

## Build

```bash
../../scripts/build.sh xfce
```

## Run

```bash
docker run --rm \
  -p 6901:6901 \
  -e VNC_PW=changeme \
  reavion/xfce:local
```

Open http://localhost:6901/vnc.html
