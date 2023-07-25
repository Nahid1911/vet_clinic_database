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


----------------------Day-4-Project--------------------------------

INSERT INTO vets ( name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2000-04-23');



INSERT INTO specializations ( species_id, vets_id)
VALUES (1, 1),
(NULL, 2),
(1, 3),
(2, 3),
(2, 4);


INSERT INTO visits ( animals_id, vets_id, visit_date)
VALUES(1, 1, '2020-05-24'),
(1, 3, '2020-07-22'),
(2, 4, '2021-02-02'),
(3, 2, '2020-01-05'),
(3, 2, '2020-03-08'),
(3, 2, '2020-05-14'),
(4, 3, '2021-05-04'),
(5, 4, '2021-02-24'),
(6, 2, '2019-12-21'),
(6, 1, '2020-08-10'),
(6, 2, '2021-04-07'),
(7, 3, '2019-09-29'),
(8, 4, '2020-10-03'),
(8, 4, '2020-11-04'),
(9, 2, '2019-01-24'),
(9, 2, '2019-05-15'),
(9, 2, '2020-02-27'),
(9, 2, '2020-08-03'),
(10, 3, '2020-05-24'),
(10, 1, '2021-01-11');

----------------------------------Module-4---Week-2---Day-1---------------------

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, visit_date) SELECT * FROM (SELECT id FROM animals) animals_id, (SELECT id FROM vets) vets_id, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';