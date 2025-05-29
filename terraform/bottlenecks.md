# Terraform Bottlenecks

### Helpful Docs:
- [Terraform Official Documentation](https://developer.hashicorp.com/terraform/docs)
- [Terraform State](https://developer.hashicorp.com/terraform/language/state)
- [Terraform Modules](https://developer.hashicorp.com/terraform/language/modules)

## Table of Contents
- [1. State File Conflicts](#1-state-file-conflicts)
- [2. Unencrypted Remote States](#2-unencrypted-remote-states)
- [3. Hardcoded Secrets in Variables](#3-hardcoded-secrets-in-variables)
- [4. Drift Between Code and Infra](#4-drift-between-code-and-infra)
- [5. Improper Use of Count vs for_each](#5-improper-use-of-count-vs-for_each)
- [6. Improperly Scoped Providers](#6-improperly-scoped-providers)
- [7. Resource Re-creation Instead of Update](#7-resource-re-creation-instead-of-update)
- [8. Circular Dependencies](#8-circular-dependencies)
- [9. Missing Lifecycle Blocks](#9-missing-lifecycle-blocks)
- [10. IAM Policies Overwrite Each Other](#10-iam-policies-overwrite-each-other)
- [11. Overuse of Data Sources](#11-overuse-of-data-sources)
- [12. Unpinned Module Versions](#12-unpinned-module-versions)
- [13. Excessive Resource Nesting](#13-excessive-resource-nesting)
- [14. Lack of Input Variable Validation](#14-lack-of-input-variable-validation)
- [15. Terraform Plan Timeout](#15-terraform-plan-timeout)
- [16. Provider Rate Limiting](#16-provider-rate-limiting)
- [17. Inconsistent Tagging via Modules](#17-inconsistent-tagging-via-modules)
- [18. Failure to Lock State](#18-failure-to-lock-state)
- [19. Plan/Apply Permissions Misconfigured](#19-planapply-permissions-misconfigured)
- [20. Invalid or Outdated Provider Plugins](#20-invalid-or-outdated-provider-plugins)

## 1. State File Conflicts
**Symptoms:** Frequent errors during `terraform apply` like state lock or drift.
**Cause:** Simultaneous applies or lack of remote state locking.
**Fix:** Use remote backends (e.g., S3 + DynamoDB lock), avoid parallel applies.

## 2. Unencrypted Remote States
**Symptoms:** Exposed sensitive information in plain text.
**Cause:** Remote backends not configured with encryption.
**Fix:** Use encrypted S3 buckets, enable SSE, and secure access with IAM policies.

## 3. Hardcoded Secrets in Variables
**Symptoms:** Secrets visible in `.tf` files or git history.
**Cause:** Storing values directly instead of referencing secret managers.
**Fix:** Use Terraform environment variables or tools like AWS SSM, Vault.

## 4. Drift Between Code and Infra
**Symptoms:** Infrastructure changes made outside of Terraform.
**Cause:** Manual modifications or out-of-band tools.
**Fix:** Run `terraform plan` regularly; educate teams to use Terraform for all changes.

## 5. Improper Use of Count vs for_each
**Symptoms:** Indexing bugs or unintended resource recreation.
**Cause:** Misuse of `count` with keyed resources.
**Fix:** Use `for_each` for key-addressable resources (e.g., maps).

## 6. Improperly Scoped Providers
**Symptoms:** Resources fail to authenticate or target the wrong region.
**Cause:** Lack of provider aliasing or module-specific providers.
**Fix:** Use `alias` and explicitly define provider blocks per module.

## 7. Resource Re-creation Instead of Update
**Symptoms:** Existing resources destroyed and recreated.
**Cause:** Changing immutable arguments or missing lifecycle rules.
**Fix:** Use `lifecycle { prevent_destroy = true }` or refactor resource logic.

## 8. Circular Dependencies
**Symptoms:** Terraform plan fails due to dependency loop.
**Cause:** Resources referencing each other directly or via outputs.
**Fix:** Break dependency cycles using `depends_on` or re-architect outputs.

## 9. Missing Lifecycle Blocks
**Symptoms:** Accidental deletions or downtime during applies.
**Cause:** No lifecycle protection or behavior specification.
**Fix:** Use lifecycle blocks like `prevent_destroy`, `create_before_destroy`.

## 10. IAM Policies Overwrite Each Other
**Symptoms:** Only the last policy remains in effect.
**Cause:** Using inline policies instead of merging documents.
**Fix:** Combine policies or use `aws_iam_policy_attachment`.

## 11. Overuse of Data Sources
**Symptoms:** Long plan times, rate-limiting from APIs.
**Cause:** Too many real-time API lookups via `data`.
**Fix:** Cache values in variables or refactor into modules with outputs.

## 12. Unpinned Module Versions
**Symptoms:** Unexpected changes after `terraform get` or `init`.
**Cause:** No version control for remote modules.
**Fix:** Pin module sources with specific versions or commits.

## 13. Excessive Resource Nesting
**Symptoms:** Difficult-to-read configs and debug complexity.
**Cause:** Deep variable trees or excessive locals nesting.
**Fix:** Flatten structures and split large files into modular, reusable code.

## 14. Lack of Input Variable Validation
**Symptoms:** User errors, failed applies due to invalid inputs.
**Cause:** No `validation` block on variables.
**Fix:** Add input validation rules and defaults for safer execution.

## 15. Terraform Plan Timeout
**Symptoms:** CLI freezes or plan takes too long.
**Cause:** Massive state files, inefficient queries.
**Fix:** Optimize module use, break out large configs, use targeted plans.

## 16. Provider Rate Limiting
**Symptoms:** API throttling or error messages from cloud providers.
**Cause:** Too many simultaneous reads or writes.
**Fix:** Use `timeouts`, reduce `data` usage, respect provider rate limits.

## 17. Inconsistent Tagging via Modules
**Symptoms:** Tags missing or inconsistent across resources.
**Cause:** No tag standards or inconsistent variable use.
**Fix:** Pass standard `tags` map to every module as a required input.

## 18. Failure to Lock State
**Symptoms:** Conflicting changes by multiple users.
**Cause:** Local state or unconfigured backend locking.
**Fix:** Use Terraform Cloud or S3 + DynamoDB for locking mechanisms.

## 19. Plan/Apply Permissions Misconfigured
**Symptoms:** Users cannot deploy or modify infrastructure.
**Cause:** IAM roles too restrictive or wrong scope.
**Fix:** Align IAM policies to allow `plan` and `apply` for required resources.

## 20. Invalid or Outdated Provider Plugins
**Symptoms:** Errors about provider compatibility or bugs.
**Cause:** Using outdated or incompatible provider versions.
**Fix:** Pin provider versions in `required_providers`, regularly run `terraform init -upgrade`.

