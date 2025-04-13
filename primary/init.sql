-- Crear base de datos si no existe
DO $$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'mydb') THEN
      EXECUTE 'CREATE DATABASE mydb';
   END IF;
END $$;

-- Crear usuario replicator
DO $$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles WHERE rolname = 'replicator'
   ) THEN
      CREATE ROLE replicator WITH REPLICATION LOGIN PASSWORD 'replicator';
   ELSE
      ALTER ROLE replicator WITH PASSWORD 'replicator';
   END IF;
END $$;
