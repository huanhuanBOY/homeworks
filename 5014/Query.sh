echo 'Clickhouse-client testDB queries START--------------------'>> test_queries.log 
# echo '# without cache'>> test_queries.log 
# echo '# with cache 2th'>> test_queries.log 
# echo '# with cache 3th'>> test_queries.log 
date >> test_queries.log 

echo '# 1- Count ID'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select count(ID) as CNT from  TRANSAC_all;"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select count(ID) as CNT from  TRANSAC_all;"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select count(ID) as CNT from  TRANSAC_all;"

echo '# 2- Count distinct ID'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query='Select count(distinct ID) as CNTD from  TRANSAC_all;'
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query='Select count(distinct ID) as CNTD from  TRANSAC_all;'
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query='Select count(distinct ID) as CNTD from  TRANSAC_all;'

echo '# 3-Count distinct ID and Count ID and AVG time'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select count(ID) as CNT,count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from  TRANSAC_all;"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select count(ID) as CNT,count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from  TRANSAC_all;"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select count(ID) as CNT,count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from  TRANSAC_all;"

echo '# 4- with Group by 1 field'>> time -ao test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN, count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from  TRANSAC_all GROUP BY STATIONIDIN SETTINGS max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN, count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from  TRANSAC_all GROUP BY STATIONIDIN SETTINGS max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN, count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from  TRANSAC_all GROUP BY STATIONIDIN SETTINGS max_bytes_before_external_group_by = 5000000000;"

echo '# 5- (3 indic) with Group by 3 field'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN, STATIONIDOUT, OCTOPUS, count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from  TRANSAC_all GROUP BY STATIONIDIN, STATIONIDOUT, OCTOPUS SETTINGS max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN, STATIONIDOUT, OCTOPUS, count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from  TRANSAC_all GROUP BY STATIONIDIN, STATIONIDOUT, OCTOPUS SETTINGS max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN, STATIONIDOUT, OCTOPUS, count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from  TRANSAC_all GROUP BY STATIONIDIN, STATIONIDOUT, OCTOPUS SETTINGS max_bytes_before_external_group_by = 5000000000;"

