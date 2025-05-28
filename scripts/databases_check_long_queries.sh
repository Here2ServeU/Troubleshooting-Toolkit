#!/bin/bash
# Check long-running queries in PostgreSQL
echo "Checking long-running queries in PostgreSQL..."
psql -U postgres -c "SELECT pid, age(clock_timestamp(), query_start), query FROM pg_stat_activity WHERE state != 'idle' AND now() - query_start > interval '5 minutes';"
