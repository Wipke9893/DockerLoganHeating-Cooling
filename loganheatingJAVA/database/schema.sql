BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
                       user_id SERIAL,
                       username varchar(50) NOT NULL UNIQUE,
                       password_hash varchar(500) NOT NULL,
                       role varchar(100) NOT NULL,
                       firstName varchar(30),
                       lastName varchar(30),
                       email varchar(120),
                       phone varchar(20),
                       CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE chart_data (
                            id SERIAL PRIMARY KEY,
                            timestamp TIMESTAMP NOT NULL,
                            value INT NOT NULL
);

COMMIT TRANSACTION;