echo '# 6- (3 indic) with Group by multiple fields and joins 3 tables'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="SELECT LINEINDESC,LINEOUTDESC,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME FROM(SELECT LINEINDESC,LINEIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME FROM(SELECT LINEIDIN,LINEIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME FROM(SELECT LINEIDIN,STATIONIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME FROM(SELECT OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME,STATIONIDIN,STATIONIDOUT FROM(SELECT t.STATIONIDIN AS STATIONIDIN,t.STATIONIDOUT AS STATIONIDOUT,t.OCTOPUS OCTOPUS,t.SUBTYPE_all AS SUBTYPEID,count(t.ID) as CNT,count(distinct t.ID) as CNTD,AVG(t.TIME) as AVGTIME FROM TRANSAC_all t GROUP BY t.STATIONIDIN, t.STATIONIDOUT, t.OCTOPUS, t.SUBTYPE_all SETTINGS max_bytes_before_external_group_by = 5000000000) ANY LEFT JOIN (SELECT SUBTYPEID, SUBTYPEDESC FROM testDB.SUBTYPE_all)USING (SUBTYPEID)) ANY LEFT JOIN (SELECT STATIONID AS STATIONIDIN, MAINLINEID LINEIDIN FROM testDB.STATIONS_all)USING(STATIONIDIN)) ANY LEFT JOIN (SELECT STATIONID AS STATIONIDOUT, MAINLINEID LINEIDOUT FROM testDB.STATIONS_all)USING(STATIONIDOUT)) ANY LEFT JOIN (SELECT LINEID AS LINEIDIN, LINEDESC AS LINEINDESC FROM testDB.LINES_all)USING(LINEIDIN)) ANY LEFT JOIN (SELECT LINEID AS LINEIDOUT, LINEDESC AS LINEOUTDESC FROM testDB.LINES_all)USING(LINEIDOUT);"
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="SELECT LINEINDESC,LINEOUTDESC,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME FROM(SELECT LINEINDESC,LINEIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME FROM(SELECT LINEIDIN,LINEIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME FROM(SELECT LINEIDIN,STATIONIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME FROM(SELECT OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME,STATIONIDIN,STATIONIDOUT FROM(SELECT t.STATIONIDIN AS STATIONIDIN,t.STATIONIDOUT AS STATIONIDOUT,t.OCTOPUS OCTOPUS,t.SUBTYPE_all AS SUBTYPEID,count(t.ID) as CNT,count(distinct t.ID) as CNTD,AVG(t.TIME) as AVGTIME FROM TRANSAC_all t GROUP BY t.STATIONIDIN, t.STATIONIDOUT, t.OCTOPUS, t.SUBTYPE_all SETTINGS max_bytes_before_external_group_by = 5000000000) ANY LEFT JOIN (SELECT SUBTYPEID, SUBTYPEDESC FROM testDB.SUBTYPE_all)USING (SUBTYPEID)) ANY LEFT JOIN (SELECT STATIONID AS STATIONIDIN, MAINLINEID LINEIDIN FROM testDB.STATIONS_all)USING(STATIONIDIN)) ANY LEFT JOIN (SELECT STATIONID AS STATIONIDOUT, MAINLINEID LINEIDOUT FROM testDB.STATIONS_all)USING(STATIONIDOUT)) ANY LEFT JOIN (SELECT LINEID AS LINEIDIN, LINEDESC AS LINEINDESC FROM testDB.LINES_all)USING(LINEIDIN)) ANY LEFT JOIN (SELECT LINEID AS LINEIDOUT, LINEDESC AS LINEOUTDESC FROM testDB.LINES_all)USING(LINEIDOUT);"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="SELECT LINEINDESC,LINEOUTDESC,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME FROM(SELECT LINEINDESC,LINEIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME FROM(SELECT LINEIDIN,LINEIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME FROM(SELECT LINEIDIN,STATIONIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME FROM(SELECT OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME,STATIONIDIN,STATIONIDOUT FROM(SELECT t.STATIONIDIN AS STATIONIDIN,t.STATIONIDOUT AS STATIONIDOUT,t.OCTOPUS OCTOPUS,t.SUBTYPE_all AS SUBTYPEID,count(t.ID) as CNT,count(distinct t.ID) as CNTD,AVG(t.TIME) as AVGTIME FROM TRANSAC_all t GROUP BY t.STATIONIDIN, t.STATIONIDOUT, t.OCTOPUS, t.SUBTYPE_all SETTINGS max_bytes_before_external_group_by = 5000000000) ANY LEFT JOIN (SELECT SUBTYPEID, SUBTYPEDESC FROM testDB.SUBTYPE_all)USING (SUBTYPEID)) ANY LEFT JOIN (SELECT STATIONID AS STATIONIDIN, MAINLINEID LINEIDIN FROM testDB.STATIONS_all)USING(STATIONIDIN)) ANY LEFT JOIN (SELECT STATIONID AS STATIONIDOUT, MAINLINEID LINEIDOUT FROM testDB.STATIONS_all)USING(STATIONIDOUT)) ANY LEFT JOIN (SELECT LINEID AS LINEIDIN, LINEDESC AS LINEINDESC FROM testDB.LINES_all)USING(LINEIDIN)) ANY LEFT JOIN (SELECT LINEID AS LINEIDOUT, LINEDESC AS LINEOUTDESC FROM testDB.LINES_all)USING(LINEIDOUT);"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="SELECT LINEINDESC,LINEOUTDESC,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME FROM(SELECT LINEINDESC,LINEIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME FROM(SELECT LINEIDIN,LINEIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME FROM(SELECT LINEIDIN,STATIONIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME FROM(SELECT OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME,STATIONIDIN,STATIONIDOUT FROM(SELECT t.STATIONIDIN AS STATIONIDIN,t.STATIONIDOUT AS STATIONIDOUT,t.OCTOPUS OCTOPUS,t.SUBTYPE_all AS SUBTYPEID,count(t.ID) as CNT,count(distinct t.ID) as CNTD,AVG(t.TIME) as AVGTIME FROM TRANSAC_all t GROUP BY t.STATIONIDIN, t.STATIONIDOUT, t.OCTOPUS, t.SUBTYPE_all SETTINGS max_bytes_before_external_group_by = 5000000000) ANY LEFT JOIN (SELECT SUBTYPEID, SUBTYPEDESC FROM testDB.SUBTYPE_all)USING (SUBTYPEID)) ANY LEFT JOIN (SELECT STATIONID AS STATIONIDIN, MAINLINEID LINEIDIN FROM testDB.STATIONS_all)USING(STATIONIDIN)) ANY LEFT JOIN (SELECT STATIONID AS STATIONIDOUT, MAINLINEID LINEIDOUT FROM testDB.STATIONS_all)USING(STATIONIDOUT)) ANY LEFT JOIN (SELECT LINEID AS LINEIDIN, LINEDESC AS LINEINDESC FROM testDB.LINES_all)USING(LINEIDIN)) ANY LEFT JOIN (SELECT LINEID AS LINEIDOUT, LINEDESC AS LINEOUTDESC FROM testDB.LINES_all)USING(LINEIDOUT);"

echo '# 7- (3 indic) with Group by 1 datetime binning formula'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log  clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select toStartOfFifteenMinutes(DTIN) as DTIN15MIN,count(ID) as CNT,count(distinct ID) as CNTD,AVG(TIME) as AVGTIME from TRANSAC_all GROUP BY DTIN15MIN  SETTINGS max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log  clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select toStartOfFifteenMinutes(DTIN) as DTIN15MIN,count(ID) as CNT,count(distinct ID) as CNTD,AVG(TIME) as AVGTIME from TRANSAC_all GROUP BY DTIN15MIN  SETTINGS max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log  clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select toStartOfFifteenMinutes(DTIN) as DTIN15MIN,count(ID) as CNT,count(distinct ID) as CNTD,AVG(TIME) as AVGTIME from TRANSAC_all GROUP BY DTIN15MIN  SETTINGS max_bytes_before_external_group_by = 5000000000;"


