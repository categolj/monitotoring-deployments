```
ALERTMANAGER_VERSION=0.20.0
if [ ! -d alertmanager-${ALERTMANAGER_VERSION}.linux-amd64 ];then
    wget https://github.com/prometheus/alertmanager/releases/download/v${ALERTMANAGER_VERSION}/alertmanager-${ALERTMANAGER_VERSION}.linux-amd64.tar.gz
    tar xzf alertmanager-${ALERTMANAGER_VERSION}.linux-amd64.tar.gz
    rm -f alertmanager-${ALERTMANAGER_VERSION}.linux-amd64.tar.gz
fi
```


```
cf push alertmanager -m 64m -b binary_buildpack -c "./alertmanager-${ALERTMANAGER_VERSION}.linux-amd64/alertmanager --web.listen-address=:8080 --config.file=./alertmanager.yml --web.external-url=https://alertmanager.apps.pcfone.io" --no-start
cf set-env alertmanager SLACK_WEBHOOK_URL https://hooks.slack.com/services/**********
cf start alertmanager
```