# Observability Bottlenecks

### Helpful Documentation for Observability Platforms

- [Prometheus Documentation](https://prometheus.io/docs/)
- [Grafana Documentation](https://grafana.com/docs/)
- [Dynatrace Documentation](https://docs.dynatrace.com/docs/)
- [Datadog Documentation](https://docs.datadoghq.com/)
- [ELK Stack Documentation (Elastic)](https://www.elastic.co/guide/en/observability/current/index.html)

## Table of Contents
- [1. Missing Metrics for Core Services](#1-missing-metrics-for-core-services)
- [2. No Log Rotation Configured](#2-no-log-rotation-configured)
- [3. Improper Alert Thresholds](#3-improper-alert-thresholds)
- [4. Too Many False Positives in Alerts](#4-too-many-false-positives-in-alerts)
- [5. Lack of Distributed Tracing](#5-lack-of-distributed-tracing)
- [6. Unstructured Log Formats](#6-unstructured-log-formats)
- [7. Overuse of Debug Logs in Production](#7-overuse-of-debug-logs-in-production)
- [8. No Correlation Between Logs/Traces/Metrics](#8-no-correlation-between-logs-traces-metrics)
- [9. Missing Dashboards for SLOs](#9-missing-dashboards-for-slos)
- [10. Delayed Metric Ingestion](#10-delayed-metric-ingestion)
- [11. No Blackbox Monitoring](#11-no-blackbox-monitoring)
- [12. Overloaded Prometheus Targets](#12-overloaded-prometheus-targets)
- [13. Improper Retention Policies](#13-improper-retention-policies)
- [14. Unused Alerts Consuming Quota](#14-unused-alerts-consuming-quota)
- [15. Misaligned Alerting Hours and Teams](#15-misaligned-alerting-hours-and-teams)
- [16. Missing Anomaly Detection](#16-missing-anomaly-detection)
- [17. Slow Query Performance in Grafana](#17-slow-query-performance-in-grafana)
- [18. Metric Name Collisions](#18-metric-name-collisions)
- [19. Alert Fatigue from Repetitive Events](#19-alert-fatigue-from-repetitive-events)
- [20. No Log-based Alerting](#20-no-log-based-alerting)

## 1. Missing Metrics for Core Services

**Symptoms:** Critical metrics are unavailable, leading to blind spots in service health.
**Cause:** Lack of instrumentation or misconfigured exporters.
**Resolution:**
- Identify key services and ensure they expose metrics via Prometheus exporters.
- Use OpenTelemetry for consistent metric instrumentation.
- Set up alerting rules for missing or stale metrics.

## 2. No Log Rotation Configured

**Symptoms:** Log files grow indefinitely, filling up disk space.
**Cause:** Missing or misconfigured logrotate rules.
**Resolution:**
- Install and configure logrotate for key log files.
- Test log rotation policies manually.
- Monitor disk space and log file size trends.

## 3. Improper Alert Thresholds

**Symptoms:** Alerts trigger too early or too late.
**Cause:** Thresholds not based on historical baselines or service SLOs.
**Resolution:**
- Review service SLOs and set thresholds accordingly.
- Use percentiles (e.g., 95th) instead of averages.
- Continuously review and tune alert conditions.

## 4. Too Many False Positives in Alerts

**Symptoms:** Noise in alerting system, making real incidents harder to detect.
**Cause:** Overly aggressive or poorly tuned alert rules.
**Resolution:**
- Group related alerts using labels and routing trees.
- Suppress alerts during known maintenance windows.
- Introduce dampening and deduplication logic.

## 5. Lack of Distributed Tracing

**Symptoms:** Hard to trace requests across services.
**Cause:** Missing instrumentation in services or lack of tracing backend.
**Resolution:**
- Integrate OpenTelemetry SDK in services.
- Export traces to Jaeger or Zipkin.
- Visualize call graphs to find latency bottlenecks.

## 6. Unstructured Log Formats

**Symptoms:** Logs are hard to parse and search.
**Cause:** Use of free-form or inconsistent logging formats.
**Resolution:**
- Adopt structured logging with JSON format.
- Use centralized log management (e.g., Loki, ELK).
- Define standard logging keys across services.

## 7. Overuse of Debug Logs in Production

**Symptoms:** Log noise, increased storage and ingestion costs.
**Cause:** Debug logs left enabled in production environments.
**Resolution:**
- Use environment-specific log levels.
- Rotate and archive logs regularly.
- Apply sampling for verbose logs.

## 8. No Correlation Between Logs/Traces/Metrics

**Symptoms:** Hard to diagnose incidents quickly.
**Cause:** No common trace or correlation IDs.
**Resolution:**
- Implement trace ID propagation in logs and metrics.
- Use observability tools that support correlation (e.g., Datadog, New Relic).
- Include trace IDs in alerts.

## 9. Missing Dashboards for SLOs

**Symptoms:** Teams lack visibility into reliability goals.
**Cause:** SLOs defined but not visualized.
**Resolution:**
- Create SLO dashboards in Grafana or Azure Monitor.
- Align alerts with error budget burn rate.
- Share dashboards with stakeholders.

## 10. Delayed Metric Ingestion

**Symptoms:** Dashboards and alerts lag behind real-time events.
**Cause:** Push gateway failures or exporter bottlenecks.
**Resolution:**
- Monitor scrape intervals and exporter health.
- Use local storage buffers if needed.
- Scale Prometheus or scrape endpoints horizontally.

## 11. No Blackbox Monitoring

**Symptoms:** External service issues go undetected.
**Cause:** Lack of synthetic probes or health checks.
**Resolution:**
- Deploy Prometheus Blackbox Exporter.
- Monitor key endpoints (HTTP, TCP, ICMP).
- Alert on failure or slow probe responses.

## 12. Overloaded Prometheus Targets

**Symptoms:** Some targets intermittently disappear.
**Cause:** Too many metrics or slow responses during scraping.
**Resolution:**
- Optimize exporter performance and scrape intervals.
- Reduce cardinality of exported labels.
- Distribute targets across multiple Prometheus instances.

## 13. Improper Retention Policies

**Symptoms:** Unnecessary disk usage or data loss.
**Cause:** Default or poorly defined Prometheus retention settings.
**Resolution:**
- Set retention time based on data access needs.
- Use remote storage for long-term metric storage.
- Delete stale or unused TSDB blocks.

## 14. Unused Alerts Consuming Quota

**Symptoms:** Too many configured alerts with no value.
**Cause:** Legacy or test alerts never cleaned up.
**Resolution:**
- Audit and delete alerts not triggered in months.
- Document alert purpose and owners.
- Use templates for consistent alert rule naming.

## 15. Misaligned Alerting Hours and Teams

**Symptoms:** Alerts missed due to off-hours or wrong teams.
**Cause:** No on-call alignment or timezone mismatch.
**Resolution:**
- Use alert routing rules with schedule awareness.
- Rotate on-call responsibilities fairly.
- Provide escalation paths in Alertmanager.

## 16. Missing Anomaly Detection

**Symptoms:** Spikes or drops in metrics missed by static thresholds.
**Cause:** No ML-based or statistical detection mechanisms.
**Resolution:**
- Enable anomaly detection features in Grafana or Azure Monitor.
- Use tools like Prometheus Adaptive Alerts.
- Train models on historical data for dynamic baselines.

## 17. Slow Query Performance in Grafana

**Symptoms:** Dashboards take too long to load.
**Cause:** Complex queries or over-fetched time ranges.
**Resolution:**
- Optimize queries by reducing range and resolution.
- Enable caching and use dashboard variables.
- Split dashboards into focused panels.

## 18. Metric Name Collisions

**Symptoms:** Conflicting metrics across services.
**Cause:** Same metric names used with different meanings.
**Resolution:**
- Namespace all metrics (e.g., app_http_requests_total).
- Enforce naming conventions and lint rules.
- Run Prometheus config validation regularly.

## 19. Alert Fatigue from Repetitive Events

**Symptoms:** Engineers start ignoring alerts.
**Cause:** Lack of deduplication or escalation logic.
**Resolution:**
- Use silence windows and alert grouping.
- Track alert frequency to detect flapping.
- Route repeated alerts to backlog instead of paging.

## 20. No Log-based Alerting

**Symptoms:** Incidents missed when not metric-based.
**Cause:** Only metrics or traces are monitored.
**Resolution:**
- Set up log alerting with Loki, Azure Log Analytics, or ELK.
- Define log patterns for failures or errors.
- Correlate log alerts with other observability data.

