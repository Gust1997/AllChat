#!/bin/bash

# Ensure PostgreSQL data directory exists
mkdir -p /var/lib/postgresql/data

# Initialize the PostgreSQL database cluster
sudo -u postgres /usr/lib/postgresql/13/bin/initdb -D /var/lib/postgresql/data

# Start PostgreSQL using the full path to pg_ctl
sudo -u postgres /usr/lib/postgresql/13/bin/pg_ctl start -D /var/lib/postgresql/data -l /var/log/postgresql/postgresql.log

sleep 10

psql -U postgres -c "CREATE USER gustavo WITH PASSWORD 'december';"
psql -U postgres -c "CREATE DATABASE all_chat;"
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE all_chat TO gustavo;"


sudo -u gustavo python3 /app/manage.py runserver 0.0.0.0:8000