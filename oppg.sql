SET search_path TO stevne,"$user",public;

-- Oppgave a)
SELECT ovelse, resultat FROM deltakelse
    WHERE utover = 5;

-- Oppgave b)
SELECT navn FROM ovelse,banerekord 
    WHERE ovelse.verdensrekord = banerekord.banerekord
        AND banerekord.bane = 'Bislett';

-- Oppgave c) - res Vedbjørn Rodal 800m
SELECT resultat FROM deltakelse
    INNER JOIN utover ON (deltakelse.utover = utover.startnr)
    WHERE utover.navn = 'Vebjørn Rodal'
        AND deltakelse.ovelse = '800m';

-- Oppgave d) - startnr og navn på utøvere som deltar i løp og sprang
SELECT utover.startnr, utover.navn FROM utover 
    INNER JOIN deltakelse ON (deltakelse.utover = utover.startnr)
    INNER JOIN ovelse ON (ovelse.navn = deltakelse.ovelse)
    WHERE disiplin = 'sprang'
INTERSECT
SELECT utover.startnr, utover.navn FROM utover 
    INNER JOIN deltakelse ON (deltakelse.utover = utover.startnr)
    INNER JOIN ovelse ON (ovelse.navn = deltakelse.ovelse)
    WHERE disiplin = 'løp';

-- Oppgave e) - startnr, navn, med i alle kasteøvelser
SELECT utover.startnr,utover.navn FROM utover 
    INNER JOIN deltakelse ON (utover.startnr = deltakelse.utover)
    INNER JOIN ovelse ON (deltakelse.ovelse = ovelse.navn)
    WHERE ovelse.navn = 'Slegge'
INTERSECT
SELECT utover.startnr,utover.navn FROM utover 
    INNER JOIN deltakelse ON (utover.startnr = deltakelse.utover)
    INNER JOIN ovelse ON (deltakelse.ovelse = ovelse.navn)
    WHERE ovelse.navn = 'Spydkast';

-- Oppgave f) - resultat, navn, vinner i spydkast
SELECT utover.navn,resultat FROM deltakelse
    INNER JOIN utover ON (utover.startnr = deltakelse.utover)
    WHERE ovelse = 'Spydkast' 
    ORDER BY resultat DESC LIMIT 1;

