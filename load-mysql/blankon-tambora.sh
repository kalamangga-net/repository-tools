#!/bin/bash
REPO_LST="/tmp/repo/tambora.list"
REPO_SQL="/tmp/repo/tambora.sql"
cat $REPO_LIST | \
   awk 'BEGIN { FS=";" } { print "INSERT INTO `jessie` VALUES (\"" $1 "\",\"" $2 "\",\"" $3 "\");"}' \
   > "$REPO_SQL"
mysql -u yht -p packages < "$REPO_SQL"
