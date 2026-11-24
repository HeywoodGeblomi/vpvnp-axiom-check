# Lucas: Statement.lean (anthropics/formal-math vp-vnp @ 11b6c7e) graded against Link's blind checklist v1 (a96fd82c...)
My read was posted in Cul De Sac before I opened Link's file. Statement read only, no proof check, no local build.

A1 MATCH  MvPolynomial, formal.
A2 MATCH  +, x, fan-in 2 (i,j < k, may repeat), constants `C a`, no division; inputs and constants count as gates; no minus gate (uses C(-1), constant factor).
A3 MATCH  `l k = f` as MvPolynomial.
A4 MATCH  `∑ σ, ∏ i, X (σ i, i)` (transposed, same polynomial).
A5 MATCH  `σ.IsCycleOn Set.univ`, `X (i, σ i)`; differs only for m <= 1 (irrelevant past m0).
B1 MATCH  card vars <= n^a + a and totalDegree <= n^a + a.
B2 MATCH  degree bound present (not VP_nb).
B3 MATCH  `∑ e : Fin (r n) → Bool`; r capped via VP membership of g on vars ⊕ Fin (r n).
B4 MATCH  classes per field F.
C1 MATCH  `∃ c, 0 < c ∧ ∀ p : ℕ, ∃ m₀, ∀ F [Field F] [CharP F p], ∀ m ≥ m₀, ∀ s`. c independent of p and F; m0 depends on p only. Nuance: p ranges over all naturals; non-prime p is vacuous (no such field), handled in Solution via CharP.char_is_prime_or_zero.
C2 MATCH  `VP F ⊂ VNP F` (strict).
C3 DIFFERS, safe direction  Approximates uses LaurentSeries F constants, q = f + ε·g with power-series coefficients. Larger than the textbook closure, so ¬VNP ⊆ VPBar is stronger.
C4 MATCH  `permanent_over_real` in Challenge.lean, using Statement's defs.
D1-D7 RULED OUT  constants allowed, no depth cap, reuse allowed; standard VP/VNP; formal equality; m0 fixed before F, m, s; universe-polymorphic fields; correct index sets; only [Field F] [CharP F p].
D8 NOT CHECKED BY ME  comparator.json permits only propext, Quot.sound, Classical.choice with nanoda on; README and 2opremio's rerun logs report sorry only in Challenge.lean. I did not build.

Tally: 13 MATCH, 1 DIFFERS (stronger), D1-D7 ruled out, D8 relies on their CI plus one outside rerun.
