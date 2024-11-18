CREATE ROLE replicator WITH REPLICATION LOGIN PASSWORD 'replicator';

SELECT pg_is_in_recovery();