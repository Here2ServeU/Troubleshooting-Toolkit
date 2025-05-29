# Kubernetes Bottlenecks

### Helpful Docs: [Kubernetes Docs](https://kubernetes.io/docs/)

## Table of Contents

* [1. CrashLoopBackOff Errors](#crashloopbackoff-errors)
* [2. ImagePullBackOff](#imagepullbackoff)
* [3. PodEviction due to Resource Pressure](#podeviction-due-to-resource-pressure)
* [4. Unbound PersistentVolumeClaims](#unbound-persistentvolumeclaims)
* [5. Incorrect Liveness/Readiness Probes](#incorrect-livenessreadiness-probes)
* [6. Inconsistent Replica Counts](#inconsistent-replica-counts)
* [7. Improper RBAC Configurations](#improper-rbac-configurations)
* [8. Missing Resource Limits](#missing-resource-limits)
* [9. Failed StatefulSet Scaling](#failed-statefulset-scaling)
* [10. No PodDisruptionBudgets](#no-poddisruptionbudgets)
* [11. DNS Resolution Failures in Cluster](#dns-resolution-failures-in-cluster)
* [12. Kubelet Disk Pressure Warnings](#kubelet-disk-pressure-warnings)
* [13. Too Many Open Connections in Services](#too-many-open-connections-in-services)
* [14. Node NotReady Issues](#node-notready-issues)
* [15. Missing or Misconfigured Network Policies](#missing-or-misconfigured-network-policies)
* [16. Secrets Mounted as Plaintext](#secrets-mounted-as-plaintext)
* [17. Broken HPA Configs](#broken-hpa-configs)
* [18. No Network Segmentation](#no-network-segmentation)
* [19. Horizontal Pod Autoscaler Not Triggering](#horizontal-pod-autoscaler-not-triggering)
* [20. Node Pool Fragmentation](#node-pool-fragmentation)

## 1. CrashLoopBackOff Errors

**Symptoms:**
Pods continuously crash and restart, with status `CrashLoopBackOff`.

**Cause:**
Failed initialization, bad environment config, or exceptions in application startup.

**Fix:**

* Inspect logs via `kubectl logs <pod-name>`.
* Review init containers and startup scripts.
* Ensure proper environment configuration.

## 2. ImagePullBackOff

**Symptoms:**
Pod fails to start; image cannot be pulled.

**Cause:**
Incorrect image name, tag, or unauthenticated private registry.

**Fix:**

* Validate image path and credentials.
* Use imagePullSecrets for private repos.

## 3. PodEviction due to Resource Pressure

**Symptoms:**
Pods evicted automatically by the scheduler.

**Cause:**
Node CPU/memory/disk exceeds thresholds.

**Fix:**

* Monitor node usage with `kubectl describe node`.
* Allocate resource limits; use taints/tolerations effectively.

## 4. Unbound PersistentVolumeClaims

**Symptoms:**
Pods hang with `Pending` PVCs.

**Cause:**
No matching PersistentVolume.

**Fix:**

* Check PVC and PV specs.
* Enable dynamic provisioning if using a StorageClass.

## 5. Incorrect Liveness/Readiness Probes

**Symptoms:**
Healthy pods marked as failed and restarted.

**Cause:**
Incorrect probe path, port, or thresholds.

**Fix:**

* Validate probe configuration.
* Use `curl` or `wget` inside the pod to test endpoints.

## 6. Inconsistent Replica Counts

**Symptoms:**
Scaling doesn't match desired state.

**Cause:**
Manual pod deletions or failed autoscaler config.

**Fix:**

* Set correct `replicas` in deployment.
* Review HPA or custom autoscaler setup.

## 7. Improper RBAC Configurations

**Symptoms:**
Service accounts lack permissions; errors like `forbidden`.

**Cause:**
Incorrect `RoleBinding` or `ClusterRoleBinding`.

**Fix:**

* Use `kubectl auth can-i` to verify access.
* Update RBAC rules with least privilege.

## 8. Missing Resource Limits

**Symptoms:**
Pods consume excessive resources.

**Cause:**
No `resources.limits` or `requests` defined.

**Fix:**

* Define CPU/memory limits.
* Use LimitRange policies.

## 9. Failed StatefulSet Scaling

**Symptoms:**
New pods not scheduled or remain in pending.

**Cause:**
Missing storage resources or node constraints.

**Fix:**

* Confirm PVC templates.
* Review affinity rules.

## 10. No PodDisruptionBudgets

**Symptoms:**
Disruptions during voluntary maintenance.

**Cause:**
No PDB defined for HA-critical apps.

**Fix:**

* Add PDB to ensure minimal replicas stay available.

## 11. DNS Resolution Failures in Cluster

**Symptoms:**
Pods can't resolve service names.

**Cause:**
CoreDNS down or misconfigured.

**Fix:**

* Check CoreDNS pod logs.
* Verify kube-dns ConfigMap.

## 12. Kubelet Disk Pressure Warnings

**Symptoms:**
Node enters `NotReady` state.

**Cause:**
Disk space or inodes exhausted.

**Fix:**

* Clean up unused images or logs.
* Allocate larger disks or separate volumes.

## 13. Too Many Open Connections in Services

**Symptoms:**
Connection limits hit, users experience failures.

**Cause:**
Poor load balancing or backend saturation.

**Fix:**

* Configure maxConnections.
* Use connection pools or rate limiting.

## 14. Node NotReady Issues

**Symptoms:**
Nodes become `NotReady` in cluster.

**Cause:**
Kubelet issues, networking, or disk pressure.

**Fix:**

* Inspect kubelet logs.
* Restart node or drain and replace.

## 15. Missing or Misconfigured Network Policies

**Symptoms:**
Unexpected traffic access or failures.

**Cause:**
No policies enforcing east-west isolation.

**Fix:**

* Define ingress/egress policies.
* Test using network policy simulators.

## 16. Secrets Mounted as Plaintext

**Symptoms:**
Secrets exposed in container filesystems.

**Cause:**
Mounted as volumes or env vars.

**Fix:**

* Use external secrets manager.
* Limit access via RBAC.

## 17. Broken HPA Configs

**Symptoms:**
No scaling despite CPU/memory thresholds exceeded.

**Cause:**
HPA metrics misconfigured or missing.

**Fix:**

* Ensure `metrics-server` is running.
* Validate resource requests on deployment.

## 18. No Network Segmentation

**Symptoms:**
Flat network; noisy neighbor interference.

**Cause:**
No isolation for workloads.

**Fix:**

* Use namespaces and network policies.

## 19. Horizontal Pod Autoscaler Not Triggering

**Symptoms:**
Desired scale not reached under load.

**Cause:**
Invalid metrics or missing requests.

**Fix:**

* Configure correct HPA metric sources.
* Apply `resources.requests` to enable scaling.

## 20. Node Pool Fragmentation

**Symptoms:**
Suboptimal pod scheduling.

**Cause:**
Overprovisioned nodes with poor utilization.

**Fix:**

* Enable binpacking via scheduling policies.
* Consolidate node pools where possible.

