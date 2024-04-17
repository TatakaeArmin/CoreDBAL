CREATE DATABASE IF NOT EXISTS tournaments;
USE tournaments;
-- DROP database tournaments;

CREATE TABLE player (
    pk_id INT AUTO_INCREMENT,
    name VARCHAR(50),
    PRIMARY KEY (pk_id)
);


CREATE TABLE symbol (
    pk_id INT AUTO_INCREMENT,
    bezeichnung VARCHAR(50),
    PRIMARY KEY (pk_id)
);

CREATE TABLE tournament(
    pk_id INT AUTO_INCREMENT,
    name VARCHAR(50),
    date DATE,
    PRIMARY KEY (pk_id)
);

CREATE TABLE round (
    pk_id INT AUTO_INCREMENT PRIMARY KEY,
    fk_id INT,
    fk_player1 INT,
    fk_symbol1 INT,
    date DATE,
    time TIME,
    fk_symbol2 INT,
    fk_player2 INT,

    CONSTRAINT fk_round_tournament FOREIGN KEY (fk_id)
    REFERENCES tournament(pk_id)
    ON DELETE NO ACTION,

    CONSTRAINT fk_round_player_1 FOREIGN KEY (fk_player1)
		REFERENCES player(pk_id)
        ON DELETE NO ACTION,

    CONSTRAINT fk_round_symbol_1 FOREIGN KEY (fk_symbol1)
		REFERENCES symbol(pk_id)
        ON DELETE NO ACTION,

     CONSTRAINT fk_round_symbol_2 FOREIGN KEY (fk_symbol2)
		REFERENCES symbol(pk_id)
        ON DELETE NO ACTION,

     CONSTRAINT fk_round_player_2 FOREIGN KEY (fk_player2)
		REFERENCES player(pk_id)
        ON DELETE NO ACTION
);


INSERT INTO player (name) VALUES ('Hugo Boss'), ('Frida Kahlo'), ('Dig N Balls'), ('Ligma Nuttiz'),
                                 ('Twinstead Nipel'), ('Sailor Moon'), ('Bowser'), ('Canyu Shatap'),
                                 ('Jesus Christ'), ('Pikachu');

INSERT INTO symbol (bezeichnung) VALUES ('Rock'), ('Paper'), ('Scissor');

INSERT INTO tournament (name, date) VALUES ('TurnUp1', '2024-04-09'),
                                           ('TurnUp2', '2024-04-11'),
                                           ('TurnUp3', '2024-04-13'),
                                           ('TurnUp4', '2024-04-15'),
                                           ('TurnUp5', '2024-04-16'),
                                           ('TurnUp6', '2024-04-18'),
                                           ('TurnUp7', '2024-04-20'),
                                           ('TurnUp8', '2024-04-22');

INSERT INTO round (fk_id, fk_player1, fk_symbol1, date, time, fk_symbol2, fk_player2)
VALUES (6, 7, 1, '2024-04-18', '00:20:22', 2, 8),
       (8, 2, 1, '2024-04-22', '00:02:24', 3, 1),
       (1, 5, 2, '2024-04-09', '00:01:02', 3, 4),
       (2, 9, 1, '2024-04-11', '00:00:01', 3, 10),
       (5, 4, 3, '2024-04-16', '00:10:06', 3, 1);

