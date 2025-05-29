# Databases Bottlenecks

### Helpful Docs: [PostgreSQL](https://www.postgresql.org/docs/) | [MySQL](https://dev.mysql.com/doc/)

## Table of Contents

* [1. Unoptimized Queries](#1-unoptimized-queries)
* [2. Missing Indexes](#2-missing-indexes)
* [3. Slow Connection Pooling](#3-slow-connection-pooling)
* [4. Inefficient Joins](#4-inefficient-joins)
* [5. Long-running Transactions](#5-long-running-transactions)
* [6. Blocking Locks](#6-blocking-locks)
* [7. High IOPS Due to Large Table Scans](#7-high-iops-due-to-large-table-scans)
* [8. Improper Backup Strategies](#8-improper-backup-strategies)
* [9. Non-standard Schema Evolution](#9-non-standard-schema-evolution)
* [10. Database Connection Saturation](#10-database-connection-saturation)
* [11. Replication Lag](#11-replication-lag)
* [12. High Latency in Read Replicas](#12-high-latency-in-read-replicas)
* [13. Disk Space Exhaustion](#13-disk-space-exhaustion)
* [14. Uncontrolled Autovacuum (Postgres)](#14-uncontrolled-autovacuum-postgres)
* [15. Improper Caching Strategy](#15-improper-caching-strategy)
* [16. Mismatched Charset or Collation](#16-mismatched-charset-or-collation)
* [17. Failing Deadlock Detection](#17-failing-deadlock-detection)
* [18. Poor Partitioning Strategy](#18-poor-partitioning-strategy)
* [19. Excessive Temporary Tables](#19-excessive-temporary-tables)
* [20. No Query Timeouts Configured](#20-no-query-timeouts-configured)

## 1. Unoptimized Queries

**Symptoms:**
Queries take longer than expected, cause CPU spikes, or slow down overall application performance.

**Cause:**
Poor query structure, missing WHERE clauses, inefficient operations (e.g., subqueries or Cartesian joins).

**Fix:**

* Use `EXPLAIN` to analyze queries.
* Refactor SQL to minimize full table scans.
* Use proper indexes.

## 2. Missing Indexes

**Symptoms:**
Frequent slow queries or full table scans.

**Cause:**
High volume read operations without supporting indexes.

**Fix:**

* Identify slow queries via slow log or pg\_stat\_statements.
* Add indexes to columns used in WHERE, JOIN, and ORDER BY.

## 3. Slow Connection Pooling

**Symptoms:**
Delayed response time during peak loads.

**Cause:**
Improper connection pool size or misconfigured pool settings.

**Fix:**

* Use connection poolers like PgBouncer or ProxySQL.
* Tune max connections and pool sizes.

## 4. Inefficient Joins

**Symptoms:**
Queries with JOINs are slow, especially with large datasets.

**Cause:**
Joining on unindexed columns or large datasets.

**Fix:**

* Index JOIN keys.
* Minimize number of JOINs in critical paths.
* Normalize vs. denormalize based on usage.

## 5. Long-running Transactions

**Symptoms:**
Table locks, increased replication lag, or stalled autovacuum.

**Cause:**
Transactions that remain open for long durations.

**Fix:**

* Close transactions promptly.
* Use timeouts for long queries.
* Audit application logic.

## 6. Blocking Locks

**Symptoms:**
Other queries are stuck or timing out.

**Cause:**
Locks not being released or deadlock situations.

**Fix:**

* Use `pg_stat_activity` to find blocked queries.
* Kill blocking queries.
* Refactor logic to avoid lock contention.

## 7. High IOPS Due to Large Table Scans

**Symptoms:**
Storage performance degradation, increased latency.

**Cause:**
Frequent full-table scans without WHERE clauses or indexes.

**Fix:**

* Add indexes.
* Use query caching layers.
* Partition large tables.

## 8. Improper Backup Strategies

**Symptoms:**
No recovery points or excessive recovery time.

**Cause:**
Lack of regular backups or poor RTO/RPO design.

**Fix:**

* Automate backups (logical or physical).
* Test recovery procedures.
* Schedule off-peak backup windows.

## 9. Non-standard Schema Evolution

**Symptoms:**
Schema drift across environments or unexpected errors after deployment.

**Cause:**
Manual schema changes, lack of migrations.

**Fix:**

* Use tools like Liquibase, Flyway, or Alembic.
* Adopt version-controlled migrations.

## 10. Database Connection Saturation

**Symptoms:**
App errors like “too many connections.”

**Cause:**
Max connections exceeded or improper connection closing.

**Fix:**

* Use pooling.
* Monitor and close unused connections.
* Increase connection limits if needed.

## 11. Replication Lag

**Symptoms:**
Stale reads from replicas.

**Cause:**
Network delays, slow disk I/O, or long-running queries.

**Fix:**

* Monitor lag with `pg_stat_replication`.
* Offload writes from replicas.
* Use faster disk or reduce query load.

## 12. High Latency in Read Replicas

**Symptoms:**
Slow read performance on replicas.

**Cause:**
Insufficient resources or slow replication apply rate.

**Fix:**

* Scale read replicas vertically.
* Use connection poolers to distribute read load.

## 13. Disk Space Exhaustion

**Symptoms:**
Database crashes or write failures.

**Cause:**
Unmanaged WAL files, logs, or large tables.

**Fix:**

* Rotate logs.
* Clean up old data.
* Monitor space with alerts.

## 14. Uncontrolled Autovacuum (Postgres)

**Symptoms:**
Table bloat or long-running autovacuum jobs.

**Cause:**
Autovacuum settings too aggressive or too lenient.

**Fix:**

* Tune autovacuum thresholds.
* Monitor with `pg_stat_user_tables`.

## 15. Improper Caching Strategy

**Symptoms:**
High DB load despite repeated queries.

**Cause:**
No or ineffective caching layer.

**Fix:**

* Use Redis or Memcached.
* Cache read-heavy queries.
* Invalidate cache correctly.

## 16. Mismatched Charset or Collation

**Symptoms:**
Data inconsistencies or failed joins.

**Cause:**
Different charsets across DB or between app and DB.

**Fix:**

* Align charset/collation across DB and clients.
* Use `pg_collation` to inspect.

## 17. Failing Deadlock Detection

**Symptoms:**
Queries stuck or failing silently.

**Cause:**
Long-held locks or circular locks.

**Fix:**

* Monitor with `pg_locks`.
* Refactor locking logic.

## 18. Poor Partitioning Strategy

**Symptoms:**
Poor query performance on large tables.

**Cause:**
Lack of or suboptimal partitioning.

**Fix:**

* Use range or hash partitioning.
* Match partitions to query patterns.

## 19. Excessive Temporary Tables

**Symptoms:**
High memory usage or temp file warnings.

**Cause:**
Overuse of temp tables or subqueries.

**Fix:**

* Refactor queries.
* Avoid large sorts or joins on temp data.

## 20. No Query Timeouts Configured

**Symptoms:**
Hung queries, app timeouts.

**Cause:**
No limits on query execution time.

**Fix:**

* Use `statement_timeout` (Postgres) or similar.
* Add query watchdogs at the app level.

