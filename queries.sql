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
 SET species = 'unspecified';
 ROLLBACK TO sp1;
COMMIT;

BEGIN;
 UPDATE animals
 SET species = CASE WHEN name LIKE '%mon' THEN 'digimon' ELSE 'pokemon' END;
COMMIT;

BEGIN;
  SAVEPOINT sp1;
  DROP TABLE animals;
  SELECT * FROM animals;
  ROLLBACK TO sp1;
  SELECT * FROM animals;
COMMIT;

BEGIN;
 DELETE FROM animals WHERE date_of_birth > '2022-01-01';
 SAVEPOINT sp1;
 UPDATE animals SET weight_kg = weight_kg * -1;
 ROLLBACK TO sp1;
 UPDATE animals SET weight_kg = weight_kg * -1;
COMMIT;
