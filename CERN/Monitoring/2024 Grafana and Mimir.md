# Monitoring with Grafana and Mimir

Introduced Grafana 2016. Tried scale oud with InfluxDB in 2020 and then switched to Mimir.

## Sizing

Grafana

- 5000 Grafana users
- 70 Grafana organizations
- 2700 dashboard
- 680 alert rules

TSDB 

- 40 days default TSDB retention
- kubernetes monitoring cluster with ~50 nodes (730 cores, 1,2 TB RAM)
- 29 Mimir tenants
- 30 Mio active series, could scale to 150 Mio active series and 2000 queries per second

## Stack

- kubernetes
- Grafana
- Grafana Mimir
- AWS S3 for long term storage

## References

- https://grafana.com/blog/2025/01/02/how-cern-uses-grafana-and-mimir-to-monitor-the-worlds-largest-computer-grid/
