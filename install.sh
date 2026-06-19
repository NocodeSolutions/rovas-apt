#!/usr/bin/env bash
set -euo pipefail

if [[ "$(id -u)" -ne 0 ]]; then
  echo "Run as root: curl -fsSL https://nocodesolutions.github.io/rovas-apt/install.sh | sudo bash" >&2
  exit 1
fi

cat > /etc/apt/sources.list.d/rovas-tools.list <<'LIST'
deb [trusted=yes arch=all] https://nocodesolutions.github.io/rovas-apt stable main
LIST

apt-get update
apt-get install -y rovas-tools
