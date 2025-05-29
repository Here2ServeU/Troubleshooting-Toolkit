# Cloud and DevOps Scripts Collection

### Helpful Documentation

| Tool / Platform | Docs |
|-----------------|------|
| [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html) | Amazon Web Services |
| [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/) | Microsoft Azure |
| [GCP CLI (gcloud)](https://cloud.google.com/sdk/docs) | Google Cloud |
| [Docker CLI](https://docs.docker.com/engine/reference/commandline/docker/) | Docker |
| [Kubernetes (kubectl)](https://kubernetes.io/docs/reference/kubectl/) | Kubernetes |
| [MySQL](https://dev.mysql.com/doc/) | MySQL |
| [PostgreSQL](https://www.postgresql.org/docs/) | PostgreSQL |
| [MongoDB](https://www.mongodb.com/docs/manual/) | MongoDB |
| [Prometheus](https://prometheus.io/docs/introduction/overview/) | Prometheus |
| [Grafana](https://grafana.com/docs/) | Grafana |
| [Dynatrace](https://www.dynatrace.com/support/help/) | Dynatrace |
| [Datadog](https://docs.datadoghq.com/) | Datadog |
| [ELK Stack](https://www.elastic.co/guide/index.html) | Elasticsearch, Logstash, Kibana |
| [Terraform](https://developer.hashicorp.com/terraform/docs) | HashiCorp Terraform |

---

### Table of Contents

- [Cloud Scripts](#cloud-scripts)
- [Containers Scripts](#containers-scripts)
- [Databases Scripts](#databases-scripts)
- [Kubernetes Scripts](#kubernetes-scripts)
- [Linux Scripts](#linux-scripts)
- [Observability Scripts](#observability-scripts)
- [Terraform Scripts](#terraform-scripts)

---

## Cloud Scripts

### Check AWS S3 Bucket Public Access
```bash
#!/bin/bash
aws s3api list-buckets --query 'Buckets[].Name' --output text | while read bucket; do
  acl=$(aws s3api get-bucket-acl --bucket "$bucket")
  echo "$bucket ACL: $acl"
done
```

### Check Azure Resource Health
```bash
#!/bin/bash
az resource list --query "[].{name:name, type:type}" -o table
```

### Check GCP Compute Engine Status
```bash
#!/bin/bash
gcloud compute instances list
```

### List EC2 Instances by Region
```bash
#!/bin/bash
for region in $(aws ec2 describe-regions --query 'Regions[*].RegionName' --output text); do
  echo "Region: $region"
  aws ec2 describe-instances --region $region
done
```

### Cloud Cost Estimation (AWS)
```bash
#!/bin/bash
aws ce get-cost-and-usage --time-period Start=$(date -d '30 days ago' +%F),End=$(date +%F) --granularity MONTHLY --metrics "UnblendedCost" 
```

---

## Containers Scripts

### List Running Docker Containers
```bash
#!/bin/bash
docker ps
```

### Restart All Docker Containers
```bash
#!/bin/bash
docker restart $(docker ps -q)
```

### Remove All Exited Containers
```bash
#!/bin/bash
docker rm $(docker ps -a -f status=exited -q)
```

### Scan Container Images for Vulnerabilities
```bash
#!/bin/bash
trivy image nginx
```

### Monitor Container Logs
```bash
#!/bin/bash
docker logs -f $(docker ps -q | head -1)
```

---

## Databases Scripts

### Check MySQL Uptime
```bash
#!/bin/bash
mysqladmin -u root -p status
```

### Backup PostgreSQL Database
```bash
#!/bin/bash
pg_dump -U postgres dbname > backup.sql
```

### Check MongoDB Status
```bash
#!/bin/bash
mongo --eval 'db.runCommand({ serverStatus: 1 })'
```

### Monitor MySQL Slow Queries
```bash
#!/bin/bash
mysql -e "SHOW FULL PROCESSLIST;" -u root -p
```

### List PostgreSQL Connections
```bash
#!/bin/bash
psql -c "SELECT * FROM pg_stat_activity;" -U postgres
```

---

## Kubernetes Scripts

### Get Pod Statuses
```bash
#!/bin/bash
kubectl get pods -A
```

### Restart a Deployment
```bash
#!/bin/bash
kubectl rollout restart deployment <deployment-name> -n <namespace>
```

### Check Cluster Nodes
```bash
#!/bin/bash
kubectl get nodes -o wide
```

### Monitor Events
```bash
#!/bin/bash
kubectl get events --sort-by=.metadata.creationTimestamp
```

### Scan Kubernetes Cluster with kube-bench
```bash
#!/bin/bash
kube-bench run --config-dir cfg --config cfg/config.yaml
```

## Linux Scripts

### Check Disk Usage
```bash
#!/bin/bash
df -h
```

```bash
#!/bin/bash
# Check disk usage and alert if above 80%

THRESHOLD=80
df -h | awk 'NR>1 {print $5 " " $6}' | while read output; do
  usep=$(echo $output | awk '{ print $1}' | sed 's/%//g')
  partition=$(echo $output | awk '{ print $2 }')
  if [ $usep -ge $THRESHOLD ]; then
    echo "Warning: Disk usage above ${THRESHOLD}% on partition $partition"
  fi
done
```

### Monitor Memory Usage
```bash
#!/bin/bash
free -m
```

### Check CPU Load
```bash
#!/bin/bash
uptime
```

### Find Large Files
```bash
#!/bin/bash
find / -type f -size +100M -exec ls -lh {} \;
```

### Check Open Ports
```bash
#!/bin/bash
netstat -tulpn | grep LISTEN
```

## Observability Scripts

### Prometheus Targets Health
```bash
#!/bin/bash
curl -s http://localhost:9090/api/v1/targets | jq .
```

### Grafana Availability Check
```bash
#!/bin/bash
curl -s -o /dev/null -w "%{http_code}" http://localhost:3000
```

### Check Alertmanager Alerts
```bash
#!/bin/bash
curl -s http://localhost:9093/api/v2/alerts | jq .
```

### List Loki Log Streams
```bash
#!/bin/bash
curl -s 'http://localhost:3100/loki/api/v1/label/job/values' | jq .
```

### Export SLO Dashboard JSON
```bash
#!/bin/bash
curl -H "Authorization: Bearer <API_KEY>" http://localhost:3000/api/dashboards/uid/<UID> | jq .
```

## Terraform Scripts

### Validate Terraform Configs
```bash
#!/bin/bash
terraform validate
```

### Show Planned Changes
```bash
#!/bin/bash
terraform plan
```

### Apply Terraform Plan
```bash
#!/bin/bash
terraform apply -auto-approve
```

### Destroy Terraform Infrastructure
```bash
#!/bin/bash
terraform destroy -auto-approve
```

### List Terraform Resources
```bash
#!/bin/bash
terraform state list
```


