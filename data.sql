/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, true, 10.23),
('Gabumon', '2018-11-15', 2, true, 8.00),
('Pickachu', '2021-01-07', 1, false, 15.04),
('Devimon', '2017-05-12', 5, true, 11.00);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, true, -11.00),
('Palantmon', '2021-11-15', 2, true, -5.70),
('Squirtle', '1993-04-02', 3, false, -12.13),
('Angemon', '2005-06-12', 1, true, -45.00),
('Boarmon', '2005-06-07', 7, true, 20.40),
('Blossom', '1998-10-13', 3, true, 17.00),
('Ditto', '2022-05-14', 4, true, 22.00);


INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
('ennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);


INSERT INTO species (name)
VALUES ('Pokemon'),
('Digimon');

BEGIN;
UPDATE animals AS a SET species_id = s.id FROM species AS s 
WHERE CASE WHEN a.name LIKE '%mon' THEN 'Digimon' ELSE 'Pokemon' END = s.name;
COMMIT;


BEGIN;
UPDATE animals AS a SET owners_id = o.id FROM owners AS o
WHERE CASE WHEN a.name = 'Agumon' THEN 'Sam Smith'
WHEN a.name = 'Gabumon' OR a.name = 'Pickachu' THEN 'Jennifer Orwell'
WHEN a.name = 'Devimon' OR a.name = 'Palantmon' THEN 'Bob'
WHEN a.name = 'Charmander' OR a.name = 'Squirtle' OR a.name = 'Blossom' THEN 'Melody Pond'
WHEN a.name = 'Angemon' OR a.name = 'Boarmon' THEN 'Dean Winchester'
END = o.full_name;
COMMIT;