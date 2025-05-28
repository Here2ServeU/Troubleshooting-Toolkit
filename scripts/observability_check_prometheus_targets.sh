#!/bin/bash
# Query Prometheus targets API to check for down targets
PROM_URL="http://localhost:9090/api/v1/targets"
echo "Checking Prometheus targets..."
curl -s $PROM_URL | jq '.data.activeTargets[] | select(.health != "up") | {instance: .labels.instance, health: .health}'
