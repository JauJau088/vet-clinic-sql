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

ALTER TABLE animals
DROP COLUMN species,
ADD COLUMN species_id INTEGER,
ADD FOREIGN KEY (species_id)
REFERENCES species(id),
ADD COLUMN owner_id INTEGER,
ADD FOREIGN KEY (owner_id)
REFERENCES owners(id);

--## Assignment 4
CREATE TABLE vets (
    id INTEGER primary key GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    age INTEGER,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    vet_id INTEGER REFERENCES vets(id),
    species_id INTEGER REFERENCES species(id)
);

CREATE TABLE visits (
    animal_id INTEGER REFERENCES animals(id),
    vet_id INTEGER REFERENCES vets(id),
    visit_date DATE
);

--# Week2 pair programming 1
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
