CREATE DATABSE hospital_ds
\C hospital_ds

CREATE TABLE medical_histories (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
admitted_at timestamp, 
patient_id INT,
status VARCHAR (50)
CONSTRAINT patient_id 
FOREIGN KEY(patient_id)
REFERENCES patient (id)
);

CREATE TABLE patient (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR (100),
date_of_birth date
);

CREATE TABLE treatment (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
type VARCHAR (100),
name VARCHAR (100)
);

CREATE TABLE invoice (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
total_amount decimal,
generate_at timestamp,
paid_at timestamp,
medical_histore_id INT,
CONSTRAINT medical_histore_id
FOREIGN KEY(medical_histore_id)
REFERENCES medical_histories (id)
);

CREATE TABLE invoice_item (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT,
CONSTRAINT invoice_id 
FOREIGN KEY(invoice_id)
REFERENCES invoice (id)
);

CREATE TABLE medical_histories_has_treatments (
 medical_history_id int refrences medical_histories(id),
 treatment_id int refrences treatments(id),
);