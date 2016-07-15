:
set -x
echo "update biblioitems set marcxml=replace(marcxml,'        xxu','2014    xxu') where (marcxml like '%subfield code=\"c\">2014%' and marcxml like '%        xxu%');" | mysql -u kohaadmin -pkoha@kfc koha
echo "update biblioitems set marcxml=replace(marcxml,'        xxu','2015    xxu') where (marcxml like '%subfield code=\"c\">2015%' and marcxml like '%        xxu%');" | mysql -u kohaadmin -pkoha@kfc koha
echo "update biblioitems set marcxml=replace(marcxml,'        xxu','2016    xxu') where (marcxml like '%subfield code=\"c\">2016%' and marcxml like '%        xxu%');" | mysql -u kohaadmin -pkoha@kfc koha
echo "update virtualshelves set shelfname=CONCAT('Weekly additions - ', CURDATE()) where shelfnumber=72;" | mysql -u kohaadmin -pkoha@kfc koha
echo "delete from virtualshelfcontents where shelfnumber=72;" | mysql -u kohaadmin -pkoha@kfc koha
echo "insert into virtualshelfcontents (shelfnumber, biblionumber) select '72', i.biblionumber from items i where DATEDIFF(curdate(), i.dateaccessioned) < 7 and i.itype <> 'JOURNAL';" | mysql -u kohaadmin -pkoha@kfc koha
