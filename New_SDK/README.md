# Benchmark Comparison

This document compares the performance of the dual‑threaded and single‑threaded implementations. All times are in the same time units as reported by the logs (e.g., microseconds). Speedup is computed as:

---

A value **>1** means the single‑threaded run was faster; **<1** means it was slower.

---

## Results Summary

| Operation         | Single‑Thread Time | Dual‑Thread Time | Speedup (×) |
|-------------------|--------------------|------------------|-------------|
| **Key Generation**| 7,773,088          | 14,717,960       | 0.53×       |
| **Encryption**    | 9,858,705          | 15,131,693       | 0.65×       |
| **Decryption**    | 5,339,063          | 9,292,755        | 0.57×       |

---
