/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal,
    PRIMARY KEY (id)
);

ALTER TABLE animals ADD species varchar(100);

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(255),
    age INT,
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    PRIMARY KEY (id)
);

ALTER TABLE animals ADD PRIMARY KEY (id);

ALTER TABLE animals DROP species;

ALTER TABLE animals ADD species_id INT, ADD CONSTRAINT FK_SPECIES FOREIGN KEY(species_id) REFERENCES species (id);

ALTER TABLE animals ADD owners_id INT, ADD CONSTRAINT FK_OWNERS FOREIGN KEY (owners_id) REFERENCES owners (id);