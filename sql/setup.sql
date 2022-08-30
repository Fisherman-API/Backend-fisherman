-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS fish CASCADE;
DROP TABLE IF EXISTS profile CASCADE;
DROP TABLE IF EXISTS regulations CASCADE;
DROP TABLE IF EXISTS fish_regulations CASCADE;

CREATE TABLE profile (
        id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        count VARCHAR NOT NULL,
        type VARCHAR NOT NULL,
        location VARCHAR NOT NULL
);


CREATE TABLE users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username TEXT NOT NULL,
    email VARCHAR UNIQUE,
    password_hash VARCHAR NOT NULL
);


CREATE TABLE fish (
    id BIGINT,
    name VARCHAR NOT NULL PRIMARY KEY,
    detail TEXT NOT NULL
   
    
);

INSERT INTO fish (name, detail) VALUES 
('Red-Fish', 'Red Fish detail');







CREATE TABLE regulations (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL ,
    region VARCHAR NOT NULL,
    rules VARCHAR NOT NULL,
    seasons VARCHAR NOT NULL
);

INSERT INTO regulations (name, region, rules, seasons) VALUES 
('Red-Fish', 'Atlantic Ocean', 'catch&release', 'All Year'),
('pollock', 'North Pacific Ocean', '1 Adult per day', 'All Year'),
('Flounder', 'Northern Cali through the bering Sea', '1 Adult per day, 20 per Year', 'oct-dec'),
('Atlantic Bigeye Tuna', 'Atlantic, Pacific, Indian Oceans', 'catch limit may vary', 'All Year'),
('Atlantic BlackTip Shark', 'Gulf of Mexico', 'shark dealer permit required, limit 4 per year', 'All Year');

-- CREATE TABLE fish_regulations (
--     id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     fish_name VARCHAR NOT NULL,
--     regulations_name VARCHAR NOT NULL,
--     name VARCHAR NOT NULL,
--     FOREIGN KEY (fish_name) REFERENCES regulations(name),
--     region VARCHAR NOT NULL,
--     FOREIGN KEY (regulations_name) REFERENCES regulations(name),
--     rules VARCHAR NOT NULL,
--     seasons VARCHAR NOT NULL
-- );






