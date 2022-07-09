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

--## Assignment 3
CREATE TABLE owners (
    id INTEGER primary key GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(250),
    age INTEGER
);

CREATE TABLE species (
    id INTEGER primary key GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250)
);
