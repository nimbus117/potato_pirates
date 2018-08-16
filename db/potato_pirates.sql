DROP TABLE IF EXISTS wins;
DROP TABLE IF EXISTS players;

CREATE TABLE players(
	id SERIAL8 PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	cohort VARCHAR(255) NOT NULL
);

CREATE TABLE wins(
	id SERIAL8 PRIMARY KEY,
	date DATE NOT NULL,
	player_id INT8 REFERENCES players(id) ON DELETE CASCADE
);
