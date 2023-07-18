/*Queries that provide answers to the questions from all projects.*/

vet_clinic=# SELECT * FROM animals
vet_clinic-# WHERE name LIKE '%mon';

vet_clinic=# SELECT * FROM animals
vet_clinic-# WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

vet_clinic=# SELECT * FROM animals
vet_clinic-# WHERE neutered != false  AND escape_attempts < 3;

vet_clinic=# SELECT date_of_birth FROM animals
vet_clinic-# WHERE name = 'Agumon';

vet_clinic=# SELECT name, escape_attempts FROM animals
vet_clinic-# WHERE weight_kg > 10.00;

vet_clinic=# SELECT * FROM animals
vet_clinic-# WHERE neutered = true;

vet_clinic=# SELECT * FROM animals
vet_clinic-# WHERE name NOT LIKE 'Gabumon';

vet_clinic=# SELECT * FROM animals
vet_clinic-# WHERE weight_kg BETWEEN 10.4 AND 17.3;
