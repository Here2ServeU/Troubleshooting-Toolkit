# Containers Bottlenecks

### Helpful Docs: [Docker Docs](https://docs.docker.com/) | [Podman Docs](https://docs.podman.io/) | [Azure Container Instances](https://learn.microsoft.com/en-us/azure/container-instances/) | [AWS ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/what-is-ecs.html) | [Google Cloud Run](https://cloud.google.com/run/docs)

## Table of Contents

* [1. High Container Startup Time](#1-high-container-startup-time)
* [2. Image Pull Failures](#2-image-pull-failures)
* [3. Large Container Image Sizes](#3-large-container-image-sizes)
* [4. Improper Resource Requests and Limits](#4-improper-resource-requests-and-limits)
* [5. Container Restarts due to OOM](#5-container-restarts-due-to-oom)
* [6. Log Bloat Inside Containers](#6-log-bloat-inside-containers)
* [7. Container Time Drift](#7-container-time-drift)
* [8. Privileged Containers Running in Prod](#8-privileged-containers-running-in-prod)
* [9. Poorly Defined Health Checks](#9-poorly-defined-health-checks)
* [10. Unscanned Container Images](#10-unscanned-container-images)
* [11. Improper Volume Mounting](#11-improper-volume-mounting)
* [12. Insecure Secrets Management](#12-insecure-secrets-management)
* [13. Inconsistent Base Images](#13-inconsistent-base-images)
* [14. Lack of Immutable Image Tags](#14-lack-of-immutable-image-tags)
* [15. Docker Daemon Overload](#15-docker-daemon-overload)
* [16. Too Many Layers in Dockerfiles](#16-too-many-layers-in-dockerfiles)
* [17. Network Conflicts Across Containers](#17-network-conflicts-across-containers)
* [18. Missing Environment Variables](#18-missing-environment-variables)
* [19. Stale PID Files](#19-stale-pid-files)
* [20. Unclean Exit Traps](#20-unclean-exit-traps)

## 1. High Container Startup Time

**Symptoms:**  
Containers take a long time to initialize.

**Root Cause:**  
Large images, excessive init processes, or high resource contention.

**Resolution:**  
Use slim base images (e.g., Alpine), simplify entrypoints, analyze logs with `docker logs` or `az container logs`.


## 2. Image Pull Failures

**Symptoms:**  
Pods stuck in `ImagePullBackOff` or `ErrImagePull`.

**Root Cause:**  
Incorrect image name, registry permissions, or network issues.

**Resolution:**  
Verify registry access, check ACR permissions, test `docker pull` manually.


## 3. Large Container Image Sizes

**Symptoms:**  
High disk usage and long build times.

**Root Cause:**  
Unoptimized Dockerfiles with unused packages.

**Resolution:**  
Use `.dockerignore`, multi-stage builds, and tools like Dive.


## 4. Improper Resource Requests and Limits

**Symptoms:**  
OOM kills, CPU throttling.

**Root Cause:**  
Misconfigured resource constraints.

**Resolution:**  
Set appropriate `--memory` and `--cpus` flags or define in YAML specs.


## 5. Container Restarts due to OOM

**Symptoms:**  
Frequent container crashes.

**Root Cause:**  
Memory usage exceeds allocated limit.

**Resolution:**  
Analyze `docker inspect`, adjust memory limits, optimize app usage.


## 6. Log Bloat Inside Containers

**Symptoms:**  
Disk space exhaustion.

**Root Cause:**  
Excessive logging without rotation.

**Resolution:**  
Use log drivers (`json-file`, `none`), mount log volumes, rotate logs.


## 7. Container Time Drift

**Symptoms:**  
Timestamp mismatch in logs.

**Root Cause:**  
Host/container time desynchronization.

**Resolution:**  
Ensure NTP on host, mount `/etc/timezone`, use `TZ` env variable.


## 8. Privileged Containers Running in Prod

**Symptoms:**  
Elevated security risk.

**Root Cause:**  
Containers running with `--privileged` or high capabilities.

**Resolution:**  
Avoid `--privileged`, drop Linux capabilities, scan with Trivy.


## 9. Poorly Defined Health Checks

**Symptoms:**  
Containers marked healthy but unresponsive.

**Root Cause:**  
Missing or misconfigured health checks.

**Resolution:**  
Add `HEALTHCHECK` in Dockerfile or YAML specs with meaningful probes.


## 10. Unscanned Container Images

**Symptoms:**  
Vulnerabilities in runtime.

**Root Cause:**  
Lack of image scanning in CI/CD.

**Resolution:**  
Use tools like Trivy, Clair, or Azure Defender for Containers.


## 11. Improper Volume Mounting

**Symptoms:**  
Data not persisting or inaccessible.

**Root Cause:**  
Incorrect bind or volume mount paths.

**Resolution:**  
Check `-v` flags or `mountPath`, validate with `docker inspect`.


## 12. Insecure Secrets Management

**Symptoms:**  
Secrets visible in container env or logs.

**Root Cause:**  
Hardcoded or unencrypted secrets.

**Resolution:**  
Use Docker secrets, Azure Key Vault, or Kubernetes secrets.


## 13. Inconsistent Base Images

**Symptoms:**  
App behavior differs across environments.

**Root Cause:**  
Unpinned or mixed base images.

**Resolution:**  
Use consistent pinned base images, scan dependencies.


## 14. Lack of Immutable Image Tags

**Symptoms:**  
Drift in environments despite same tag.

**Root Cause:**  
Retagging images (e.g., `latest`).

**Resolution:**  
Use SHA digests or versioned tags, enforce via policies.


## 15. Docker Daemon Overload

**Symptoms:**  
Slow container response or commands hang.

**Root Cause:**  
Too many containers/images or daemon config issues.

**Resolution:**  
Prune unused images, restart Docker, inspect daemon logs.


## 16. Too Many Layers in Dockerfiles

**Symptoms:**  
Build slowness or caching issues.

**Root Cause:**  
Excessive `RUN`, `COPY`, and `ADD` layers.

**Resolution:**  
Combine commands, use minimal steps, leverage `&&`.


## 17. Network Conflicts Across Containers

**Symptoms:**  
Connectivity issues or port clashes.

**Root Cause:**  
Same host port, overlapping bridge networks.

**Resolution:**  
Use user-defined networks, assign unique ports.


## 18. Missing Environment Variables

**Symptoms:**  
Crashes or undefined behaviors.

**Root Cause:**  
Required env vars not passed.

**Resolution:**  
Use `.env` files, `--env` flag, or secret injection.


## 19. Stale PID Files

**Symptoms:**  
Services fail to start.

**Root Cause:**  
PID file left from previous session.

**Resolution:**  
Add cleanup scripts in entrypoint, or `rm /tmp/app.pid`.


## 20. Unclean Exit Traps

**Symptoms:**  
Orphaned resources, zombie processes.

**Root Cause:**  
Missing `trap` or signal handling.

**Resolution:**  
Use `trap` in shell entrypoints or graceful shutdown handlers.

