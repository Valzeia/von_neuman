-- Runs only on the first start of an empty Postgres data volume.
CREATE SCHEMA IF NOT EXISTS game;

COMMENT ON SCHEMA game IS 'von_neuman RTS simulation data.';
