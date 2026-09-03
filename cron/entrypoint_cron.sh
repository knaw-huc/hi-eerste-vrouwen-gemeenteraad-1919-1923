#!/bin/sh

mv /app/crontab /etc/cron.d/crontab

crontab /etc/cron.d/crontab
touch /var/log/cron.log

cron && tail -f /var/log/cron.log
