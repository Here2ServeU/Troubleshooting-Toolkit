# Cloud Bottlenecks

### Helpful Docs: [AWS Docs](https://docs.aws.amazon.com/) | [GCP Docs](https://cloud.google.com/docs) | [Azure Docs](https://learn.microsoft.com/en-us/azure/)

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

<!-- Each entry should follow the same updated format with applicable references to Azure where necessary. -->

## 1. Misconfigured IAM Policies

**Symptoms:**

* Denied access to cloud resources.
* Excessive or missing permissions.

**Root Cause:**

* Poorly scoped IAM or Azure RBAC roles.
* Lack of least-privilege principle enforcement.

**Resolution:**

* Use IAM Access Analyzer (AWS), Policy Troubleshooter (Azure), or GCP IAM Recommender.
* Audit and tighten policies regularly.
* Automate policy validations via tools like Conftest or Open Policy Agent.

---

## 2. Unused EC2 or VM Instances

**Symptoms:**

* Higher than expected compute costs.
* Orphaned VMs or instances running without purpose.

**Root Cause:**

* Manual provisioning without proper tagging or decommissioning.

**Resolution:**

* Use AWS Trusted Advisor, Azure Advisor, or GCP Recommender to detect idle compute.
* Tag all compute resources with owner and purpose.
* Set TTL policies or scheduled shutdowns.

---

## 3. Lack of Cost Monitoring and Alerts

**Symptoms:**

* Unexpected monthly billing spikes.

**Root Cause:**

* No budgets or alerting set for services.

**Resolution:**

* Enable Cost Explorer (AWS), Cost Management + Billing (Azure), or GCP Billing Alerts.
* Use anomaly detection tools.
* Set up automation to stop resources exceeding thresholds.

---

## 4. Improper Tagging of Resources

**Symptoms:**

* Difficulty identifying unused or duplicate resources.

**Root Cause:**

* Inconsistent or missing tags.

**Resolution:**

* Define and enforce a tagging policy.
* Use Tag Policies (AWS), Azure Policy, or GCP Labels.

---

## 5. Hardcoded Credentials in Code

**Symptoms:**

* Security breaches, leaked secrets.

**Root Cause:**

* Developers embedding access keys or service credentials in source code.

**Resolution:**

* Use secret managers like AWS Secrets Manager, Azure Key Vault, or GCP Secret Manager.
* Scan code repos with GitHub Advanced Security or truffleHog.

---

<!-- Repeat this format for the rest of the bottlenecks, adding Azure equivalents where relevant. -->

