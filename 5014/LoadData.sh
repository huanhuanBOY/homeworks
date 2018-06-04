cat /data/clean_data/datatransac_201701_backup.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO testDB.landing_transac FORMAT CSV"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="INSERT INTO TRANSAC_all select ID,STATIONIDIN,STATIONIDOUT,DTIN, toDate(substring(toString(DTIN),1,10)) as DTBUSINESS,DTOUT,OCTOPUS,SUBTYPE,TIME from testDB.landing_transac"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="DROP TABLE testDB.landing_transac" 
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE  TABLE IF  NOT  EXISTS testDB.landing_transac ( ID Int32, STATIONIDIN String, STATIONIDOUT String,DTIN DateTime,DTOUT DateTime,OCTOPUS String,SUBTYPE String,TIME Int64 ) ENGINE = TinyLog"

cat /data/clean_data/datatransac_201702_backup.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO testDB.landing_transac FORMAT CSV"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="INSERT INTO TRANSAC_all select ID,STATIONIDIN,STATIONIDOUT,DTIN, toDate(substring(toString(DTIN),1,10)) as DTBUSINESS,DTOUT,OCTOPUS,SUBTYPE,TIME from testDB.landing_transac"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="DROP TABLE testDB.landing_transac" 
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE  TABLE IF  NOT  EXISTS testDB.landing_transac ( ID Int32, STATIONIDIN String, STATIONIDOUT String,DTIN DateTime,DTOUT DateTime,OCTOPUS String,SUBTYPE String,TIME Int64 ) ENGINE = TinyLog"

cat /data/clean_data/datatransac_201703_backup.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO testDB.landing_transac FORMAT CSV"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="INSERT INTO TRANSAC_all select ID,STATIONIDIN,STATIONIDOUT,DTIN, toDate(substring(toString(DTIN),1,10)) as DTBUSINESS,DTOUT,OCTOPUS,SUBTYPE,TIME from testDB.landing_transac"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="DROP TABLE testDB.landing_transac" 
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE  TABLE IF  NOT  EXISTS testDB.landing_transac ( ID Int32, STATIONIDIN String, STATIONIDOUT String,DTIN DateTime,DTOUT DateTime,OCTOPUS String,SUBTYPE String,TIME Int64 ) ENGINE = TinyLog"

cat /data/clean_data/datatransac_201704_backup.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO testDB.landing_transac FORMAT CSV"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="INSERT INTO TRANSAC_all select ID,STATIONIDIN,STATIONIDOUT,DTIN, toDate(substring(toString(DTIN),1,10)) as DTBUSINESS,DTOUT,OCTOPUS,SUBTYPE,TIME from testDB.landing_transac"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="DROP TABLE testDB.landing_transac" 
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE  TABLE IF  NOT  EXISTS testDB.landing_transac ( ID Int32, STATIONIDIN String, STATIONIDOUT String,DTIN DateTime,DTOUT DateTime,OCTOPUS String,SUBTYPE String,TIME Int64 ) ENGINE = TinyLog"

cat /data/clean_data/datatransac_201705_backup.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO testDB.landing_transac FORMAT CSV"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="INSERT INTO TRANSAC_all select ID,STATIONIDIN,STATIONIDOUT,DTIN, toDate(substring(toString(DTIN),1,10)) as DTBUSINESS,DTOUT,OCTOPUS,SUBTYPE,TIME from testDB.landing_transac"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="DROP TABLE testDB.landing_transac" 
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE  TABLE IF  NOT  EXISTS testDB.landing_transac ( ID Int32, STATIONIDIN String, STATIONIDOUT String,DTIN DateTime,DTOUT DateTime,OCTOPUS String,SUBTYPE String,TIME Int64 ) ENGINE = TinyLog"

cat /data/clean_data/datatransac_201706_backup.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO testDB.landing_transac FORMAT CSV"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="INSERT INTO TRANSAC_all select ID,STATIONIDIN,STATIONIDOUT,DTIN, toDate(substring(toString(DTIN),1,10)) as DTBUSINESS,DTOUT,OCTOPUS,SUBTYPE,TIME from testDB.landing_transac"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="DROP TABLE testDB.landing_transac" 
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE  TABLE IF  NOT  EXISTS testDB.landing_transac ( ID Int32, STATIONIDIN String, STATIONIDOUT String,DTIN DateTime,DTOUT DateTime,OCTOPUS String,SUBTYPE String,TIME Int64 ) ENGINE = TinyLog"

cat /data/clean_data/datatransac_201701_backup.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO testDB.landing_transac FORMAT CSV"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="INSERT INTO TRANSAC_all select ID,STATIONIDIN,STATIONIDOUT,DTIN, toDate(substring(toString(DTIN),1,10)) as DTBUSINESS,DTOUT,OCTOPUS,SUBTYPE,TIME from testDB.landing_transac"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="DROP TABLE testDB.landing_transac" 
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE  TABLE IF  NOT  EXISTS testDB.landing_transac ( ID Int32, STATIONIDIN String, STATIONIDOUT String,DTIN DateTime,DTOUT DateTime,OCTOPUS String,SUBTYPE String,TIME Int64 ) ENGINE = TinyLog"

