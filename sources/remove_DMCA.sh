#!/bin/bash
domain="$1"
git checkout -b "$domain"
git grep -l "$domain"|while read file; do git rm "$file"; done
git commit -a -m "remove $domain"
git push -u origin "$domain"
git checkout master
