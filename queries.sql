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

--## Assignment 3
SELECT * FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT * FROM animals
INNER JOIN species ON animals.species_id = species.id
WHERE species.name = 'pokemon';

SELECT * FROM animals
FULL OUTER JOIN owners ON animals.owner_id = owners.id;

SELECT COUNT(*), species.name FROM animals
INNER JOIN species ON animals.species_id = species.id
GROUP BY species.name;

SELECT * FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
INNER JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell'
AND species.name = 'digimon';

SELECT * FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester'
AND escape_attempts = 0;

SELECT full_name, COUNT(full_name) AS animals_owned FROM owners
INNER JOIN animals ON animals.owner_id = owners.id
GROUP BY full_name
ORDER BY COUNT(full_name) DESC;

--## Assignment 4
SELECT * FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
WHERE visits.vet_id = (SELECT id FROM vets WHERE name = 'William Tatcher')
ORDER BY visits.visit_date DESC
LIMIT 1;

SELECT COUNT(name) FROM (
    SELECT name FROM animals
    INNER JOIN visits ON animals.id = visits.animal_id
    WHERE visits.vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
    GROUP BY animals.id) AS animals_mendez;
    
SELECT * FROM vets
FULL OUTER JOIN specializations ON vets.id = specializations.vet_id;

SELECT * FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
WHERE visits.vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
AND (visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30');

SELECT * FROM (
    SELECT name, COUNT(name) AS number_of_visits FROM animals
    INNER JOIN visits ON animals.id = visits.animal_id
    GROUP BY name) AS name_visit
ORDER BY number_of_visits DESC
LIMIT 1;

SELECT * FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
WHERE visits.vet_id = (SELECT id FROM vets WHERE name = 'Maisy Smith')
ORDER BY visits.visit_date ASC
LIMIT 1;

SELECT animal_id, animals.name, vet_id, vets.name, visit_date FROM visits
INNER JOIN animals ON animals.id = visits.animal_id
INNER JOIN vets ON animals.id = vets.id
ORDER BY visit_date DESC
LIMIT 1;

SELECT COUNT(*) FROM visits
WHERE vet_id = (
    SELECT id FROM vets
    FULL OUTER JOIN specializations ON vets.id = specializations.vet_id
    WHERE species_id IS NULL);
    
SELECT species.name, COUNT(species.name) FROM visits
INNER JOIN vets ON visits.vet_id = vets.id
INNER JOIN animals ON visits.animal_id = animals.id
INNER JOIN species ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY count DESC
LIMIT 1;
