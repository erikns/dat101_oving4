SET search_path TO stevne,"$user",public;

-- fjern alle data som allerede er i tabellen
DELETE FROM deltakelse; 
DELETE FROM utover;
DELETE FROM banerekord;
DELETE FROM ovelse; 

-- sett inn testdata i utover tabell
INSERT INTO utover (startnr, navn, nasjonalitet)
    VALUES
    (1, 'Vedbjørn Rodal', 'Norge'),
    (2, 'Marion Jones', 'USA'),
    (3, 'Hussain Bolt', 'USA'),
    (4, 'Hanne Haugland', 'Norge'),
    (5, 'Hans Hansen', 'Norge'),
    (6, 'John Smith', 'Norge'),
    (7, 'Jöran Björnsson', 'Sverige'),
    (8, 'Preben Pedersen', 'Danmark');

INSERT INTO ovelse (navn, disiplin, verdensrekord)
    VALUES
    ('100m', 'løp', 9.1),
    ('100m Hekk', 'løp', 9.8),
    ('400m', 'løp', 43.18),
    ('500m', 'løp', 7.8),
    ('800m', 'løp', 92),
    ('Spydkast', 'kast', 95.1),
    ('Lengdehopp', 'sprang', 8.95),
    ('Slegge', 'kast', 24);

INSERT INTO banerekord (bane, ovelse, banerekord)
    VALUES
    ('Bislett', '100m', 9.5),
    ('Skansemyren', '100m', 9.8),
    ('Fana Stadion', '100m', 9.2),
    ('Bislett', '100m Hekk', 9.8),
    ('Bislett', '400m', 43.2),
    ('Bislett', '500m', 57.8),
    ('Bislett', 'Spydkast', 95.1),
    ('Bislett', 'Lengdehopp', 8.98),
    ('Bislett', '800m', 94),
    ('Bislett', 'Slegge', 24),
    ('Fana Stadion', '400m', 49.9);

INSERT INTO deltakelse (ovelse, utover, resultat)
    VALUES
    ('100m', 6, 10.2),
    ('100m', 5, 9.9),
    ('100m', 2, 9.1),
    ('100m Hekk', 7, 10.1),
    ('100m Hekk', 8, 10.11),
    ('100m Hekk', 2, 9.85),
    ('400m', 1, 43.1),
    ('400m', 2, 44),
    ('400m', 3, 46),
    ('800m', 1, 93),
    ('Spydkast', 3, 90.0),
    ('Spydkast', 2, 91.2),
    ('Spydkast', 7, 96.0),
    ('Slegge', 7, 25.2),
    ('Lengdehopp', 5, 8.0),
    ('Lengdehopp', 4, 7.85),
    ('Lengdehopp', 6, 8.25);