echo '# 8- (3 indic) + AVG KPI_all with Group by multiple fields and joins 2 tables plus KPI_all table'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log  clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="
SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI
FROM
( SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI
FROM
(SELECT OCTOPUS, STATIONIDIN AS STATIONID, DTIN AS TIMEIN,count(ID) as CNT, count(distinct ID) as CNTD,
AVG(TIME) as AVGTIME
FROM TRANSAC_all GROUP BY OCTOPUS, STATIONIDIN AS STATIONID, DTIN ) ANY LEFT JOIN
(SELECT DTKPI AS TIMEIN, STATIONID, LINEID, DIRECTION, SUM(KPI_all) as SUMKPI
FROM KPI_all
GROUP BY DTKPI, STATIONID, LINEID, DIRECTION
)USING(STATIONID, TIMEIN ) )ANY LEFT JOIN
(SELECT STATIONID, LINEID
FROM
(SELECT STATIONID, MAINLINEID AS LINEID FROM STATIONS_all) ANY LEFT JOIN
(SELECT LINEID FROM LINES_all)
USING(LINEID)
)USING(STATIONID, LINEID) SETTINGS max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log  clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="
SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI
FROM
( SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI
FROM
(SELECT OCTOPUS, STATIONIDIN AS STATIONID, DTIN AS TIMEIN,count(ID) as CNT, count(distinct ID) as CNTD,
AVG(TIME) as AVGTIME
FROM TRANSAC_all GROUP BY OCTOPUS, STATIONIDIN AS STATIONID, DTIN ) ANY LEFT JOIN
(SELECT DTKPI AS TIMEIN, STATIONID, LINEID, DIRECTION, SUM(KPI_all) as SUMKPI
FROM KPI_all
GROUP BY DTKPI, STATIONID, LINEID, DIRECTION
)USING(STATIONID, TIMEIN ) )ANY LEFT JOIN
(SELECT STATIONID, LINEID
FROM
(SELECT STATIONID, MAINLINEID AS LINEID FROM STATIONS_all) ANY LEFT JOIN
(SELECT LINEID FROM LINES_all)
USING(LINEID)
)USING(STATIONID, LINEID) SETTINGS max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log  clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="
SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI
FROM
( SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI
FROM
(SELECT OCTOPUS, STATIONIDIN AS STATIONID, DTIN AS TIMEIN,count(ID) as CNT, count(distinct ID) as CNTD,
AVG(TIME) as AVGTIME
FROM TRANSAC_all GROUP BY OCTOPUS, STATIONIDIN AS STATIONID, DTIN ) ANY LEFT JOIN
(SELECT DTKPI AS TIMEIN, STATIONID, LINEID, DIRECTION, SUM(KPI_all) as SUMKPI
FROM KPI_all
GROUP BY DTKPI, STATIONID, LINEID, DIRECTION 
)USING(STATIONID, TIMEIN ) )ANY LEFT JOIN
(SELECT STATIONID, LINEID
FROM
(SELECT STATIONID, MAINLINEID AS LINEID FROM STATIONS_all) ANY LEFT JOIN
(SELECT LINEID FROM LINES_all)
USING(LINEID)
)USING(STATIONID, LINEID) SETTINGS max_bytes_before_external_group_by = 5000000000;"

echo '# 9- (3 indic) with filter on the partition field'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select count(ID) as CNT,count(distinct ID) as CNTD,AVG(TIME) as AVGTIME from  TRANSAC_all where DTBUSINESS >= toDate('2018-01-01');"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select count(ID) as CNT,count(distinct ID) as CNTD,AVG(TIME) as AVGTIME from  TRANSAC_all where DTBUSINESS >= toDate('2018-01-01');"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select count(ID) as CNT,count(distinct ID) as CNTD,AVG(TIME) as AVGTIME from  TRANSAC_all where DTBUSINESS >= toDate('2018-01-01');"


echo '# 10- (3 indic) with Group by 1 field with filter on the partition field'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN,count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from  TRANSAC_all where DTIN >= toDate('2018-01-01') GROUP BY STATIONIDIN SETTINGS max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN,count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from  TRANSAC_all where DTIN >= toDate('2018-01-01') GROUP BY STATIONIDIN SETTINGS max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN,count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from  TRANSAC_all where DTIN >= toDate('2018-01-01') GROUP BY STATIONIDIN SETTINGS max_bytes_before_external_group_by = 5000000000;"


echo '# 11- (3 indic) with Group by 3 field with filter on the partition field'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN,STATIONIDOUT, OCTOPUS,count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from  TRANSAC_all where DTBUSINESS >= toDate('2018-01-01') GROUP BY STATIONIDIN, STATIONIDOUT, OCTOPUS SETTINGS  max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN,STATIONIDOUT, OCTOPUS,count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from  TRANSAC_all where DTBUSINESS >= toDate('2018-01-01') GROUP BY STATIONIDIN, STATIONIDOUT, OCTOPUS SETTINGS  max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN,STATIONIDOUT, OCTOPUS,count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from  TRANSAC_all where DTBUSINESS >= toDate('2018-01-01') GROUP BY STATIONIDIN, STATIONIDOUT, OCTOPUS SETTINGS  max_bytes_before_external_group_by = 5000000000;"

