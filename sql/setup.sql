-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS fish CASCADE;
DROP TABLE IF EXISTS profile CASCADE;

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
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL,
    detail TEXT NOT NULL,
    quantity VARCHAR NOT NULL,
    length VARCHAR NOT NULL,
    gender VARCHAR NOT NULL
);





