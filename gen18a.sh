#!/bin/bash

# BASH Shell: For Loop File Names With Spaces
# Set $IFS variable
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

sudo updatedb -U /media/$USER/S18A/ -o ~/Documents/locate/plocate_n_18a.db
sudo chmod 777 plocate_n_18a.db
locate -d plocate_n_18a.db / > plocate_n_18a.txt
sort plocate_n_18a.txt > plocate_n_18a_ascii.txt
find -name 'plocate_n_18a_ascii.txt' | xargs perl -pi -e "s|^/media/$USER/H16A||g"
sqlite3 plocate_n1_18a.db < refresh_table_18a.sql
#drop table files;
#CREATE TABLE `files` (`files` TEXT);
#.tables
#select * from files;
#.import mlocate_n_18a_ascii.txt files
#.exit
sqlitebrowser plocate_n1_18a.db

# restore $IFS
IFS=$SAVEIFS