echo '# 12- (3 indic) with Group by multiple fields and joins 3 tables with filter on the partition field'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="SELECT LINEINDESC,LINEOUTDESC, OCTOPUS,SUBTYPEDESC, CNT,CNTD, AVGTIME FROM (SELECT LINEINDESC, LINEIDOUT,OCTOPUS, SUBTYPEDESC, CNT,CNTD, AVGTIME FROM (SELECT LINEIDIN,LINEIDOUT, OCTOPUS,SUBTYPEDESC, CNT,CNTD, AVGTIME FROM (SELECT LINEIDIN,STATIONIDOUT, OCTOPUS,SUBTYPEDESC, CNT,CNTD, AVGTIME FROM ( SELECT OCTOPUS, SUBTYPEDESC, CNT,CNTD, AVGTIME,STATIONIDIN,STATIONIDOUT FROM (SELECT t.STATIONIDIN AS STATIONIDIN, t.STATIONIDOUT AS STATIONIDOUT,t.OCTOPUS OCTOPUS, t.SUBTYPE_all AS SUBTYPEID, count(t.ID) as CNT, count(distinct t.ID) as CNTD, AVG(t.TIME) as AVGTIME FROM TRANSAC_all t WHERE t.DTBUSINESS >= toDate('2017-11-01') GROUP BY t.STATIONIDIN, t.STATIONIDOUT, t.OCTOPUS, t.SUBTYPE_all )ANY LEFT JOIN ( SELECT SUBTYPEID, SUBTYPEDESC FROM SUBTYPE_all)USING (SUBTYPEID))ANY LEFT JOIN (SELECT STATIONID AS STATIONIDIN, MAINLINEID LINEIDIN FROM STATIONS_all )USING(STATIONIDIN))ANY LEFT JOIN (SELECT STATIONID AS STATIONIDOUT, MAINLINEID LINEIDOUT FROM STATIONS_all )USING(STATIONIDOUT))ANY LEFT JOIN (SELECT LINEID AS LINEIDIN, LINEDESC AS LINEINDESC FROM LINES_all )USING(LINEIDIN))ANY LEFT JOIN (SELECT LINEID AS LINEIDOUT, LINEDESC AS LINEOUTDESC FROM LINES_all )USING(LINEIDOUT);"
echo '# with cache 2th'>> test_queries.log
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="SELECT LINEINDESC,LINEOUTDESC, OCTOPUS,SUBTYPEDESC, CNT,CNTD, AVGTIME FROM (SELECT LINEINDESC, LINEIDOUT,OCTOPUS, SUBTYPEDESC, CNT,CNTD, AVGTIME FROM (SELECT LINEIDIN,LINEIDOUT, OCTOPUS,SUBTYPEDESC, CNT,CNTD, AVGTIME FROM (SELECT LINEIDIN,STATIONIDOUT, OCTOPUS,SUBTYPEDESC, CNT,CNTD, AVGTIME FROM ( SELECT OCTOPUS, SUBTYPEDESC, CNT,CNTD, AVGTIME,STATIONIDIN,STATIONIDOUT FROM (SELECT t.STATIONIDIN AS STATIONIDIN, t.STATIONIDOUT AS STATIONIDOUT,t.OCTOPUS OCTOPUS, t.SUBTYPE_all AS SUBTYPEID, count(t.ID) as CNT, count(distinct t.ID) as CNTD, AVG(t.TIME) as AVGTIME FROM TRANSAC_all t WHERE t.DTBUSINESS >= toDate('2017-11-01') GROUP BY t.STATIONIDIN, t.STATIONIDOUT, t.OCTOPUS, t.SUBTYPE_all )ANY LEFT JOIN ( SELECT SUBTYPEID, SUBTYPEDESC FROM SUBTYPE_all)USING (SUBTYPEID))ANY LEFT JOIN (SELECT STATIONID AS STATIONIDIN, MAINLINEID LINEIDIN FROM STATIONS_all )USING(STATIONIDIN))ANY LEFT JOIN (SELECT STATIONID AS STATIONIDOUT, MAINLINEID LINEIDOUT FROM STATIONS_all )USING(STATIONIDOUT))ANY LEFT JOIN (SELECT LINEID AS LINEIDIN, LINEDESC AS LINEINDESC FROM LINES_all )USING(LINEIDIN))ANY LEFT JOIN (SELECT LINEID AS LINEIDOUT, LINEDESC AS LINEOUTDESC FROM LINES_all )USING(LINEIDOUT);" 
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="SELECT LINEINDESC,LINEOUTDESC, OCTOPUS,SUBTYPEDESC, CNT,CNTD, AVGTIME FROM (SELECT LINEINDESC, LINEIDOUT,OCTOPUS, SUBTYPEDESC, CNT,CNTD, AVGTIME FROM (SELECT LINEIDIN,LINEIDOUT, OCTOPUS,SUBTYPEDESC, CNT,CNTD, AVGTIME FROM (SELECT LINEIDIN,STATIONIDOUT, OCTOPUS,SUBTYPEDESC, CNT,CNTD, AVGTIME FROM ( SELECT OCTOPUS, SUBTYPEDESC, CNT,CNTD, AVGTIME,STATIONIDIN,STATIONIDOUT FROM (SELECT t.STATIONIDIN AS STATIONIDIN, t.STATIONIDOUT AS STATIONIDOUT,t.OCTOPUS OCTOPUS, t.SUBTYPE_all AS SUBTYPEID, count(t.ID) as CNT, count(distinct t.ID) as CNTD, AVG(t.TIME) as AVGTIME FROM TRANSAC_all t WHERE t.DTBUSINESS >= toDate('2017-11-01') GROUP BY t.STATIONIDIN, t.STATIONIDOUT, t.OCTOPUS, t.SUBTYPE_all )ANY LEFT JOIN ( SELECT SUBTYPEID, SUBTYPEDESC FROM SUBTYPE_all)USING (SUBTYPEID))ANY LEFT JOIN (SELECT STATIONID AS STATIONIDIN, MAINLINEID LINEIDIN FROM STATIONS_all )USING(STATIONIDIN))ANY LEFT JOIN (SELECT STATIONID AS STATIONIDOUT, MAINLINEID LINEIDOUT FROM STATIONS_all )USING(STATIONIDOUT))ANY LEFT JOIN (SELECT LINEID AS LINEIDIN, LINEDESC AS LINEINDESC FROM LINES_all )USING(LINEIDIN))ANY LEFT JOIN (SELECT LINEID AS LINEIDOUT, LINEDESC AS LINEOUTDESC FROM LINES_all )USING(LINEIDOUT);" 

