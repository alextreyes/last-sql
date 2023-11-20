-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

CREATE TABLE Galaxies (
    galaxy_id SERIAL PRIMARY KEY,
    galaxy_name TEXT NOT NULL
);

CREATE TABLE Moons (
    moon_id SERIAL PRIMARY KEY,
    moon_name TEXT NOT NULL
);

CREATE TABLE Stars (
    star_id SERIAL PRIMARY KEY,
    star_name TEXT NOT NULL
);

CREATE TABLE Planets (
    planet_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    orbital_period_in_years FLOAT NOT NULL,
    orbits_around_id INTEGER REFERENCES Stars(star_id),
    galaxy_id INTEGER REFERENCES Galaxies(galaxy_id)
);

CREATE TABLE PlanetMoons (
    planet_id INTEGER REFERENCES Planets(planet_id),
    moon_id INTEGER REFERENCES Moons(moon_id),
    PRIMARY KEY (planet_id, moon_id)
);


