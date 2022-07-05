--## Assignment 1
-- Find all animals whose name ends in "mon"
SELECT *
FROM animals
WHERE name
LIKE '%mon';

-- List the name of all animals born between 2016 and 2019
SELECT name
FROM animals
WHERE EXTRACT(YEAR FROM date_of_birth)
BETWEEN 2016 AND 2019;

-- List the name of all animals that are neutered and have less than 3 escape attempts
SELECT name
FROM animals
WHERE neutered = TRUE AND escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu"
SELECT date_of_birth
FROM animals
WHERE name IN ('Agumon', 'Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts
FROM animals
WHERE weight_kg > 10.5;

-- Find all animals that are neutered
SELECT *
FROM animals
WHERE neutered = TRUE;

-- Find all animals not named Gabumon
SELECT *
FROM animals
WHERE NOT name = 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg
-- (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT *
FROM animals
WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

--## Assignment 2
-- How many animals are there?
SELECT COUNT(id)
FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(id)
FROM animals
WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg)
FROM animals;

-- Who escapes the most (by average), neutered or non-neutered animals?
SELECT neutered, AVG(escape_attempts)
FROM animals
GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts)
FROM animals
WHERE EXTRACT(YEAR FROM date_of_birth)
BETWEEN 1990 AND 2000
GROUP BY species;