echo '# 13- (3 indic) with Group by 1 datetime binning formula with filter on the partition field'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="
Select
toStartOfFifteenMinutes(DTIN) as DTIN15MIN, count(ID) as CNT,
count(distinct ID) as CNTD,
AVG(TIME) as AVGTIME
from TRANSAC_all
where DTBUSINESS >= toDate('2017-11-01') GROUP BY
toStartOfFifteenMinutes(DTIN);"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="
Select
toStartOfFifteenMinutes(DTIN) as DTIN15MIN, count(ID) as CNT,
count(distinct ID) as CNTD,
AVG(TIME) as AVGTIME
from TRANSAC_all
where DTBUSINESS >= toDate('2017-11-01') GROUP BY
toStartOfFifteenMinutes(DTIN);"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="
Select
toStartOfFifteenMinutes(DTIN) as DTIN15MIN, count(ID) as CNT,
count(distinct ID) as CNTD,
AVG(TIME) as AVGTIME
from TRANSAC_all
where DTBUSINESS >= toDate('2017-11-01') GROUP BY
toStartOfFifteenMinutes(DTIN);"

echo '# 14- (3 indic) + AVG KPI_all with Group by multiple fields and joins 2 tables plus KPI_all table with filter on the partition field of transaction table'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="
SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI
FROM 
(SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI 
FROM
(SELECT OCTOPUS, STATIONIDIN AS STATIONID, toStartOfFifteenMinutes(DTIN) AS TIMEIN, count(ID) as CNT,count(distinct ID) as CNTD,AVG(TIME) as AVGTIME 
FROM TRANSAC_all
WHERE DTBUSINESS >= toDate('2017-11-01')
GROUP BY OCTOPUS, STATIONIDIN AS STATIONID, DTIN
) ANY LEFT JOIN
(SELECT DTKPI AS TIMEIN, STATIONID, LINEID, DIRECTION, SUM(KPI_all) as
SUMKPI
FROM KPI_all
GROUP BY DTKPI, STATIONID, LINEID, DIRECTION 
)USING(STATIONID, TIMEIN ) )ANY LEFT JOIN
(SELECT STATIONID, LINEID
FROM
(SELECT STATIONID, MAINLINEID AS LINEID FROM STATIONS_all) ANY LEFT JOIN
(SELECT LINEID FROM LINES_all)
USING(LINEID)
)USING(STATIONID, LINEID) SETTINGS max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="
SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI
FROM 
(SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI 
FROM
(SELECT OCTOPUS, STATIONIDIN AS STATIONID, toStartOfFifteenMinutes(DTIN) AS TIMEIN, count(ID) as CNT,count(distinct ID) as CNTD,AVG(TIME) as AVGTIME 
FROM TRANSAC_all
WHERE DTBUSINESS >= toDate('2017-11-01')
GROUP BY OCTOPUS, STATIONIDIN AS STATIONID, DTIN
) ANY LEFT JOIN
(SELECT DTKPI AS TIMEIN, STATIONID, LINEID, DIRECTION, SUM(KPI_all) as
SUMKPI
FROM KPI_all
GROUP BY DTKPI, STATIONID, LINEID, DIRECTION
)USING(STATIONID, TIMEIN ) )ANY LEFT JOIN
(SELECT STATIONID, LINEID
FROM
(SELECT STATIONID, MAINLINEID AS LINEID FROM STATIONS_all) ANY LEFT JOIN
(SELECT LINEID FROM LINES_all)
USING(LINEID)
)USING(STATIONID, LINEID) SETTINGS max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="
SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI
FROM 
(SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI 
FROM
(SELECT OCTOPUS, STATIONIDIN AS STATIONID, toStartOfFifteenMinutes(DTIN) AS TIMEIN, count(ID) as CNT,count(distinct ID) as CNTD,AVG(TIME) as AVGTIME 
FROM TRANSAC_all
WHERE DTBUSINESS >= toDate('2017-11-01')
GROUP BY OCTOPUS, STATIONIDIN AS STATIONID, DTIN
) ANY LEFT JOIN
(SELECT DTKPI AS TIMEIN, STATIONID, LINEID, DIRECTION, SUM(KPI_all) as
SUMKPI
FROM KPI_all
GROUP BY DTKPI, STATIONID, LINEID, DIRECTION
)USING(STATIONID, TIMEIN ) )ANY LEFT JOIN
(SELECT STATIONID, LINEID
FROM
(SELECT STATIONID, MAINLINEID AS LINEID FROM STATIONS_all) ANY LEFT JOIN
(SELECT LINEID FROM LINES_all)
USING(LINEID)
)USING(STATIONID, LINEID) SETTINGS max_bytes_before_external_group_by = 5000000000;"

