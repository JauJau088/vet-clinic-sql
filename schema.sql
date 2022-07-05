--## Assignment 1
CREATE TABLE animals (
    id INTEGER primary key GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

--## Assignment 2
ALTER TABLE animals
ADD COLUMN species VARCHAR(250);
