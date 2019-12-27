#!/usr/bin/env bash

read -p "論文の変更点を記入: " msg

git add .
git commit -m $msg
git push -u origin master