cat /data/clean_data/datatransac_201707_backup.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO testDB.landing_transac FORMAT CSV"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="INSERT INTO TRANSAC_all select ID,STATIONIDIN,STATIONIDOUT,DTIN, toDate(substring(toString(DTIN),1,10)) as DTBUSINESS,DTOUT,OCTOPUS,SUBTYPE,TIME from testDB.landing_transac"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="DROP TABLE testDB.landing_transac" 
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE  TABLE IF  NOT  EXISTS testDB.landing_transac ( ID Int32, STATIONIDIN String, STATIONIDOUT String,DTIN DateTime,DTOUT DateTime,OCTOPUS String,SUBTYPE String,TIME Int64 ) ENGINE = TinyLog"

cat /data/clean_data/datatransac_201708_backup.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO landing_transac FORMAT CSV"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="INSERT INTO TRANSAC_all select ID,STATIONIDIN,STATIONIDOUT,DTIN, toDate(substring(toString(DTIN),1,10)) as DTBUSINESS,DTOUT,OCTOPUS,SUBTYPE,TIME from testDB.landing_transac"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="DROP TABLE testDB.landing_transac" 
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE  TABLE IF  NOT  EXISTS testDB.landing_transac ( ID Int32, STATIONIDIN String, STATIONIDOUT String,DTIN DateTime,DTOUT DateTime,OCTOPUS String,SUBTYPE String,TIME Int64 ) ENGINE = TinyLog"

cat /data/clean_data/datatransac_201709_backup.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO landing_transac FORMAT CSV"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="INSERT INTO TRANSAC_all select ID,STATIONIDIN,STATIONIDOUT,DTIN, toDate(substring(toString(DTIN),1,10)) as DTBUSINESS,DTOUT,OCTOPUS,SUBTYPE,TIME from testDB.landing_transac"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="DROP TABLE testDB.landing_transac" 
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE  TABLE IF  NOT  EXISTS testDB.landing_transac ( ID Int32, STATIONIDIN String, STATIONIDOUT String,DTIN DateTime,DTOUT DateTime,OCTOPUS String,SUBTYPE String,TIME Int64 ) ENGINE = TinyLog"

cat /data/clean_data/datatransac_201710_backup.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO landing_transac FORMAT CSV"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="INSERT INTO TRANSAC_all select ID,STATIONIDIN,STATIONIDOUT,DTIN, toDate(substring(toString(DTIN),1,10)) as DTBUSINESS,DTOUT,OCTOPUS,SUBTYPE,TIME from testDB.landing_transac"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="DROP TABLE testDB.landing_transac" 
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE  TABLE IF  NOT  EXISTS testDB.landing_transac ( ID Int32, STATIONIDIN String, STATIONIDOUT String,DTIN DateTime,DTOUT DateTime,OCTOPUS String,SUBTYPE String,TIME Int64 ) ENGINE = TinyLog"

cat /data/clean_data/datatransac_201711_backup.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO testDB.landing_transac FORMAT CSV"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="INSERT INTO TRANSAC_all select ID,STATIONIDIN,STATIONIDOUT,DTIN, toDate(substring(toString(DTIN),1,10)) as DTBUSINESS,DTOUT,OCTOPUS,SUBTYPE,TIME from testDB.landing_transac"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="DROP TABLE testDB.landing_transac" 
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE TABLE IF  NOT EXISTS testDB.landing_transac ( ID Int32, STATIONIDIN String, STATIONIDOUT String,DTIN DateTime,DTOUT DateTime,OCTOPUS String,SUBTYPE String,TIME Int64 ) ENGINE = TinyLog"

cat /data/clean_data/datatransac_201712_backup.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO testDB.landing_transac FORMAT CSV"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="INSERT INTO TRANSAC_all select ID,STATIONIDIN,STATIONIDOUT,DTIN, toDate(substring(toString(DTIN),1,10)) as DTBUSINESS,DTOUT,OCTOPUS,SUBTYPE,TIME from testDB.landing_transac"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="DROP TABLE testDB.landing_transac" 
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE  TABLE IF  NOT  EXISTS testDB.landing_transac ( ID Int32, STATIONIDIN String, STATIONIDOUT String,DTIN DateTime,DTOUT DateTime,OCTOPUS String,SUBTYPE String,TIME Int64 ) ENGINE = TinyLog"

cat /data/clean_data/KPI_2017.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO testDB.landing_kpi FORMAT CSV"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="INSERT INTO KPI_all select STATIONID,LINED,DIRECTION,toDate(substring(toString(DTKPI),1,10)) as DTBUSINESS,DTKPI,KPI from testDB.landing_kpi"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="DROP TABLE testDB.landing_kpi"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE TABLE IF  NOT  EXISTS testDB.landing_kpi (STATIONID String, LINED String, DIRECTION String, DTKPI DateTime, KPI Int64) ENGINE = TinyLog"

cat /data/clean_data/KPI_2018.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO testDB.landing_kpi FORMAT CSV"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="INSERT INTO KPI_all select STATIONID,LINED,DIRECTION,toDate(substring(toString(DTKPI),1,10)) as DTBUSINESS,DTKPI,KPI from testDB.landing_kpi"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="DROP TABLE testDB.landing_kpi"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE TABLE IF  NOT  EXISTS testDB.landing_kpi (STATIONID String, LINED String, DIRECTION String, DTKPI DateTime, KPI Int64) ENGINE = TinyLog"

cat /data/clean_data/Stations.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO STATIONS_all FORMAT CSV"
cat /data/clean_data/SubType.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO SUBTYPE_all FORMAT CSV"
cat /data/clean_data/Lines.csv | time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --database testDB --query="INSERT INTO LINES_all FORMAT CSV"