-- Create a new user and set permissions
CREATE USER logan_app_user WITH PASSWORD 'logan_app_user';

GRANT ALL PRIVILEGES ON DATABASE logan_heating TO logan_app_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO logan_app_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO logan_app_user;
