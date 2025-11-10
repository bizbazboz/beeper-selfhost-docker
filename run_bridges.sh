#!/usr/bin/env bash
set -euo pipefail

bbctl run beeper &

bbctl run sh-telegram &
bbctl run sh-whatsapp &
bbctl run sh-signal &
bbctl run sh-discord &
bbctl run sh-slack &
bbctl run sh-gmessages &
bbctl run sh-gvoice &
bbctl run sh-meta &
bbctl run sh-googlechat &
bbctl run sh-twitter &
bbctl run sh-bluesky &
bbctl run sh-imessage &
bbctl run sh-linkedin &
bbctl run sh-heisenbridge &

wait
