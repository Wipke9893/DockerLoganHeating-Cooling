BEGIN TRANSACTION;

-- Create 'users' table
CREATE TABLE users (
                       user_id SERIAL PRIMARY KEY,
                       username VARCHAR(50) NOT NULL UNIQUE,
                       password_hash VARCHAR(500) NOT NULL,
                       role VARCHAR(100) NOT NULL,
                       firstName VARCHAR(30),
                       lastName VARCHAR(30),
                       email VARCHAR(120),
                       phone VARCHAR(20)
);

-- Create 'chart_data' table
CREATE TABLE chart_data (
                            id SERIAL PRIMARY KEY,
                            timestamp TIMESTAMP NOT NULL,
                            value INT NOT NULL
);

COMMIT TRANSACTION;
