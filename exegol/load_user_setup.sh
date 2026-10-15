#!/bin/bash

# Install starship prompt
if ! command -v starship &>/dev/null; then
    curl -fsSL https://starship.rs/install.sh | sh -s -- -y -b /usr/local/bin || echo "[!] starship install failed"
fi

# Install eza + bat
apt-get update -qq 2>/dev/null
apt-get install -y -qq eza bat 2>/dev/null || true

# Copy starship config
mkdir -p /root/.config
cp /opt/my-resources/setup/starship.toml /root/.config/starship.toml 2>/dev/null || true

echo "[+] h4shdumb setup done"
