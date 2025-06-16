#!/bin/bash

# BASH Shell: For Loop File Names With Spaces
# Set $IFS variable
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

sudo updatedb -U /media/$USER/M4A/ -o ~/Documents/locate/plocate_n_4a.db
sudo chmod 777 plocate_n_4a.db
locate -d plocate_n_4a.db / > plocate_n_4a.txt
sort plocate_n_4a.txt > plocate_n_4a_ascii.txt
find -name 'plocate_n_4a_ascii.txt' | xargs perl -pi -e "s|^/media/$USER/M4A||g"
sqlite3 plocate_n1_4a.db < refresh_table_4a.sql
#drop table files;
#CREATE TABLE `files` (`files` TEXT);
#.tables
#select * from files;
#.import mlocate_n_4a_ascii.txt files
#.exit
sqlitebrowser plocate_n1_4a.db

# restore $IFS
IFS=$SAVEIFS
