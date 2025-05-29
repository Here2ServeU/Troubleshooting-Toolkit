# Terraform Bottlenecks

### Helpful Docs: [Terraform Docs](https://developer.hashicorp.com/terraform/docs)

## Table of Contents
- [1. State File Conflicts](#state-file-conflicts)
- [2. Unencrypted Remote States](#unencrypted-remote-states)
- [3. Hardcoded Secrets in Variables](#hardcoded-secrets-in-variables)
- [4. Drift Between Code and Infra](#drift-between-code-and-infra)
- [5. Improper Use of Count vs for_each](#improper-use-of-count-vs-for_each)
- [6. Improperly Scoped Providers](#improperly-scoped-providers)
- [7. Resource Re-creation Instead of Update](#resource-re-creation-instead-of-update)
- [8. Circular Dependencies](#circular-dependencies)
- [9. Missing Lifecycle Blocks](#missing-lifecycle-blocks)
- [10. IAM Policies Overwrite Each Other](#iam-policies-overwrite-each-other)
- [11. Overuse of Data Sources](#overuse-of-data-sources)
- [12. Unpinned Module Versions](#unpinned-module-versions)
- [13. Excessive Resource Nesting](#excessive-resource-nesting)
- [14. Lack of Input Variable Validation](#lack-of-input-variable-validation)
- [15. Terraform Plan Timeout](#terraform-plan-timeout)
- [16. Provider Rate Limiting](#provider-rate-limiting)
- [17. Inconsistent Tagging via Modules](#inconsistent-tagging-via-modules)
- [18. Failure to Lock State](#failure-to-lock-state)
- [19. Plan/Apply Permissions Misconfigured](#plan/apply-permissions-misconfigured)
- [20. Invalid or Outdated Provider Plugins](#invalid-or-outdated-provider-plugins)

## State File Conflicts

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Unencrypted Remote States

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Hardcoded Secrets in Variables

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Drift Between Code and Infra

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Improper Use of Count vs for_each

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Improperly Scoped Providers

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Resource Re-creation Instead of Update

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Circular Dependencies

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Missing Lifecycle Blocks

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## IAM Policies Overwrite Each Other

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Overuse of Data Sources

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Unpinned Module Versions

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Excessive Resource Nesting

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Lack of Input Variable Validation

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Terraform Plan Timeout

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Provider Rate Limiting

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Inconsistent Tagging via Modules

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Failure to Lock State

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Plan/Apply Permissions Misconfigured

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.


## Invalid or Outdated Provider Plugins

**Symptoms:**  
This issue typically presents as unexpected behavior such as performance degradation, service interruptions, security warnings, or failure to deploy or scale.

**Cause:**  
Common causes include misconfigurations, resource mismanagement, version incompatibilities, lack of monitoring, or poor architectural decisions.

**Fix:**  
- Analyze logs or metrics related to this issue using recommended tools.
- Refer to the official documentation or guidelines.
- Implement configuration changes or best practices as needed.
- Automate detection and remediation if possible.

