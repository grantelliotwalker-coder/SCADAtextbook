#!/bin/bash
# Builds Principia_SCADA.pdf from src/ with XeLaTeX.
# Needs: xelatex, DejaVu fonts, Latin Modern Math, python3.
set -e
cd "$(dirname "$0")/src"
touch tocbody.tex
for i in 1 2 3; do
  xelatex -interaction=nonstopmode book.tex >/dev/null || true
  python3 - <<'PY'
import re
aux = open('book.aux').read()
entries = re.findall(r"contentsline \{section\}\{([^}]*)\}\{(\d+)\}", aux)
parts = {"Chapter 1.": "Part I. Foundations", "Chapter 4.": "Part II. Communications",
         "Chapter 9.": "Part III. The SCADA System", "Chapter 15.": "Part IV. Security",
         "Chapter 20.": "Part V. The Working Technician", "Appendix A.": "Appendices"}
lines = []
for title, page in entries:
    for key, part in parts.items():
        if title.startswith(key + " "):
            lines.append(r"\tocpart{%s}" % part)
    lines.append(r"\tocentry{%s}{%s}" % (title, page))
open('tocbody.tex', 'w').write("\n".join(lines) + "\n")
PY
done
grep -q "^!" book.log && { grep -A4 "^!" book.log; exit 1; } || true
cp book.pdf ../Principia_SCADA.pdf
echo "Built Principia_SCADA.pdf ($(pdfinfo book.pdf | awk '/Pages/{print $2}') pages)"
