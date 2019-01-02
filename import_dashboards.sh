#!/bin/bash

token=$1
grafana_host='docker0'

for file in ./dashboards/*
do
  if [[ -f $file ]]; then
    echo $file
    #cat $file

    curl -vv http://$grafana_host:3000/api/dashboards/db \
      -H "Accept: application/json" \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $token" \
      -d @$file
  fi
done

