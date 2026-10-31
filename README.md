# JSP-000301 Lean Formalization

## Overview

This repository contains a Lean 4 formalization of a counterexample to JSP-000301 in the Justin Sun Prize problem catalog.

**Problem:** If two consecutive positive integers are powerful, must at least one be a perfect square?

The answer is no.

## Mathematical Solution

Solomon W. Golomb provided a counterexample in 1970.

The two consecutive integers are:

- 12167 = 23³
- 12168 = 2³ × 3² × 13²

Both integers are powerful numbers, but neither is a perfect square.

Indeed,

110² = 12100 < 12167 < 12168 < 12321 = 111².

This disproves the conjecture.

## Lean Formalization

Proof file: `JSP000301.lean`

Main theorem:

`JSP000301.conjecture_false`

The theorem establishes the negation of the original conjecture for positive natural numbers.

The proof formalizes the powerful-number property, verifies the counterexample and proves that neither integer is a square.

## Environment

- Lean version: 4.29.1
- Mathlib: v4.29.1
- Toolchain: `lean-toolchain`
- Project configuration: `lakefile.toml`
- Dependency lockfile: `lake-manifest.json`

## Reproduction

Clone the repository:

```bash
git clone https://github.com/Rking00/JSP-000301-Lean.git
cd JSP-000301-Lean
```

With Lean and Lake installed, run:

```bash
lake exe cache get
lake build
lake env lean JSP000301.lean
```

The last command checks the proof file and prints the theorem's axiom dependencies.

## Axiom Audit

The proof file contains:

```lean
#print axioms JSP000301.conjecture_false
```

The axiom audit can be reproduced by running:

```bash
lake env lean JSP000301.lean
```

The reported dependencies should be independently inspected during verification.

## Verification

The repository uses GitHub Actions to build and check the Lean formalization.

Successful CI run:

https://github.com/Rking00/JSP-000301-Lean/actions/runs/41199232777

This successful build does not constitute official prize verification or acceptance.

## Attribution

Original mathematical counterexample: Solomon W. Golomb (1970).

Formalization repository maintained and submitted by GitHub user Rking00, with AI assistance during proof development.

Authorship, priority and prize eligibility remain subject to independent review by the Justin Sun Prize organizers.
