# Use Ubuntu as base
FROM ubuntu:24.04

# Prevent interactive prompts during package installs
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl python3 python3-venv ffmpeg bash && \
    rm -rf /var/lib/apt/lists/*

# Auto-select Linux binary based on architecture
ARG TARGETARCH
RUN if [ "$TARGETARCH" = "amd64" ]; then \
        curl -L -o /usr/local/bin/bbctl https://github.com/beeper/bridge-manager/releases/latest/download/bbctl-linux-amd64; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
        curl -L -o /usr/local/bin/bbctl https://github.com/beeper/bridge-manager/releases/latest/download/bbctl-linux-arm64; \
    else \
        echo "Unsupported architecture: $TARGETARCH" && exit 1; \
    fi && \
    chmod +x /usr/local/bin/bbctl

CMD /usr/local/bin/bbctl --help

# Copy bridge runner script
COPY run_bridges.sh /usr/local/bin/run_bridges.sh
RUN chmod +x /usr/local/bin/run_bridges.sh

# Copy entrypoint script to run bridges then keep container alive
COPY docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
CMD /usr/local/bin/docker_entrypoint.sh
