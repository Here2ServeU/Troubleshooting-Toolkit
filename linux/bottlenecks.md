# Linux Bottlenecks

### Helpful Docs: [Linux Command Guide](https://linuxcommand.org/)

## Table of Contents

* [1. High CPU Load Average](#high-cpu-load-average)
* [2. Memory Swapping](#memory-swapping)
* [3. Zombie Processes](#zombie-processes)
* [4. Stale NFS Mounts](#stale-nfs-mounts)
* [5. Disk Space Exhaustion](#disk-space-exhaustion)
* [6. Incorrect File Permissions](#incorrect-file-permissions)
* [7. Full /tmp or /var Directories](#full-tmp-or-var-directories)
* [8. Slow Boot Due to Failed Services](#slow-boot-due-to-failed-services)
* [9. Outdated Packages](#outdated-packages)
* [10. Time Sync Issues (NTP)](#time-sync-issues-ntp)
* [11. Misconfigured Ulimits](#misconfigured-ulimits)
* [12. High I/O Wait Times](#high-io-wait-times)
* [13. Network Interface Flapping](#network-interface-flapping)
* [14. Syslog Flooding](#syslog-flooding)
* [15. Corrupted Filesystems](#corrupted-filesystems)
* [16. Untracked Cron Jobs](#untracked-cron-jobs)
* [17. SELinux Denials](#selinux-denials)
* [18. SSH Authentication Failures](#ssh-authentication-failures)
* [19. Hanging User Sessions](#hanging-user-sessions)
* [20. Kernel Panics or OOM Kill](#kernel-panics-or-oom-kill)

> Each bottleneck entry includes:
>
> * A description of the issue and its symptoms
> * Common root causes
> *️ ecommended tools and commands
> * Optional scripts or automation tips

---

## 1. High CPU Load Average

**Symptoms:** Elevated load average visible in `uptime`, `top`, or `htop`. Application response time slows down.

**Cause:** Background processes, misconfigured services, or infinite loops.

**Fix:**

* Use `top`, `htop`, or `pidstat` to identify CPU-heavy processes.
* Restart the offending process or service.
* Consider renicing or cgroup limitations.

---

## 2. Memory Swapping

**Symptoms:** System sluggishness, excessive swap usage (`free -m`, `vmstat`).

**Cause:** Insufficient RAM, memory leaks, aggressive swapping.

**Fix:**

* Tune swappiness (`vm.swappiness=10` in `/etc/sysctl.conf`).
* Identify memory-hogging processes with `ps aux --sort=-%mem`.
* Add more memory or optimize application usage.

---

## 3. Zombie Processes

**Symptoms:** Defunct processes seen in `ps -ef` or `top`.

**Cause:** Child processes not reaped by the parent.

**Fix:**

* Restart the parent process.
* Monitor with `top -b -n1 | grep Z`.

---

## 4. Stale NFS Mounts

**Symptoms:** `ls`, `df`, or `du` hang on NFS paths.

**Cause:** NFS server unresponsive or unreachable.

**Fix:**

* Use `umount -l /mountpoint` to force lazy unmount.
* Automate with `autofs` to avoid permanent hangs.

---

## 5. Disk Space Exhaustion

**Symptoms:** Errors writing to disk, apps crashing, `df -h` near 100%.

**Cause:** Log bloat, temporary file growth, orphaned files.

**Fix:**

* Use `du -sh *` and `ncdu` to identify large directories.
* Clean logs, use `logrotate`, delete old files.

---

## 6. Incorrect File Permissions

**Symptoms:** Access denied errors, applications not launching.

**Cause:** Files owned by wrong user/group, wrong mode bits.

**Fix:**

* Use `ls -l` and `chmod/chown` to correct.
* Apply ACLs with `setfacl` if needed.

---

## 7. Full /tmp or /var Directories

**Symptoms:** Services fail to start or crash unexpectedly.

**Cause:** Applications dumping temp files or logs unmonitored.

**Fix:**

* Clean with `tmpwatch` or `tmpreaper`.
* Schedule cron jobs to rotate.

---

## 8. Slow Boot Due to Failed Services

**Symptoms:** Long startup time, timeouts during `systemd` boot.

**Cause:** Broken services in boot chain.

**Fix:**

* `systemd-analyze blame`
* Disable failed services: `systemctl disable <service>`

---

## 9. Outdated Packages

**Symptoms:** Security alerts, feature incompatibility.

**Cause:** Lack of regular `apt/yum` upgrades.

**Fix:**

* Run `apt update && apt upgrade` or `yum update`.
* Automate with unattended-upgrades.

---

## 10. Time Sync Issues (NTP)

**Symptoms:** Incorrect timestamps, app failures, auth issues.

**Cause:** NTP service stopped or misconfigured.

**Fix:**

* Restart `systemd-timesyncd` or `chronyd`.
* Use `ntpq -p` or `timedatectl status` to verify.

---

## 11. Misconfigured Ulimits

**Symptoms:** Too many open files, process launch failure.

**Cause:** Default OS limits not increased.

**Fix:**

* Set in `/etc/security/limits.conf` and `pam.d`.
* `ulimit -n 65535`

---

## 12. High I/O Wait Times

**Symptoms:** System idle but sluggish; high `%wa` in `top`.

**Cause:** Disk contention, backups, database flushes.

**Fix:**

* Use `iotop`, `iostat`, or `dstat`.
* Move to faster disks or spread I/O.

---

## 13. Network Interface Flapping

**Symptoms:** Interfaces going up/down repeatedly.

**Cause:** Faulty NIC, loose cables, DHCP renewal issues.

**Fix:**

* `dmesg`, `journalctl -u NetworkManager`
* Replace cable, set static IP.

---

## 14. Syslog Flooding

**Symptoms:** Large logs, performance degradation.

**Cause:** Verbose services or misconfigurations.

**Fix:**

* Tune log levels in `/etc/rsyslog.conf`.
* Use `logrotate` and disk quotas.

---

## 15. Corrupted Filesystems

**Symptoms:** Read-only mounts, `fsck` prompts.

**Cause:** Unclean shutdowns, hardware errors.

**Fix:**

* Run `fsck -y` in maintenance mode.
* Replace failing disk.

---

## 16. Untracked Cron Jobs

**Symptoms:** Unexpected scripts running.

**Cause:** User or system-wide cron jobs left undocumented.

**Fix:**

* `crontab -l`, check `/etc/cron*`, audit job output.

---

## 17. SELinux Denials

**Symptoms:** `Permission denied` even with correct ACLs.

**Cause:** SELinux blocking action.

**Fix:**

* Use `sealert` or audit logs.
* Set proper context via `restorecon`.

---

## 18. SSH Authentication Failures

**Symptoms:** Users can't log in, `Permission denied (publickey)`.

**Cause:** Wrong key permissions or agent setup.

**Fix:**

* Ensure `~/.ssh/authorized_keys` exists.
* Correct file modes with `chmod 600 ~/.ssh/*`.

---

## 19. Hanging User Sessions

**Symptoms:** SSH sessions freeze, unresponsive terminals.

**Cause:** Hung shell processes, background jobs.

**Fix:**

* Kill stale TTYs: `pkill -t pts/X`
* Monitor `who -a`, `w`, `uptime`

---

## 20. Kernel Panics or OOM Kill

**Symptoms:** Sudden server reboots, memory dump logs.

**Cause:** Memory exhaustion or fatal kernel bugs.

**Fix:**

* Review `dmesg`, `/var/log/messages`, or crash dump.
* Install kdump; increase swap or RAM.

