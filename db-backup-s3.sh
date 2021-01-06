#!/bin/bash
host=$1
host_pass=$2
db_name=$3
Date=$(date +%H-%M-%S)

mysqldump -u root -h $host -p$host_pass $db_name > /tmp/backup-$Date.sql
export AWS_ACCESS_KEY_ID=AKIATHFVOOUJC2DABIFW && \
export AWS_SECRET_ACCESS_KEY=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 && \
aws s3 cp /tmp/backup-$Date.sql s3://jenkins-mysql-backup-idr/backup-$Date.sql

