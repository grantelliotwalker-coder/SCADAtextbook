# Principia SCADA

**The Principles of the SCADA Technician** — a vendor-neutral textbook for becoming an excellent SCADA technician, by Grant Walker.

**Read it:** [`Principia_SCADA.pdf`](Principia_SCADA.pdf) (80 pages)

## Contents

- **Part I. Foundations** — what SCADA is; signals and instruments; points, quality and time
- **Part II. Communications** — field protocols (Modbus, DNP3, IEC 60870-5); MQTT and Sparkplug B; OPC, gateways and edge systems; IEC 61850; industrial networks, timing and redundancy
- **Part III. The SCADA System** — servers, scale and redundancy; HMI design and alarm management; historians and the Unified Namespace; process control from PID to APC; scripting, APIs and configuration as code; virtual PLCs and AI
- **Part IV. Security** — cryptography; securing the protocols; IEC 62443 and secure architecture; real attacks and the kill chain; patching, vulnerabilities and the law (EU CRA, Australian SOCI)
- **Part V. The Working Technician** — commissioning, testing (FAT, SAT, ITP) and fault-finding
- **Appendices** — key formulas, study plan and self-test, glossary and sources, questions to ask a vendor

Each chapter follows the Principia method: definitions, laws, rules, worked examples, on-site notes and exercises with answers. Products such as Geo SCADA, AVEVA PI, AVEVA OMI and Kepware appear only as worked examples.

## Building

The book is written in LaTeX (`src/`). To rebuild the PDF:

```bash
./build.sh
```

Requires XeLaTeX, the DejaVu fonts, Latin Modern Math and Python 3.

## Accuracy

Product, legal and incident facts were checked on 16 and 19 November 2026 (see Appendix C). Standards and laws change: confirm against the current primary source before relying on them formally.
