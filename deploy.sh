#!/bin/bash
cd /home/nikchester/hugo-site
echo "🔄 Генерирую сайт..."
hugo --minify
#hugo --cleanDestinationDir

echo "📂 Копирую файлы в /var/www/blog..."
rm -rf /var/www/blog/*
cp -r public/* /var/www/blog/

echo "✅ Готово!"
