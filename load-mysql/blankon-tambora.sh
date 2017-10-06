#!/bin/bash
REPO_LST="/tmp/repo/tambora.list"
REPO_SQL="/tmp/repo/tambora.sql"
cat $REPO_LST | \
   awk 'BEGIN { FS=";" } { print "INSERT INTO `tambora` VALUES (\"" $1 "\",\"" $2 "\",\"" $3 "\");"}' \
   > "$REPO_SQL"
mysql -u root -e "TRUNCATE TABLE packages.tambora"
mysql -u root packages < "$REPO_SQL"
