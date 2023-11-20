
DROP DATABASE IF EXISTS medical_center;


CREATE DATABASE medical_center;


\c medical_center;


CREATE TABLE doctor (
    id SERIAL PRIMARY KEY,
    name TEXT,
    specialty TEXT
);

CREATE TABLE disease (
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT
);

CREATE TABLE patient (
    id SERIAL PRIMARY KEY,
    name TEXT,
    disease_id INTEGER REFERENCES disease(id) ON DELETE CASCADE
);

CREATE TABLE medical_center (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctor(id) ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patient(id) ON DELETE CASCADE
);
