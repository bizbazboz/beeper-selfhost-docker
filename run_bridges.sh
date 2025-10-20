#!/usr/bin/env bash
set -euo pipefail

bridges=(
  sh-telegram
  sh-whatsapp
  sh-signal
  sh-discord
  sh-slack
  sh-gmessages
  sh-gvoice
  sh-meta
  sh-googlechat
  sh-twitter
  sh-bluesky
  sh-imessage
  sh-linkedin
  sh-heisenbridge
)

echo "Starting Beeper..."
bbctl run beeper

for bridge in "${bridges[@]}"; do
  echo "Starting bridge ${bridge}..."
  bbctl run "${bridge}"
done
