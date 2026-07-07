#!/usr/bin/env bash
# Collects every <problem-set>/main.pdf into _site/ alongside a generated index.html.
set -euo pipefail
shopt -s nullglob

rm -rf _site
mkdir -p _site

rows=""
count=0
for pdf in */main.pdf; do
  [[ "$pdf" == _template/* ]] && continue
  dir=$(dirname "$pdf")
  title=$(echo "$dir" | sed -E 's/-/ /g; s/\b(\w)/\u\1/g')
  cp "$pdf" "_site/${dir}.pdf"
  rows+="<li><a href=\"${dir}.pdf\">${title}</a></li>\n"
  count=$((count + 1))
done

cat > _site/index.html <<HTML
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Problem Sets</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
  body { font-family: system-ui, sans-serif; max-width: 40rem; margin: 3rem auto; padding: 0 1rem; }
  h1 { font-size: 1.5rem; }
  ul { line-height: 2; padding-left: 1.2rem; }
  a { color: #2563eb; text-decoration: none; }
  a:hover { text-decoration: underline; }
</style>
</head>
<body>
<h1>Problem Sets</h1>
<ul>
$(echo -e "$rows")
</ul>
</body>
</html>
HTML

echo "Built _site with $count PDF(s)."
