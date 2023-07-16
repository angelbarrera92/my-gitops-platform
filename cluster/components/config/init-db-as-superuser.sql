-- https://www.windmill.dev/docs/advanced/self_host#run-windmill-without-using-a-postgres-superuser

-- https://raw.githubusercontent.com/windmill-labs/windmill/main/init-db-as-superuser.sql
CREATE ROLE windmill_user;

GRANT ALL
ON ALL TABLES IN SCHEMA public 
TO windmill_user;

GRANT ALL PRIVILEGES 
ON ALL SEQUENCES IN SCHEMA public 
TO windmill_user;

ALTER DEFAULT PRIVILEGES 
    IN SCHEMA public
    GRANT ALL ON TABLES TO windmill_user;

ALTER DEFAULT PRIVILEGES 
    IN SCHEMA public
    GRANT ALL ON SEQUENCES TO windmill_user;


CREATE ROLE windmill_admin WITH BYPASSRLS;
GRANT windmill_user TO windmill_admin;

-- Set up the windmill user
GRANT windmill_admin TO windmill;
GRANT windmill_user TO windmill;
