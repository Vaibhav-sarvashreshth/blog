#!/bin/bash
echo "Starting to update the repo......"

git status
git add .
git commit -m "Comment"
git push origin main


echo "You can see your website here : https://vaibhav-sarvashreshth.github.io/blog/ "