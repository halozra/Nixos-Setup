#!/usr/bin/env fish

# ==========================================
# NIXOS AUTOMATED BUILD TEST
# ==========================================

set -l FLAKE ".#halozra"
set -l START_TIME (date +%s)

echo ""
echo "=========================================="
echo "       NIXOS CONFIGURATION TEST"
echo "=========================================="

# 1. Check dependencies
echo ""
echo "[1/3] Checking dependencies..."

for cmd in git nix sudo
    if not command -q $cmd
        echo "ERROR: $cmd is not installed."
        exit 1
    end
end

echo "Dependencies OK."

# 2. Git validation
echo ""
echo "[2/3] Checking Git repository..."

git rev-parse --is-inside-work-tree >/dev/null 2>&1
or begin
    echo "ERROR: Not inside a Git repository."
    exit 1
end

git status --short
or exit 1

# 3. Flake validation
echo ""
echo "[3/3] Validating Flake..."

nix flake check --no-build
or begin
    echo "ERROR: Flake validation failed."
    exit 1
end

# 4. Build
echo ""
echo "[4/4] Building NixOS configuration..."

sudo nixos-rebuild build --flake $FLAKE
or begin
    echo "BUILD FAILED!"
    exit 1
end

# Report
set -l END_TIME (date +%s)
set -l DURATION (math $END_TIME - $START_TIME)

echo ""
echo "=========================================="
echo "       BUILD TEST COMPLETED"
echo "=========================================="

echo "SUCCESS!"
echo "Duration: $DURATION seconds"
echo "Flake: $FLAKE"
echo "System switch: NOT PERFORMED"