echo '# 15- (3 indic) with filter on non-partition field'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select count(ID) as CNT,count(distinct ID) as CNTD,AVG(TIME) as AVGTIME from TRANSAC_all where SUBTYPE_all in ('AVUP', 'PNQI');"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select count(ID) as CNT,count(distinct ID) as CNTD,AVG(TIME) as AVGTIME from TRANSAC_all where SUBTYPE_all in ('AVUP', 'PNQI');"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select count(ID) as CNT,count(distinct ID) as CNTD,AVG(TIME) as AVGTIME from TRANSAC_all where SUBTYPE_all in ('AVUP', 'PNQI');"


echo '# 16- (3 indic) with Group by 1 field with filter on non-partition field'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN,count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from TRANSAC_all where SUBTYPE_all in ('AVUP', 'PNQI') GROUP BY STATIONIDIN SETTINGS  max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN,count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from TRANSAC_all where SUBTYPE_all in ('AVUP', 'PNQI') GROUP BY STATIONIDIN SETTINGS  max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN,count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from TRANSAC_all where SUBTYPE_all in ('AVUP', 'PNQI') GROUP BY STATIONIDIN SETTINGS  max_bytes_before_external_group_by = 5000000000;"

echo '# 17- (3 indic) with Group by 3 field with filter on non-partition field'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN,STATIONIDOUT, OCTOPUS,count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from TRANSAC_all where SUBTYPE_all in ('AVUP', 'PNQI') GROUP BY STATIONIDIN, STATIONIDOUT, OCTOPUS SETTINGS  max_bytes_before_external_group_by = 5000000000;"
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN,STATIONIDOUT, OCTOPUS,count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from TRANSAC_all where SUBTYPE_all in ('AVUP', 'PNQI') GROUP BY STATIONIDIN, STATIONIDOUT, OCTOPUS SETTINGS  max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN,STATIONIDOUT, OCTOPUS,count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from TRANSAC_all where SUBTYPE_all in ('AVUP', 'PNQI') GROUP BY STATIONIDIN, STATIONIDOUT, OCTOPUS SETTINGS  max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="Select STATIONIDIN,STATIONIDOUT, OCTOPUS,count(ID) as CNT, count(distinct ID) as CNTD, AVG(TIME) as AVGTIME from TRANSAC_all where SUBTYPE_all in ('AVUP', 'PNQI') GROUP BY STATIONIDIN, STATIONIDOUT, OCTOPUS SETTINGS  max_bytes_before_external_group_by = 5000000000;"

echo '# 18- (3 indic) with Group by multiple fields and joins 3 tables with filter on non-partition field'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="SELECT LINEINDESC,LINEOUTDESC,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME 
FROM(SELECT LINEINDESC,LINEIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME
FROM(SELECT LINEIDIN,LINEIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME
FROM(SELECT LINEIDIN,STATIONIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME
FROM(SELECT OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME,STATIONIDIN,STATIONIDOUT
FROM(SELECT t.STATIONIDIN AS STATIONIDIN,t.STATIONIDOUT AS STATIONIDOUT,t.OCTOPUS OCTOPUS,t.SUBTYPE_all AS SUBTYPEID,count(t.ID) as CNT,count(distinct t.ID) as CNTD,AVG(t.TIME) as AVGTIME
FROM TRANSAC_all t where t.SUBTYPE_all in ('AVUP', 'PNQI') 
GROUP BY t.STATIONIDIN, t.STATIONIDOUT, t.OCTOPUS, t.SUBTYPE_all 
)ANY LEFT JOIN (SELECT SUBTYPEID, SUBTYPEDESC FROM testDB.SUBTYPE_all)USING (SUBTYPEID)
)ANY LEFT JOIN (SELECT STATIONID AS STATIONIDIN, MAINLINEID LINEIDIN FROM testDB.STATIONS_all)USING(STATIONIDIN)
)ANY LEFT JOIN (SELECT STATIONID AS STATIONIDOUT, MAINLINEID LINEIDOUT FROM testDB.STATIONS_all)USING(STATIONIDOUT)
)ANY LEFT JOIN (SELECT LINEID AS LINEIDIN, LINEDESC AS LINEINDESC FROM testDB.LINES_all)USING(LINEIDIN)
)ANY LEFT JOIN (SELECT LINEID AS LINEIDOUT, LINEDESC AS LINEOUTDESC FROM testDB.LINES_all)USING(LINEIDOUT) SETTINGS max_bytes_before_external_group_by = 5000000000;"

echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="SELECT LINEINDESC,LINEOUTDESC,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME 
FROM(SELECT LINEINDESC,LINEIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME
FROM(SELECT LINEIDIN,LINEIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME
FROM(SELECT LINEIDIN,STATIONIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME
FROM(SELECT OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME,STATIONIDIN,STATIONIDOUT
FROM(SELECT t.STATIONIDIN AS STATIONIDIN,t.STATIONIDOUT AS STATIONIDOUT,t.OCTOPUS OCTOPUS,t.SUBTYPE_all AS SUBTYPEID,count(t.ID) as CNT,count(distinct t.ID) as CNTD,AVG(t.TIME) as AVGTIME
FROM TRANSAC_all t where t.SUBTYPE_all in ('AVUP', 'PNQI') 
GROUP BY t.STATIONIDIN, t.STATIONIDOUT, t.OCTOPUS, t.SUBTYPE_all 
)ANY LEFT JOIN (SELECT SUBTYPEID, SUBTYPEDESC FROM testDB.SUBTYPE_all)USING (SUBTYPEID)
)ANY LEFT JOIN (SELECT STATIONID AS STATIONIDIN, MAINLINEID LINEIDIN FROM testDB.STATIONS_all)USING(STATIONIDIN)
)ANY LEFT JOIN (SELECT STATIONID AS STATIONIDOUT, MAINLINEID LINEIDOUT FROM testDB.STATIONS_all)USING(STATIONIDOUT)
)ANY LEFT JOIN (SELECT LINEID AS LINEIDIN, LINEDESC AS LINEINDESC FROM testDB.LINES_all)USING(LINEIDIN)
)ANY LEFT JOIN (SELECT LINEID AS LINEIDOUT, LINEDESC AS LINEOUTDESC FROM testDB.LINES_all)USING(LINEIDOUT) SETTINGS max_bytes_before_external_group_by = 5000000000;"

echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="SELECT LINEINDESC,LINEOUTDESC,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME 
FROM(SELECT LINEINDESC,LINEIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME
FROM(SELECT LINEIDIN,LINEIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME
FROM(SELECT LINEIDIN,STATIONIDOUT,OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME
FROM(SELECT OCTOPUS,SUBTYPEDESC,CNT,CNTD,AVGTIME,STATIONIDIN,STATIONIDOUT
FROM(SELECT t.STATIONIDIN AS STATIONIDIN,t.STATIONIDOUT AS STATIONIDOUT,t.OCTOPUS OCTOPUS,t.SUBTYPE_all AS SUBTYPEID,count(t.ID) as CNT,count(distinct t.ID) as CNTD,AVG(t.TIME) as AVGTIME
FROM TRANSAC_all t where t.SUBTYPE_all in ('AVUP', 'PNQI') 
GROUP BY t.STATIONIDIN, t.STATIONIDOUT, t.OCTOPUS, t.SUBTYPE_all 
)ANY LEFT JOIN (SELECT SUBTYPEID, SUBTYPEDESC FROM testDB.SUBTYPE_all)USING (SUBTYPEID)
)ANY LEFT JOIN (SELECT STATIONID AS STATIONIDIN, MAINLINEID LINEIDIN FROM testDB.STATIONS_all)USING(STATIONIDIN)
)ANY LEFT JOIN (SELECT STATIONID AS STATIONIDOUT, MAINLINEID LINEIDOUT FROM testDB.STATIONS_all)USING(STATIONIDOUT)
)ANY LEFT JOIN (SELECT LINEID AS LINEIDIN, LINEDESC AS LINEINDESC FROM testDB.LINES_all)USING(LINEIDIN)
)ANY LEFT JOIN (SELECT LINEID AS LINEIDOUT, LINEDESC AS LINEOUTDESC FROM testDB.LINES_all)USING(LINEIDOUT) SETTINGS max_bytes_before_external_group_by = 5000000000;"


