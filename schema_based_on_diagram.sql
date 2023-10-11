CREATE DATABASE medicalClinic;
-- create patients table
CREATE TABLE patients(
    id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    name VARCHAR(120),
    date_Of_birth DATE,
    PRIMARY KEY (id)
) 
-- create medical_histories table
CREATE TABLE medical_histories(
    id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(100),
    PRIMARY KEY (id), 
    FOREIGN KEY (patient_id)
)
-- create treatments table
CREATE TABLE treatments(
    id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    type VARCHAR(120),
    name VARCHAR(120),
    PRIMARY KEY (id)
) 