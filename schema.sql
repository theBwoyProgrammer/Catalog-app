CREATE DATABASE catalog;

CREATE TABLE item (
  id INT NOT NULL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES genres (id),
  FOREIGN KEY (author_id) REFERENCES author (id),
  FOREIGN KEY (label_id) REFERENCES label (id),
);

CREATE TABLE books (
  id INT,
  title VARCHAR(50),
  publisher VARCHAR(50),
  cover_state VARCHAR(50),
  FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE label (
    id INT NOT NULL PRIMARY KEY,
    title VARCHAR (50)
    color VARCHAR (50)
);

CREATE TABLE music_album (
  id  INT,
  name VARCHAR(100),
  on_spotify BOOLEAN,
  FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE genres (
  id INT NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
);

CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY,
  item_id INT,
  multiplayer BOOLEAN NOT NULL,
  last_player_at DATE NOT NULL,
  FOREIGN KEY (item_id) REFERENCES item(id),
  PRIMARY KEY (id)
);

CREATE TABLE author (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  PRIMARY KEY(id)
);
