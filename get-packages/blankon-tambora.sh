#!/bin/bash

REPO_TMP="/tmp/repo"
if [ ! -d "$REPO_TMP" ]
then
   mkdir -p "$REPO_TMP"
fi

tambora_packages="http://arsip.blankonlinux.or.id/blankon/dists/tambora/main/binary-amd64/Packages.gz"
curl $tambora_packages | zcat | grep Filename: | awk '{print $2}' \
     | awk 'BEGIN { FS = "/" } { print $4 ";" $5 }' \
     | awk 'BEGIN { FS = "_" } { print $1 ";" $2 }' > "$REPO_TMP"/tambora.list
ls -l "$REPO_TMP"
