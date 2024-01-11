-- ********************************************************************************
-- This script creates the database users and grants them the necessary permissions
-- ********************************************************************************

CREATE USER logan_app_user
WITH PASSWORD 'logan_app_user';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO logan_app_user;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO logan_app_user;
