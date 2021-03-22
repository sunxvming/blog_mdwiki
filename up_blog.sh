#!/bin/sh

python3 md_file_tree.py

git add -A
git commit -m "update blog"
git push origin master





