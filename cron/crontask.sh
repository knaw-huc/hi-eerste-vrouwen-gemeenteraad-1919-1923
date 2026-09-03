#!/usr/bin/env bash
set -x
if [ -d /app/repo/hi-eerste-vrouwen-gemeenteraad-1919-1923/.git ]; then
    cd /app/repo/hi-eerste-vrouwen-gemeenteraad-1919-1923
    git pull
else
    git clone https://github.com/knaw-huc/hi-eerste-vrouwen-gemeenteraad-1919-1923.git /app/repo/hi-eerste-vrouwen-gemeenteraad-1919-1923
fi
cp -r /app/repo/hi-eerste-vrouwen-gemeenteraad-1919-1923/html/* /app/repo/html/

