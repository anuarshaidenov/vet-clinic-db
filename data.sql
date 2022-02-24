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