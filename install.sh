#!/usr/bin/env bash
set -euo pipefail

if [[ "$(id -u)" -ne 0 ]]; then
  echo "Run as root: curl -fsSL https://nocodesolutions.github.io/rovas-apt/install.sh | sudo bash" >&2
  exit 1
fi

apt-get update
apt-get install -y ca-certificates curl

install -d -m 0755 /usr/share/keyrings
curl -fsSL https://nocodesolutions.github.io/rovas-apt/rovas-tools-archive-keyring.gpg \
  -o /usr/share/keyrings/rovas-tools-archive-keyring.gpg
chmod 0644 /usr/share/keyrings/rovas-tools-archive-keyring.gpg

cat > /etc/apt/sources.list.d/rovas-tools.list <<'LIST'
deb [arch=all signed-by=/usr/share/keyrings/rovas-tools-archive-keyring.gpg] https://nocodesolutions.github.io/rovas-apt stable main
LIST

apt-get update
apt-get install -y rovas-desktop
