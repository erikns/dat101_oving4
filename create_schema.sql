-- Start fra scratch hver gang
DROP SCHEMA IF EXISTS stevne CASCADE;

-- Opprett databaseskjema
CREATE SCHEMA stevne;

-- Sett søkestreng
SET search_path TO stevne,"$user",public;

-- Opprett tabell banerekord med sammensatt primærnøkkel
-- (bane, ovelse)
CREATE TABLE stevne.banerekord (
    bane varchar(40) NOT NULL,
    ovelse varchar(40) NOT NULL,
    banerekord decimal NOT NULL,
    PRIMARY KEY (bane, ovelse)
);

-- Opprett tabell ovelse med primærnøkkel (navn)
CREATE TABLE stevne.ovelse (
    navn varchar(40) NOT NULL,
    disiplin varchar(40) NOT NULL,
    verdensrekord decimal,
    PRIMARY KEY (navn)
);

-- Opprett tabell deltakelse ned sammensatt primærnøkkel
-- (ovelse, utover)
CREATE TABLE stevne.deltakelse (
    ovelse varchar(40) NOT NULL,
    utover integer NOT NULL,
    resultat decimal NOT NULL,
    PRIMARY KEY (ovelse, utover)
);

-- Opprett tabell utover med primærnøkkel startnr
CREATE TABLE stevne.utover (
    startnr integer NOT NULL,
    navn varchar(125) NOT NULL,
    nasjonalitet varchar(20) NOT NULL,
    PRIMARY KEY (startnr)
);

-- opprett referanse fra banerekord.ovelse til ovelse.navn
ALTER TABLE stevne.banerekord
    ADD FOREIGN KEY (ovelse) REFERENCES stevne.ovelse (navn)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT;

-- opprett referanse fra deltakelse.ovelse til ovelse.navn
ALTER TABLE stevne.deltakelse
    ADD FOREIGN KEY (ovelse) REFERENCES stevne.ovelse (navn)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

-- opprett referanse fra deltakelse.utover til utover.startnr
ALTER TABLE stevne.deltakelse
    ADD FOREIGN KEY (utover) REFERENCES stevne.utover (startnr)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT;


