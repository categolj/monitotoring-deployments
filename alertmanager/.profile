set -e

sed -i "s|SLACK_WEBHOOK_URL|${SLACK_WEBHOOK_URL}|" /home/vcap/app/alertmanager.yml
