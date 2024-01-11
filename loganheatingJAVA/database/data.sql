BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');   -- User ID 1
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');  -- User ID 2
INSERT INTO users (username,password_hash,role) VALUES ('bob','$2a$10$ocEQn6rIm3xDEr7SVUSLPuu5YFG12RBTu82uBgGXlwJUsf2AWH1Bq','ROLE_ADMIN');  -- User ID 3
INSERT INTO users (username,password_hash,role) VALUES ('jack','$2a$10$xVN8wyDaN1j4YGOmQnVQbemuSxUR3C0C0zhx/i21Q7/jqUX0zPVNG','ROLE_ADMIN');  -- User ID 4

INSERT INTO public.chart_data (timestamp, value) VALUES ('2023-01-01 00:00:00', 100);
INSERT INTO public.chart_data (timestamp, value) VALUES ('2023-02-01 00:00:00', 200);
INSERT INTO public.chart_data (timestamp, value) VALUES ('2023-03-01 00:00:00', 300);
INSERT INTO public.chart_data (timestamp, value) VALUES ('2023-04-01 00:00:00', 400);
INSERT INTO public.chart_data (timestamp, value) VALUES ('2023-05-01 00:00:00', 500);
INSERT INTO public.chart_data (timestamp, value) VALUES ('2023-06-01 00:00:00', 600);
INSERT INTO public.chart_data (timestamp, value) VALUES ('2023-07-01 00:00:00', 700);
INSERT INTO public.chart_data (timestamp, value) VALUES ('2023-08-01 00:00:00', 800);
INSERT INTO public.chart_data (timestamp, value) VALUES ('2023-09-01 00:00:00', 900);



COMMIT TRANSACTION;