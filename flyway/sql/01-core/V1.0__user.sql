--
-- CUSTOM USERS
--
-- create user atenea
CREATE USER IF NOT EXISTS 'atenea'@'%' IDENTIFIED BY '#{MYSQL_PASSWORD}#';

-- grant client replication
GRANT REPLICATION CLIENT ON *.* TO 'atenea'@'%' WITH GRANT OPTION;

-- atenea user permission - ALL PRIVILEGES (full access - CREATE, DROP, DELETE, INSERT, SELECT, UPDATE)
GRANT ALL PRIVILEGES ON atenea.* TO 'atenea'@'%';
FLUSH PRIVILEGES;
GRANT SELECT ON performance_schema.user_variables_by_thread TO atenea;

--
-- REPLICATION USER
--
-- replicator user permission - REPLICATION CLIENT PRIVILEGE (is a global privilege so we cannot set to atenea DB)
CREATE USER IF NOT EXISTS 'replicator'@'%' IDENTIFIED BY '#{MYSQL_PASSWORD}#';
GRANT REPLICATION CLIENT ON *.* TO 'replicator'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
GRANT SELECT ON performance_schema.user_variables_by_thread TO replicator;