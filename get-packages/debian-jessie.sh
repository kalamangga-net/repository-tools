#!/bin/bash

REPO_TMP="/tmp/repo"
if [ ! -d "$REPO_TMP" ]
then
   mkdir -p "$REPO_TMP"
fi

jessie_packages="http://ftp.debian.org/debian/dists/jessie/main/binary-amd64/Packages.gz"
curl $jessie_packages | zcat | grep Filename: | awk '{print $2}' \
     | awk 'BEGIN { FS = "/" } { print $4 ";" $5 }' \
     | awk 'BEGIN { FS = "_" } { print $1 ";" $2 }' > "$REPO_TMP"/jessie.list
ls -l "$REPO_TMP"

