# Beeper Selfhost Docker

Lightweight Docker image for running the Beeper Bridge Manager CLI (`bbctl`) and the default self-hosted bridge set. The image targets both `linux/amd64` and `linux/arm64`, downloading the matching `bbctl` release during the build.

## Highlights
- Multi-architecture build based on Ubuntu 24.04 with Python 3, `python3-venv`, and `ffmpeg`
- `run_bridges.sh` launches `bbctl run beeper` followed by the bundled bridge list
- `docker_entrypoint.sh` executes the bridge launcher and keeps the container alive for inspection
- Published image available at `ghcr.io/bizbazboz/beeper-selfhost-docker:latest`

## Quick Start (GHCR)
Run the published image directly from GitHub Container Registry:

```bash
docker run -d \
  --name bbctl_container \
  ghcr.io/bizbazboz/beeper-selfhost-docker:latest
```

- Follow logs: `docker logs -f beeper-selfhost`
- Inspect bridge status: `docker exec -it beeper-selfhost bbctl status`

> Tip: mount your Beeper config or secrets into the container with `-v path\to\config:/root/.config/beeper` if your bridges need them.

## Building Locally
Clone this repository and build the image yourself:

```bash
docker build -t ghcr.io/bizbazboz/beeper-selfhost-docker:local .
```

Run the local build using the same `docker run` command, swapping the tag for `:local`.

## Customising Bridges
The default bridge order lives in `run_bridges.sh`. Edit the array to add or remove bridges, then rebuild the image. The entrypoint script (`docker_entrypoint.sh`) invokes the bridge launcher and then sleeps in a loop so the container stays available for interactive troubleshooting.

## Keeping `bbctl` Fresh
Each build downloads the latest `bbctl` from `https://github.com/beeper/bridge-manager`. Rebuild locally, or pull the newest tag from GHCR, to pick up upstream updates for your architecture automatically.
