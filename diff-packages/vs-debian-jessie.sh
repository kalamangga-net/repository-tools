#!/bin/bash

jessie_packages="http://ftp.debian.org/debian/dists/jessie/main/binary-amd64/Packages.gz"
#curl $jessie_packages | zcat | grep Filename: | awk '{print $2}' | awk 'BEGIN { FS = "/" } { print $4 ";" $5 }' > jessie.list
cat jessie.list | awk 'BEGIN { FS = "_" } { print $1 ";" $2 }' > jessie-1.list
tambora_packages="http://arsip.blankonlinux.or.id/blankon/dists/tambora/main/binary-amd64/Packages.gz"
#curl $tambora_packages | zcat | grep Filename: | awk '{print $2}' | awk 'BEGIN { FS = "/" } { print $4 ";" $5 }' > tambora.list
cat tambora.list | awk 'BEGIN { FS = "_" } { print $1 ";" $2 }' > tambora-1.list

diff jessie-1.list tambora-1.list > diff.list

#for i in `cat .jessie_packages | grep Filename: | awk '{print $2}'`
#do
## if [ ! -f "$repo_dir/$i" ]
# then
#  echo $repo_dir/$i
#  mkdir -p `dirname $repo_dir/$i`
#  wget -c $repo_mirror/$i -O $repo_dir/$i
# fi
#done

