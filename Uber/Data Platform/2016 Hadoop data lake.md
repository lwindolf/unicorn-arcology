# Hadoop Data Lake (2016)

Leverages Hadoop to enable horizontal scaling.

```mermaid
flowchart TB
  Kafka-->Ingestion[Ingestion EL]
  RDBMS-->Ingestion
  KVs-->Ingestion
  
  Ingestion-->Hadoop
  subgraph Hadoop
    Parquet
  end
  
  Hadoop<-->ETL
  Hadoop-->DWH[Vertica Data Warehouse]
  Hadoop-->Tools
  subgraph Tools
    Hive
    Spark
    Presto
    Notebooks
  end
  
  DWH-->Analytics
  Tools-->Analytics
  subgraph Analytics[Ad hoc Analytics]
    CityOps[City Ops]
    DS[Data Scientists]
  end
  
  Tools-->Applications
  subgraph Applications
    ETLModelling[ETL Modelling]
    CityOps2[City Ops]
    ML
    Experiments
  end  
```

## Limitations

- HDFS NameNode load
- still high latency
- handling historical data
- HDFS/Parquet don't support updating data

## Sizing

- max storage: 10PB
- max latency: 24h
- max cores: 10000 vcores
- max jobs: 100000/day

## Stack

- Hadoop
- Parquet
- ETL
- Kafka
- Sharded KV
- Hive
- Spark
- Presto
- Vertica

## References
- \1 https://eng.uber.com/uber-big-data-platform/
- \2 https://1fykyq3mdn5r21tpna3wkdyi-wpengine.netdna-ssl.com/wp-content/uploads/2018/10/image8.png
