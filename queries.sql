/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-01-01';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Pikachu', 'Agumon');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) as AVERAGE_ESCAPE_ATTEMPTS FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT A.name P_NAME, O.full_name O_NAME
FROM animals A
JOIN owners o ON A.owners_id = O.id
WHERE O.full_name = 'Jennifer Orwell';

SELECT A.name A_NAME, S.name A_TYPE
FROM animals A
JOIN species S ON A.species_id = S.id
WHERE S.name = 'Pokemon';

SELECT O.full_name O_NAME, A.name A_NAME
FROM owners O
LEFT JOIN animals A on O.id = A.owners_id;

SELECT S.name S_NAME, COUNT(A) A_AMOUNT
FROM species S
JOIN animals A ON S.id = A.species_id GROUP BY S.name;

SELECT O.full_name O_NAME, A.name A_NAME, S.name S_NAME
FROM animals A
JOIN owners O ON A.owners_id = O.id
JOIN species S ON A.species_id = S.id
WHERE S.name = 'Digimon' AND O.full_name = 'Jennifer Orwell';

SELECT A.name A_NAME, O.full_name O_NAME
FROM animals A
JOIN owners O on A.owners_id = O.id
WHERE O.full_name = 'Dean Winchester' AND A.escape_attempts = 0;

SELECT O.full_name O_NAME, COUNT(A.name)
FROM owners O
JOIN animals A ON O.id = A.owners_id GROUP BY O.full_name 
ORDER BY COUNT DESC
LIMIT 1;