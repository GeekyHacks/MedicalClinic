CREATE DATABASE medicalClinic;
-- create patients table
CREATE TABLE patients(
    id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    name VARCHAR(120),
    date_Of_birth DATE,
    PRIMARY KEY (id)
);
-- create medical_histories table
CREATE TABLE medical_histories(
    id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (patient_id) REFERENCES patients (id)
);
CREATE INDEX patient_id_index ON medical_histories(patient_id);
-- create treatments table
CREATE TABLE treatments(
    id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    type VARCHAR(120),
    name VARCHAR(120),
    PRIMARY KEY (id)
);
-- create invoice_items table
CREATE TABLE invoice_items(
    id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoices (id),
    FOREIGN KEY (treatment_id) REFERENCES treatments (id),
    PRIMARY KEY (id)
);
CREATE INDEX invoice_id_index ON invoice_items(invoice_id);
CREATE INDEX treatment_id_index ON invoice_items(treatment_id);
-- create invoice_items table
CREATE TABLE invoices(
    id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    total_amount FLOAT,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id),
    PRIMARY KEY (id)
);
CREATE INDEX medical_history_id_index ON invoices(medical_history_id);

-- create join table medical_histories-treatments table
CREATE TABLE medical_histories_treatments(
    medical_histories_id INT,
    treatments_id INT,
    FOREIGN KEY (medical_histories_id) REFERENCES medical_histories (id),
    FOREIGN KEY (treatments_id) REFERENCES treatments (id),
    PRIMARY KEY (medical_histories_id, treatments_id)
);

--Creating index for the joined table to improve performance
CREATE INDEX medical_histories_id_index ON medical_histories_treatments(medical_histories_id);
CREATE INDEX treatments_id_index ON medical_histories_treatments(treatments_id);
