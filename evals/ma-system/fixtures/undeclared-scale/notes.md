# Notes

- Values in this UI use a mix of sizes (24, 32, 16, 12, 10, 14, 6, 8, 20) without a declared scale system.
- There is no declared scale: no base unit, no step ladder, no stated exception policy.
- The expected answer should classify this as an `undeclared scale` finding. Severity depends on internal consistency: mid if the evaluator sees a coherent pattern, high if values appear scattered.
- A correct answer identifies the absence of declaration as the problem, not the presence of inconsistency.
