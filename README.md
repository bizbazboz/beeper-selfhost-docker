# Beeper Selfhost

## Overview

This Dockerfile builds a lightweight container environment that:
- Automatically installs Python 3, `python3-venv`, and `ffmpeg`
- Downloads and runs the latest platform-appropriate version of `bbctl` (Beeper Bridge Manager CLI)
- Keeps the container alive indefinitely for interactive CLI use

It supports multiple CPU architectures, including `amd64` and `arm64`, and auto-selects the correct binary at runtime.

---

## Features

- 🧩 **Multi-architecture support** — automatically detects host architecture and fetches the matching binary  
- 🐍 **Python environment** — includes `python3`, `python3-venv`, and `ffmpeg` preinstalled  
- 💻 **Interactive shell** — container stays alive indefinitely, allowing you to attach and run commands manually  
- 🔁 **Self-contained runtime** — no need to install anything on your host except Docker  

---

## Build Instructions

To build the Docker image locally:

```bash
docker build -t bbctl-container .
