#!/bin/bash
# Конвертация всех JPG и PNG в AVIF в текущей папке

for f in *.jpg *.png; do
  [ -f "$f" ] || continue
  echo "Конвертирую: $f"
  ffmpeg -i "$f" -c:v libaom-av1 -crf 30 -b:v 0 "${f%.*}.avif"
done

echo "✅ Конвертация завершена!"
