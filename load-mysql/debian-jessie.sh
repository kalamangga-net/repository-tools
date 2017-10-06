#!/bin/bash
REPO_LST="/tmp/repo/jessie.list"
REPO_SQL="/tmp/repo/jessie.sql"
cat $REPO_LST | \
   awk 'BEGIN { FS=";" } { print "INSERT INTO `jessie` VALUES (\"" $1 "\",\"" $2 "\",\"" $3 "\");"}' \
   > "$REPO_SQL"
mysql -u root -e "TRUNCATE TABLE packages.jessie"
mysql -u root packages < "$REPO_SQL"
