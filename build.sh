#!/bin/bash

# 设置过期日期（一个月前）
EXPIRY_DATE="2025-09-01"

# 创建临时目录存放旧文章
mkdir -p temp_drafts

# 移动旧文章到临时目录
echo "移动 $EXPIRY_DATE 之前的文章到临时目录..."
find content/tech_news -name "*.md" -type f -exec grep -l "date:.*2025-0[5-8]" {} \; | while read file; do
  mkdir -p "temp_drafts/$(dirname "$file")"
  mv "$file" "temp_drafts/$file"
  echo "已移动: $file"
done

find content/teen_news -name "*.md" -type f -exec grep -l "date:.*2025-0[5-8]" {} \; | while read file; do
  mkdir -p "temp_drafts/$(dirname "$file")"
  mv "$file" "temp_drafts/$file"
  echo "已移动: $file"
done

# 移动对应的MP3文件
echo "移动对应的MP3文件..."
find temp_drafts -name "*.md" | while read file; do
  # 从文件路径提取日期
  filename=$(basename "$file" .md)
  mp3_path="static/mp3/teen_news/${filename}.cn.mp3"
  mp3_en_path="static/mp3/teen_news/${filename}.en.mp3"
  
  if [ -f "$mp3_path" ]; then
    mkdir -p "temp_drafts/static/mp3/teen_news"
    mv "$mp3_path" "temp_drafts/$mp3_path"
    echo "已移动: $mp3_path"
  fi
  
  if [ -f "$mp3_en_path" ]; then
    mkdir -p "temp_drafts/static/mp3/teen_news"
    mv "$mp3_en_path" "temp_drafts/$mp3_en_path"
    echo "已移动: $mp3_en_path"
  fi
done

# 构建网站
echo "开始构建网站..."
hugo --gc --minify

# 恢复文章和MP3文件
echo "恢复文章和MP3文件..."
if [ -d "temp_drafts/content" ]; then
  cp -r temp_drafts/content/* content/
fi
if [ -d "temp_drafts/static" ]; then
  cp -r temp_drafts/static/* static/
fi

# 清理临时目录
rm -rf temp_drafts

echo "构建完成！"