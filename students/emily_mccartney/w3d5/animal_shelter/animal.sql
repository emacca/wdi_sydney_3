CREATE TABLE animals
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER,
  gender VARCHAR(2),
  species VARCHAR(255),
  breed VARCHAR(255),
  shelter_id INTEGER,
  client_id INTEGER
);

CREATE TABLE shelters
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  max_capacity INTEGER
);

CREATE TABLE clients 
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  children INTEGER,
  age INTEGER,
  shelter_id INTEGER
);