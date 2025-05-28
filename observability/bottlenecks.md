# Observability Bottlenecks

## Table of Contents

- [1. Missing Metrics for Core Services](#1-missing-metrics-for-core-services)

- [2. No Log Rotation Configured](#2-no-log-rotation-configured)

## 1. Missing Metrics for Core Services

**Symptoms:**  
Important services do not emit metrics; dashboards show gaps or missing data.

**Cause:**  
Instrumentation is missing, disabled, or misconfigured in application code or
exporters.

**Fix:**

- Ensure services expose relevant metrics (e.g., Prometheus, Datadog,

CloudWatch).

- Validate scrape configs and exporter setup.

- Restart services and confirm ingestion in dashboards.

## 2. No Log Rotation Configured

**Symptoms:**  
Log files grow indefinitely, consuming disk space and slowing down access.

**Cause:**  
Missing `logrotate` setup or manual rotation in the system config.

**Fix:**

- Configure `logrotate` or systemd journal limits.

- Archive or compress old logs.

- Monitor disk space with automated alerts.

