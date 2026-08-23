# Logical Equivalence Checking (LEC)

## Overview

Logical Equivalence Checking (LEC) was performed using **Cadence Conformal** to verify that the Golden design and the Revised synthesized design are logically equivalent.

The verification compares corresponding primary inputs, primary outputs, flip-flops, and latches between both designs.

---

## LEC Procedure

The following steps were performed during the LEC flow:

1. Process and model the Golden design.
2. Process and model the Revised design.
3. Map corresponding key points between the two designs.
4. Check for unmapped points.
5. Add all mapped comparison points.
6. Perform logical equivalence comparison.
7. Report non-equivalent, aborted, and uncompared points.
8. Generate a detailed verification report.

---

## Design Mapping Results

After setting the system mode to LEC:

```tcl
set system mode lec