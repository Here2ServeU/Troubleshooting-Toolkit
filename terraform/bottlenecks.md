
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
**Symptoms:** Frequent `terraform apply` errors or state locking issues.  
**Cause:** Simultaneous operations or use of local state files.  
**Resolution:** Use remote state with locking (e.g., S3 + DynamoDB for AWS), avoid running concurrent applies.

## 2. Unencrypted Remote States
**Symptoms:** Sensitive data exposed in plaintext.  
**Cause:** Storing state files in unencrypted storage.  
**Resolution:** Enable encryption on S3 buckets, Blob storage, or GCS buckets.

## 3. Hardcoded Secrets in Variables
**Symptoms:** Secrets visible in repo or output.  
**Cause:** Secrets placed directly in Terraform files or variable defaults.  
**Resolution:** Use secret managers like AWS SSM, HashiCorp Vault, or environment variables.

## 4. Drift Between Code and Infra
**Symptoms:** Unexpected changes during plan or apply.  
**Cause:** Manual changes made outside Terraform.  
**Resolution:** Run `terraform plan` regularly and automate drift detection with CI pipelines.

## 5. Improper Use of Count vs for_each
**Symptoms:** Unexpected resource deletions or creations.  
**Cause:** `count` used on maps or sets causing index mismatch.  
**Resolution:** Use `for_each` for map/set iteration and `count` for simple lists.

## 6. Improperly Scoped Providers
**Symptoms:** Wrong region or account targeted.  
**Cause:** Missing provider aliasing in modules.  
**Resolution:** Use provider `alias` and pass explicitly to modules.

## 7. Resource Re-creation Instead of Update
**Symptoms:** Resources destroyed and recreated on minor changes.  
**Cause:** Changing immutable fields without lifecycle configuration.  
**Resolution:** Use `lifecycle` blocks to prevent destroy or enable in-place updates.

## 8. Circular Dependencies
**Symptoms:** Terraform plan fails with cycle errors.  
**Cause:** Resources referencing each other directly or indirectly.  
**Resolution:** Use `depends_on` judiciously or refactor modules to eliminate cycles.

## 9. Missing Lifecycle Blocks
**Symptoms:** Unintentional deletion or downtime.  
**Cause:** Lifecycle behavior not defined.  
**Resolution:** Add lifecycle blocks such as `prevent_destroy`, `create_before_destroy`.

## 10. IAM Policies Overwrite Each Other
**Symptoms:** Only one IAM policy remains after apply.  
**Cause:** Inline IAM policies defined across multiple resources.  
**Resolution:** Use `aws_iam_policy` + `aws_iam_policy_attachment` to manage policies separately.

## 11. Overuse of Data Sources
**Symptoms:** Terraform plan takes too long or rate-limits occur.  
**Cause:** Heavy reliance on real-time `data` lookups.  
**Resolution:** Cache values in locals or variables where possible.

## 12. Unpinned Module Versions
**Symptoms:** Unexpected changes after `init`.  
**Cause:** No version control on module sources.  
**Resolution:** Use `?ref=` in Git modules or pin Terraform Registry modules with version constraints.

## 13. Excessive Resource Nesting
**Symptoms:** Hard-to-read and unmaintainable files.  
**Cause:** Overuse of nested objects or `locals`.  
**Resolution:** Split modules by responsibility, simplify and flatten variable structures.

## 14. Lack of Input Variable Validation
**Symptoms:** Unexpected errors during runtime.  
**Cause:** No validation logic or constraints on variables.  
**Resolution:** Use `validation` blocks and `type` enforcement on input variables.

## 15. Terraform Plan Timeout
**Symptoms:** CLI hangs during `plan` or `apply`.  
**Cause:** Large state files or inefficient graph dependencies.  
**Resolution:** Break configs into smaller modules and use targeted planning (`-target`).

## 16. Provider Rate Limiting
**Symptoms:** API throttling or quota errors.  
**Cause:** Too many parallel requests or data sources.  
**Resolution:** Stagger plans, reduce data source usage, or apply retry logic where supported.

## 17. Inconsistent Tagging via Modules
**Symptoms:** Missing or inconsistent tags on resources.  
**Cause:** Tag inputs not propagated across all modules.  
**Resolution:** Define a shared `tags` map and pass it to each module.

## 18. Failure to Lock State
**Symptoms:** Conflicts when multiple users run applies.  
**Cause:** Local state or unconfigured backend locking.  
**Resolution:** Use Terraform Cloud or S3 + DynamoDB lock tables for team environments.

## 19. Plan/Apply Permissions Misconfigured
**Symptoms:** `terraform apply` fails for team members.  
**Cause:** IAM roles or permissions too limited.  
**Resolution:** Define fine-grained IAM or RBAC permissions aligned to Terraform actions.

## 20. Invalid or Outdated Provider Plugins
**Symptoms:** Provider errors or missing features.  
**Cause:** Old or incompatible provider versions.  
**Resolution:** Pin providers in `required_providers` and regularly run `terraform init -upgrade`.


