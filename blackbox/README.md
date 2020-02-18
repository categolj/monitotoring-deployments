```
BLACKBOX_VERSION=0.16.0
if [ ! -d blackbox_exporter-${BLACKBOX_VERSION}.linux-amd64 ];then
    wget https://github.com/prometheus/blackbox_exporter/releases/download/v${BLACKBOX_VERSION}/blackbox_exporter-${BLACKBOX_VERSION}.linux-amd64.tar.gz
    tar xzf blackbox_exporter-${BLACKBOX_VERSION}.linux-amd64.tar.gz
    rm -f blackbox_exporter-${BLACKBOX_VERSION}.linux-amd64.tar.gz
fi

cf push blackbox -m 64m -b binary_buildpack -c "./blackbox_exporter-${BLACKBOX_VERSION}.linux-amd64/blackbox_exporter --web.listen-address=:8080 --config.file=./blackbox.yml" 
```