echo '# 19-  (3 indic) with Group by 1 datetime binning formula with filter on non-partition field'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="
SELECT
toStartOfFifteenMinutes(DTIN) as DTIN15MIN, count(ID) as CNT,
count(distinct ID) as CNTD,
AVG(TIME) as AVGTIME
from TRANSAC_all
where SUBTYPE_all in ('AVUP', 'PNQI')
GROUP BY toStartOfFifteenMinutes(DTIN) SETTINGS max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="
SELECT
toStartOfFifteenMinutes(DTIN) as DTIN15MIN, count(ID) as CNT,
count(distinct ID) as CNTD,
AVG(TIME) as AVGTIME
from TRANSAC_all
where SUBTYPE_all in ('AVUP', 'PNQI')
GROUP BY toStartOfFifteenMinutes(DTIN) SETTINGS max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="
SELECT
toStartOfFifteenMinutes(DTIN) as DTIN15MIN, count(ID) as CNT,
count(distinct ID) as CNTD,
AVG(TIME) as AVGTIME
from TRANSAC_all
where SUBTYPE_all in ('AVUP', 'PNQI')
GROUP BY toStartOfFifteenMinutes(DTIN) SETTINGS max_bytes_before_external_group_by = 5000000000;"

echo '# 20- (3 indic) + AVG KPI_all with Group by multiple fields and joins 2 tables plus KPI_all table with filter on non-partition field'>> test_queries.log 
echo '# without cache'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="
SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI
FROM
(SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI
FROM
(SELECT OCTOPUS, STATIONIDIN AS STATIONID, toStartOfFifteenMinutes(DTIN) AS TIMEIN, count(ID) as CNT,count(distinct ID) as CNTD, AVG(TIME) as AVGTIME 
FROM TRANSAC_all
where SUBTYPE_all in ('AVUP', 'PNQI')
GROUP BY OCTOPUS, STATIONIDIN AS STATIONID, DTIN 
) ANY LEFT JOIN
(SELECT DTKPI AS TIMEIN, STATIONID, LINEID, DIRECTION, SUM(KPI_all) as SUMKPI
FROM KPI_all
GROUP BY DTKPI, STATIONID, LINEID, DIRECTION 
)USING(STATIONID, TIMEIN ) )ANY LEFT JOIN
(SELECT STATIONID, LINEID
FROM
(SELECT STATIONID, MAINLINEID AS LINEID FROM STATIONS_all) ANY LEFT JOIN
(SELECT LINEID FROM LINES_all)
USING(LINEID)
)USING(STATIONID, LINEID) SETTINGS max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 2th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="
SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI
FROM
(SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI
FROM
(SELECT OCTOPUS, STATIONIDIN AS STATIONID, toStartOfFifteenMinutes(DTIN) AS TIMEIN, count(ID) as CNT,count(distinct ID) as CNTD, AVG(TIME) as AVGTIME 
FROM TRANSAC_all
where SUBTYPE_all in ('AVUP', 'PNQI')
GROUP BY OCTOPUS, STATIONIDIN AS STATIONID, DTIN 
) ANY LEFT JOIN
(SELECT DTKPI AS TIMEIN, STATIONID, LINEID, DIRECTION, SUM(KPI_all) as SUMKPI
FROM KPI_all
GROUP BY DTKPI, STATIONID, LINEID, DIRECTION 
)USING(STATIONID, TIMEIN ) )ANY LEFT JOIN
(SELECT STATIONID, LINEID
FROM
(SELECT STATIONID, MAINLINEID AS LINEID FROM STATIONS_all) ANY LEFT JOIN
(SELECT LINEID FROM LINES_all)
USING(LINEID)
)USING(STATIONID, LINEID) SETTINGS max_bytes_before_external_group_by = 5000000000;"
echo '# with cache 3th'>> test_queries.log 
time -ao test_queries.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="
SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI
FROM
(SELECT TIMEIN,STATIONID, LINEID, DIRECTION, OCTOPUS, CNT, CNTD, AVGTIME, SUMKPI
FROM
(SELECT OCTOPUS, STATIONIDIN AS STATIONID, toStartOfFifteenMinutes(DTIN) AS TIMEIN, count(ID) as CNT,count(distinct ID) as CNTD, AVG(TIME) as AVGTIME 
FROM TRANSAC_all
where SUBTYPE_all in ('AVUP', 'PNQI')
GROUP BY OCTOPUS, STATIONIDIN AS STATIONID, DTIN 
) ANY LEFT JOIN
(SELECT DTKPI AS TIMEIN, STATIONID, LINEID, DIRECTION, SUM(KPI_all) as SUMKPI
FROM KPI_all
GROUP BY DTKPI, STATIONID, LINEID, DIRECTION
)USING(STATIONID, TIMEIN ) )ANY LEFT JOIN
(SELECT STATIONID, LINEID
FROM
(SELECT STATIONID, MAINLINEID AS LINEID FROM STATIONS_all) ANY LEFT JOIN
(SELECT LINEID FROM LINES_all)
USING(LINEID)
)USING(STATIONID, LINEID) SETTINGS max_bytes_before_external_group_by = 5000000000;"


echo 'Clickhouse-client testDB queries STOP--------------------'>> test_queries.log 
date >> test_queries.log 