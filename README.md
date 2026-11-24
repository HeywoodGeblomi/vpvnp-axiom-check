# vpvnp-axiom-check

Author: Heywood Geblomi. Public snapshot built 24 November 2026.

## What this is

A reproduction of the axiom check on the VP vs VNP formalization in [anthropics/formal-math](https://github.com/anthropics/formal-math), directory `vp-vnp`, at commit `11b6c7e`. This repo does not contain Mathlib, a Lean cache, or a copy of that upstream source. Clone formal-math yourself if you want to replay the check.

This is a reproduction of the axiom check, not a review of the math. An expert human read is still open.

## What we ran

We built `vp-vnp` at commit `11b6c7e` with Lean 4.33.1 and the Mathlib cache.

- `cache_exit=0`
- `build_exit=0`
- `axioms_exit=0`

`Statement.lean` sha256: `f090345dafa13c7629ff0c0737bb1c2fe5d60e8b2d08372281cbb2e65b506ffd`

The five Solution theorems depend only on `propext`, `Classical.choice`, and `Quot.sound`:

- `Solution.mainTheorem`
- `Solution.mainTheoremApprox`
- `Solution.separation`
- `Solution.separationClosure`
- `Solution.permanent_over_real`

The only `sorry` warnings came from `Challenge.lean` (five declarations).

The recorded log is `run.log` (one machine home path was rewritten to `$HOME` for this public copy). `run.sh` is the same check, with paths made relative so it can be pointed at a local `vp-vnp` checkout via `VP_VNP`.

`grade_vs_link_checklist_v1.md` is a statement-only grade against a teammate checklist, written before a local build. It is not a review of the proofs.

## How to replay

```
git clone https://github.com/anthropics/formal-math
git -C formal-math checkout 11b6c7e
VP_VNP=formal-math/vp-vnp ./run.sh
```

Then compare `build_exit`, `axioms_exit`, the five axiom lines, and the `Statement.lean` hash with `run.log`.
