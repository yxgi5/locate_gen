drop table files;
CREATE TABLE `files` (`files` TEXT);
-- .tables
select * from files;
.import plocate_n_18a_ascii.txt files
.exit
