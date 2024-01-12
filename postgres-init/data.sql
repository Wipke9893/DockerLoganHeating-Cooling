BEGIN TRANSACTION;

-- Inserting initial data into 'users' table
INSERT INTO users (username, password_hash, role) VALUES ('user', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (username, password_hash, role) VALUES ('admin', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_ADMIN');
INSERT INTO users (username, password_hash, role) VALUES ('bob', '$2a$10$ocEQn6rIm3xDEr7SVUSLPuu5YFG12RBTu82uBgGXlwJUsf2AWH1Bq', 'ROLE_ADMIN');
INSERT INTO users (username, password_hash, role) VALUES ('jack', '$2a$10$xVN8wyDaN1j4YGOmQnVQbemuSxUR3C0C0zhx/i21Q7/jqUX0zPVNG', 'ROLE_ADMIN');

-- Inserting initial data into 'chart_data' table
INSERT INTO chart_data (timestamp, value) VALUES ('2023-01-01 00:00:00', 100);
INSERT INTO chart_data (timestamp, value) VALUES ('2023-02-01 00:00:00', 200);
-- Add more data as needed

COMMIT TRANSACTION;
