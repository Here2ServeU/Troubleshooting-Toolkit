# Terraform Bottlenecks

## Table of Contents

- [1. State File Conflicts](#1-state-file-conflicts)

- [2. Unencrypted Remote States](#2-unencrypted-remote-states)

## 1. State File Conflicts

**Symptoms:**  
Terraform apply fails due to locked or outdated state.

**Cause:**  
Concurrent changes or lack of proper locking in remote backends.

**Fix:**

- Use backends with locking (S3 + DynamoDB).

- Avoid multiple concurrent terraform apply executions.

## 2. Unencrypted Remote States

**Symptoms:**  
Sensitive values are exposed in state storage.

**Cause:**  
Remote state storage (e.g., S3) lacks encryption settings.

**Fix:**

- Enable SSE (Server-Side Encryption) on S3.

- Restrict access using IAM policies.

