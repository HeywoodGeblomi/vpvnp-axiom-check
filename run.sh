#!/usr/bin/env bash
set -uo pipefail
# Path-cleaned public copy of the 23-24 Nov 2026 axiom-check script.
# Point VP_VNP at a local checkout of anthropics/formal-math vp-vnp (commit 11b6c7e).
LOG=${LOG:-./run.log}
VP_VNP=${VP_VNP:-./vp-vnp}
exec > >(tee -a "$LOG") 2>&1
echo "== start $(date)"
if ! command -v elan >/dev/null && [ ! -x "$HOME/.elan/bin/elan" ]; then
  curl -sSfL https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -o /tmp/elan-init.sh && sh /tmp/elan-init.sh -y --default-toolchain none
fi
export PATH="$HOME/.elan/bin:$PATH"
cd "$VP_VNP"
echo "== sha256 Statement.lean: $(sha256sum Statement.lean)"
echo "== cache get $(date)"; lake exe cache get; echo "cache_exit=$?"
echo "== build $(date)"; lake build; echo "build_exit=$?"
echo "== axioms $(date)"; lake env lean scripts/PrintAxioms.lean; echo "axioms_exit=$?"
echo "== end $(date)"
