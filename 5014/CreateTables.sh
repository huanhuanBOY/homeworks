CREATE database testDB;
CREATE  DATABASE testDB

time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE TABLE  KPI (STATIONID String, LINED String, DIRECTION String,DTBUSINESS Date, DTKPI DateTime, KPI Int64) ENGINE = MergeTree(DTBUSINESS,(KPI,DTBUSINESS),8192)"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE TABLE  KPI_all as KPI ENGINE = Distributed(bip_ck_cluster, testDB, KPI, rand());"

time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE TABLE  TRANSAC ( ID Int32, STATIONIDIN String, STATIONIDOUT String,DTIN DateTime,DTBUSINESS Date,DTOUT DateTime,OCTOPUS String,SUBTYPE String,TIME Int64 ) ENGINE = MergeTree(DTBUSINESS,(ID,DTBUSINESS),8192)"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE TABLE  TRANSAC_all as TRANSAC ENGINE = Distributed(bip_ck_cluster, testDB, TRANSAC, rand());"

time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE TABLE  STATIONS (STATIONID String, STATIONDESC String, MAINLINEID String) ENGINE = TinyLog"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE TABLE  STATIONS_all as STATIONS ENGINE = Distributed(bip_ck_cluster, testDB, STATIONS, rand());"

time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE TABLE  LINES (LINED String, LINEDESC String, LINECOLOR String) ENGINE = TinyLog"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE TABLE  LINES_all as LINES ENGINE = Distributed(bip_ck_cluster, testDB, LINES, rand());"

time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE TABLE  SUBTYPE (SUBTYPEID String, SUBTYPEDESC String) ENGINE = TinyLog"
time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE TABLE  SUBTYPE_all as SUBTYPE ENGINE = Distributed(bip_ck_cluster, testDB, SUBTYPE, rand());"

time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE TABLE  IF  NOT  EXISTS  landing_transac ( ID Int32, STATIONIDIN String, STATIONIDOUT String,DTIN DateTime,DTOUT DateTime,OCTOPUS String,SUBTYPE String,TIME Int64 ) ENGINE = TinyLog"

time -ao clickhouse.log clickhouse-client --host 127.0.0.1 --port 9000 --user admin --password admin01 --database testDB --query="CREATE TABLE  IF  NOT  EXISTS  landing_kpi (STATIONID String, LINED String, DIRECTION String, DTKPI DateTime, KPI Int64) ENGINE = TinyLog"
