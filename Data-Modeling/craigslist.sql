
DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    name TEXT,
    region_id INTEGER REFERENCES region(id) ON DELETE SET NULL
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT,
    content TEXT,
    user_id INTEGER REFERENCES "user"(id) ON DELETE CASCADE,
    region_id INTEGER REFERENCES region(id) ON DELETE SET NULL
);

CREATE TABLE post_categories (
    post_id INTEGER REFERENCES post(id) ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories(id) ON DELETE CASCADE,
    PRIMARY KEY (post_id, category_id)
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT
);
