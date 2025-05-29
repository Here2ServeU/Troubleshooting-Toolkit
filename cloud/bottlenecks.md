# Cloud Bottlenecks

### Helpful Docs:
- [AWS Docs](https://docs.aws.amazon.com/)
- [GCP Docs](https://cloud.google.com/docs)
- [Azure Docs](https://learn.microsoft.com/en-us/azure/)

## Table of Contents

* [1. Misconfigured IAM Policies](#1-misconfigured-iam-policies)
* [2. Unused EC2 or VM Instances](#2-unused-ec2-or-vm-instances)
* [3. Lack of Cost Monitoring and Alerts](#3-lack-of-cost-monitoring-and-alerts)
* [4. Improper Tagging of Resources](#4-improper-tagging-of-resources)
* [5. Hardcoded Credentials in Code](#5-hardcoded-credentials-in-code)
* [6. Unoptimized Storage Classes](#6-unoptimized-storage-classes)
* [7. Lack of Multi-AZ/Region Redundancy](#7-lack-of-multi-azregion-redundancy)
* [8. Inefficient Auto Scaling Policies](#8-inefficient-auto-scaling-policies)
* [9. Publicly Accessible Storage Buckets](#9-publicly-accessible-storage-buckets)
* [10. Over-provisioned or Under-utilized Resources](#10-over-provisioned-or-under-utilized-resources)
* [11. Complex Networking Rules (Security Groups/ACLs)](#11-complex-networking-rules-security-groupsacls)
* [12. Missing Backups or Snapshots](#12-missing-backups-or-snapshots)
* [13. Unmonitored CloudTrail or Azure Activity Logs](#13-unmonitored-cloudtrail-or-azure-activity-logs)
* [14. Lack of Infrastructure as Code Governance](#14-lack-of-infrastructure-as-code-governance)
* [15. DNS Misconfigurations](#15-dns-misconfigurations)
* [16. Latency due to Region Mismatch](#16-latency-due-to-region-mismatch)
* [17. Overuse of On-Demand Instances](#17-overuse-of-on-demand-instances)
* [18. IAM Role or Azure RBAC Sprawl](#18-iam-role-or-azure-rbac-sprawl)
* [19. Underutilized Reserved Instances](#19-underutilized-reserved-instances)
* [20. Single Point of Failure in Load Balancers](#20-single-point-of-failure-in-load-balancers)


## 1. Misconfigured IAM Policies

**Symptoms:**
- Access denied or privilege escalation risks.

**Root Cause:**
- Overly permissive IAM or RBAC roles.

**Resolution:**
- Audit IAM/RBAC policies with least privilege in mind. Use access analyzers.

## 2. Unused EC2 or VM Instances

**Symptoms:**
- Wasted compute costs and orphaned infrastructure.

**Root Cause:**
- Manual provisioning without cleanup automation.

**Resolution:**
- Use cleanup scripts, TTLs, and automation tools to remove stale instances.

## 3. Lack of Cost Monitoring and Alerts

**Symptoms:**
- Unexpected spikes in cloud bills.

**Root Cause:**
- No budgeting tools or billing alerts configured.

**Resolution:**
- Set up cost budgets, forecast alerts, and anomaly detection tools.

## 4. Improper Tagging of Resources

**Symptoms:**
- Difficulty in cost tracking and resource ownership.

**Root Cause:**
- Lack of enforced tagging standards.

**Resolution:**
- Apply tagging policies and automate enforcement with Azure Policy or AWS Config.

## 5. Hardcoded Credentials in Code

**Symptoms:**
- Credentials found in version control or logs.

**Root Cause:**
- Manual secret entry and lack of secret rotation.

**Resolution:**
- Use cloud-native secret managers and rotate keys periodically.

## 6. Unoptimized Storage Classes

**Symptoms:**
- High storage bills due to using premium tiers for infrequent access.

**Root Cause:**
- Using standard storage when infrequent access or archival is enough.

**Resolution:**
- Migrate infrequently accessed data to cold or archive storage tiers.

## 7. Lack of Multi-AZ/Region Redundancy

**Symptoms:**
- Service outages during zone or region failures.

**Root Cause:**
- Services deployed in a single zone or region.

**Resolution:**
- Deploy across multiple AZs/regions and use global failover.

## 8. Inefficient Auto Scaling Policies

**Symptoms:**
- Insufficient scaling or overprovisioning leading to waste.

**Root Cause:**
- Wrong scaling policies or no scaling configuration.

**Resolution:**
- Implement dynamic scaling with thresholds and cooldowns configured.

## 9. Publicly Accessible Storage Buckets

**Symptoms:**
- Data breaches due to open buckets or blobs.

**Root Cause:**
- Storage resources misconfigured for public access.

**Resolution:**
- Review storage access policies and limit access via IAM conditions.

## 10. Over-provisioned or Under-utilized Resources

**Symptoms:**
- Inefficiencies from unused or oversized resources.

**Root Cause:**
- No rightsizing strategy implemented.

**Resolution:**
- Use cost optimization tools to identify and resize underused instances.

## 11. Complex Networking Rules (Security Groups/ACLs)

**Symptoms:**
- Security risks due to overly broad rules or conflicts.

**Root Cause:**
- Unrestricted IP ranges or overlapping ACL rules.

**Resolution:**
- Restrict ports and IPs strictly. Periodically audit network ACLs.

## 12. Missing Backups or Snapshots

**Symptoms:**
- Data loss or inability to recover from incidents.

**Root Cause:**
- No scheduled or automated backup strategies.

**Resolution:**
- Automate backup snapshots and test recovery plans regularly.

## 13. Unmonitored CloudTrail or Azure Activity Logs

**Symptoms:**
- No traceability or compliance audit capabilities.

**Root Cause:**
- Cloud logs disabled or misconfigured.

**Resolution:**
- Enable full cloud logging (CloudTrail, Activity Log) and centralize logs.

## 14. Lack of Infrastructure as Code Governance

**Symptoms:**
- Untracked manual changes causing configuration drift.

**Root Cause:**
- Terraform or ARM/Bicep templates ungoverned.

**Resolution:**
- Use IaC scanning tools and PR reviews to validate infrastructure changes.

## 15. DNS Misconfigurations

**Symptoms:**
- DNS resolution failures or misrouted traffic.

**Root Cause:**
- Typos or outdated DNS entries not corrected.

**Resolution:**
- Validate DNS records automatically using synthetic monitoring.

## 16. Latency due to Region Mismatch

**Symptoms:**
- Slow user experience due to services hosted far from users.

**Root Cause:**
- Global users forced to use a distant region.

**Resolution:**
- Match region to primary user geography and use CDN edge nodes.

## 17. Overuse of On-Demand Instances

**Symptoms:**
- Unpredictable billing or cost inefficiencies.

**Root Cause:**
- On-demand pricing used for long-term workloads.

**Resolution:**
- Consider Spot, Savings Plans, or RIs for predictable workloads.

## 18. IAM Role or Azure RBAC Sprawl

**Symptoms:**
- Difficulty in managing and auditing access controls.

**Root Cause:**
- Roles created per service or user without reuse.

**Resolution:**
- Consolidate roles and use permission boundaries. Audit unused roles.

## 19. Underutilized Reserved Instances

**Symptoms:**
- Unused capacity that adds to cost without benefit.

**Root Cause:**
- RIs not monitored or allocated properly.

**Resolution:**
- Track usage of RIs and reassign or sell unused ones via marketplaces.

## 20. Single Point of Failure in Load Balancers

**Symptoms:**
- Traffic downtime due to a single point of entry.

**Root Cause:**
- Load balancer not highly available or distributed.

**Resolution:**
- Use multi-AZ ALBs, global accelerators, or DNS-based failover strategies.
