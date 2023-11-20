
DROP DATABASE IF EXISTS sportsteam;

CREATE DATABASE sportsteam;

\c sportsteam;


CREATE TABLE Teams (
    team_id SERIAL PRIMARY KEY,
    team_name TEXT
);


CREATE TABLE Players (
    player_id SERIAL PRIMARY KEY,
    player_name TEXT,
    team_id INTEGER REFERENCES Teams(team_id)

);


CREATE TABLE Goals (
    goal_id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES Players(player_id),
    game_id INTEGER REFERENCES Matches(match_id),
    goal_time TIMESTAMP
);

-- Create Referees table
CREATE TABLE Referees (
    referee_id SERIAL PRIMARY KEY,
    referee_name TEXT

);


CREATE TABLE Matches (
    match_id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES Teams(team_id),
    away_team_id INTEGER REFERENCES Teams(team_id),
    match_date DATE
);


CREATE TABLE Seasons (
    season_id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE

);
