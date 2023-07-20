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
