#!/usr/bin/env fish

# ==========================================
# NIXOS AUTOMATED BUILD TEST
# ==========================================

set -l FLAKE ".#halozra"
set -l START_TIME (date +%s)

function fail
    echo ""
    set_color red
    echo "BUILD TEST FAILED!"
    set_color normal
    exit 1
end

function success
    set_color green
    echo "SUCCESS!"
    set_color normal
end

echo ""
echo "=========================================="
echo "       NIXOS CONFIGURATION TEST"
echo "=========================================="

# 1. Git status
echo ""
echo "[1/3] Checking Git status..."

if not git rev-parse --is-inside-work-tree >/dev/null 2>&1
    echo "ERROR: Not inside a Git repository."
    fail
end

git status --short

# 2. Flake validation
echo ""
echo "[2/3] Validating Flake..."

nix flake check --no-build
or fail

# 3. Build
echo ""
echo "[3/3] Building NixOS configuration..."

sudo nixos-rebuild build --flake $FLAKE
or fail

# Report
set -l END_TIME (date +%s)
set -l DURATION (math $END_TIME - $START_TIME)

echo ""
echo "=========================================="
echo "       BUILD TEST COMPLETED"
echo "=========================================="

success

echo "Duration: $DURATION seconds"
echo "Flake: $FLAKE"
echo "System switch: NOT PERFORMED"
echo ""
