# Notes

- Values in this UI are internally consistent (no token drift, no obvious magic numbers).
- There is no declared scale: no base unit, no step ladder, no stated exception policy.
- The expected answer should classify this as an `undeclared scale` finding with appropriate severity (mid, since internal consistency is high), not as token drift or spacing scale breakdown.
- A correct answer identifies the absence of declaration as the problem, not the presence of inconsistency.
