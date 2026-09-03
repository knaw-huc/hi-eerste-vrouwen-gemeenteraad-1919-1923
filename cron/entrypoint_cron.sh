#!/bin/sh

mv /app/crontab /etc/cron.d/crontab

crontab /etc/cron.d/crontab
touch /var/log/cron.log

# Eerste keer meteen draaien, anders is het volume leeg tot het volgende hele uur
/app/crontask.sh >> /var/log/cron.log 2>&1

cron && tail -f /var/log/cron.log
