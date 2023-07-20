/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT * FROM animals WHERE neutered != false  AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
SAVEPOINT sp1;
UPDATE animals
SET species = 'unspecified'
SELECT species from animals;
ROLLBACK TO sp1;
SELECT species from animals;
COMMIT;

BEGIN;
SELECT name, species from animals;
UPDATE animals
SET species = CASE WHEN name LIKE '%mon' THEN 'digimon' WHEN species IS NULL THEN 'pokemon' END;
SELECT name, species from animals;
COMMIT;
SELECT name, species from animals;


BEGIN;
SELECT species from animals;
SAVEPOINT sp1;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK TO sp1;
SELECT * FROM animals;
COMMIT;


BEGIN;
SELECT name, date_of_birth FROM animals;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT name, date_of_birth FROM animals;
SAVEPOINT sp1;
SELECT name, weight_kg FROM animals;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT name, weight_kg FROM animals;
ROLLBACK TO sp1;
SELECT name, weight_kg FROM animals;
UPDATE animals SET weight_kg = CASE WHEN weight_kg < 0 THEN weight_kg * -1 ELSE weight_kg END;
SELECT name, weight_kg FROM animals;
COMMIT;
SELECT * FROM animals;



SELECT COUNT(name) AS number_of_animals FROM animals;

SELECT COUNT(name) AS never_tried_to_escape FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) AS average_weight FROM animals;

SELECT neutered, SUM(escape_attempts) AS total_escape_attempts FROM animals  GROUP BY neutered ORDER BY total_escape_attempts DESC LIMIT 1;

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) AS average_escape_attempts FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- What animals belong to Melody Pond?
SELECT name, full_name FROM animals AS a JOIN owners AS o ON a.owners_id = o.id WHERE o.full_name = 'Melody Pond';


-- List of all animals that are pokemon (their type is Pokemon).
SELECT name FROM animals WHERE species_id = ( SELECT id from species WHERE name = 'Pokemon');


-- List all owners and their animals, remember to include those that don't own any animal.
SELECT name, full_name FROM animals AS a FULL JOIN owners AS o ON a.owners_id = o.id;


-- How many animals are there per species?
SELECT species.name AS Species, COUNT(animals.name) FROM species RIGHT JOIN animals ON species.id = animals.species_id GROUP BY Species;


-- List all Digimon owned by Jennifer Orwell.
SELECT a.name AS anim_name, s.name AS spc_name, o.full_name AS onr_name FROM animals AS a INNER JOIN species AS s ON a.species_id = s.id INNER JOIN owners AS o ON a.owners_id = o.id WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';


-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT a.name, a.escape_attempts, o.full_name FROM animals AS a INNER JOIN owners AS o ON a.owners_id = o.id WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;


-- Who owns the most animals?
SELECT COUNT(a.name) AS anim_qty, o.full_name FROM animals AS a INNER JOIN owners AS o ON a.owners_id = o.id GROUP BY o.full_name ORDER BY anim_qty DESC LIMIT 1;