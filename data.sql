/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon', '2020-02-03', 10.23, true, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon', '2018-11-15', 8, true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu', '2021-1-7', 15.04, false, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon', '2017-5-12', 11, true, 5);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Charmander', '2020-2-8', -11, false, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Plantmon', '2022-11-15', -5.7, true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Squirtle', '1993-4-2', -12.13, false, 3);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Angemon', '2005-6-12', -45, true, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Boarmon', '2005-6-7', -20.4, true, 7);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Blossom', '1998-10-13', -17, true, 3);


BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-1-1';
SAVEPOINT DEL_ANIMAL1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK to DEL_ANIMAL1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

INSERT INTO OWNERS (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO OWNERS (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO OWNERS (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO OWNERS (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO OWNERS (full_name, age) VALUES ('Jodie Whittaker', 38);
INSERT INTO OWNERS (full_name, age) VALUES ('Bob', 45);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

BEGIN;

UPDATE animals SET species_id = (
    SELECT id FROM species WHERE name = 'Digimon'
) WHERE name LIKE '%mon';

UPDATE animals SET species_id = (
    SELECT id FROM species WHERE name = 'Pokemon' 
) WHERE species_id IS NULL;

COMMIT;

BEGIN;

UPDATE animals SET owners_id = (
    SELECT id FROM owners WHERE full_name = 'Sam Smith'
) WHERE name = 'Agumon';

UPDATE animals SET owners_id = (
    SELECT id FROM owners WHERE full_name = 'Jennifer Orwell'
) WHERE name in ('Pikachu', 'Gabumon');

UPDATE animals SET owners_id = (
    SELECT id FROM owners WHERE full_name = 'Bob'
) WHERE name in ('Devimon', 'Plantmon');

UPDATE animals SET owners_id = (
    SELECT id FROM owners WHERE full_name = 'Melody Pond'
) WHERE name in ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owners_id = (
    SELECT id FROM owners WHERE full_name = 'Dean Winchester'
) WHERE name in ('Angemon', 'Boarmon');

COMMIT;

INSERT INTO vets (name, age, date_of_graduation) VALUES 
('William Tatcher', 45, 'Apr 23, 2000'),
('Maisy Smith', 26, 'Jan 17, 2019'),
('Stephanie Mendez', 64, 'May 4, 1981'),
('Jack Harkness', 38, 'Jun 8, 2008');

INSERT INTO specializations (vets_id, species_id) VALUES 
(
    (
        SELECT id FROM vets WHERE name = 'William Tatcher'
    ),
    (
        SELECT id FROM species WHERE name = 'Pokemon'
    )
),
(
    (
        SELECT id FROM vets WHERE name = 'Stephanie Mendez'
    ),
    (
        SELECT id FROM species WHERE name = ('Pokemon')
    )
),
(
    (
        SELECT id FROM vets WHERE name = 'Stephanie Mendez'
    ),
    (
        SELECT id FROM species WHERE name = ('Digimon')
    )
),
(
    (
        SELECT id FROM vets WHERE name = 'Jack Harkness'
    ),
    (
        SELECT id FROM species WHERE name = ('Digimon')
    )
);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES 
(
    (SELECT id FROM animals WHERE name = 'Agumon'),
    (SELECT id FROM vets WHERE name = 'William Tatcher'),
    ('May 24, 2020')
),
(
    (SELECT id FROM animals WHERE name = 'Agumon'),
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    ('Jul 22, 2020')
),
(
    (SELECT id FROM animals WHERE name = 'Gabumon'),
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    ('Feb 2, 2021')
),
(
    (SELECT id FROM animals WHERE name = 'Pikachu'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ('Jan 5, 2020')
),
(
    (SELECT id FROM animals WHERE name = 'Pikachu'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ('March 8, 2020')
),
(
    (SELECT id FROM animals WHERE name = 'Pikachu'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ('May 14, 2020')
),
(
    (SELECT id FROM animals WHERE name = 'Devimon'),
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    ('May 4, 2021')
),
(
    (SELECT id FROM animals WHERE name = 'Charmander'),
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    ('Feb 24, 2021')
),
(
    (SELECT id FROM animals WHERE name = 'Plantmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ('Dec 21, 2019')
),
(
    (SELECT id FROM animals WHERE name = 'Plantmon'),
    (SELECT id FROM vets WHERE name = 'William Tatcher'),
    ('Aug 10, 2020')
),
(
    (SELECT id FROM animals WHERE name = 'Plantmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ('Apr 7, 2021')
),
(
    (SELECT id FROM animals WHERE name = 'Squirtle'),
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    ('Sep 29, 2019')
),
(
    (SELECT id FROM animals WHERE name = 'Angemon'),
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    ('Oct 3, 2020')
),
(
    (SELECT id FROM animals WHERE name = 'Angemon'),
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    ('Nov 4, 2020')
),
(
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ('Jan 24, 2019')
),
(
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ('May 15, 2019')
),
(
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ('Feb 27, 2020')
),
(
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    ('Aug 3, 2020')
),
(
    (SELECT id FROM animals WHERE name = 'Blossom'),
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    ('May 24, 2020')
),
(
    (SELECT id FROM animals WHERE name = 'Blossom'),
    (SELECT id FROM vets WHERE name = 'William Tatcher'),
    ('Jan 11, 2021')
);

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';