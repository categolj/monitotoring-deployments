```
PROMETHEUS_VERSION=2.16.0
if [ ! -d prometheus-${PROMETHEUS_VERSION}.linux-amd64 ];then
    wget https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz
    tar xzf prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz
    rm -f prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz
fi

cf push prometheus -k 2G -b binary_buildpack --random-route -c "./prometheus-${PROMETHEUS_VERSION}.linux-amd64/prometheus --web.listen-address=:8080 --config.file=./prometheus.yml"
```