<a id="kmom03"><h2>Kmom03</h2></a>

Det går skapligt just nu. Möjligen har jag lite dålig struktur på mitt läsande
kring just den här kursen. Det känns som att jag missat något i tidigare
kursmoment. Jag får läsa baklänges när jag kommer på vad det är.

Jag känner inte att SQL-satserna är särdeles svåra. Jag kan omformulera den
klartext som beskriver frågan. "Alla som jobbar på avdelningen och inte har
katt..." blir snabbt och enkelt till SQL. Mer eftertanke, och efterforskning,
krävs för att lösa inbyggda funktioner.

Jag höll på mycket med SQL för tio år sedan, och det känns fortfarande. Jag har
helt enkelt skaplig koll på det.

### Svårigheter

När vi sedan talar om hur vi skall slå samman detta med JavaScript och Node så
blir det genast betydligt svårare. Mest för att jag aldrig tidigare jobbat med
JavaScript i CLI. Och säkert också för att jag fortfarande släpar i
JavaScript-kursen.

Jag har en diffus känsla av att jag halkar efter rent kunskapsmässigt, bara det
att jag tydligen ganska enkelt borde kunna skriva en CLI-meny för *nodejs*...
Jag undrar om jag missat någon övning eller föreläsning där?

Nu löste det sig, men efter mycket möda.

###Introduktion, labb

Jag tuffade på ganska bra genom de instruerade övningarna. Vid ett tillfälle
skulle vi kopiera tabellen för lönerevision, och där råkade jag på bekymmer.
Just för att kunna räkna ut löneutveckling och dylikt så skapade jag en
kolumn "ny_lon". Därmed räknade jag ut uppgifter om löneutveckling redan i
föregående kursmoment.

Det fungerade ju naturligtvis hur bra som helst, men det var ju inte enligt
instruktion så jag fick fortsätta att improvisera när det var dags att kopiera
tabeller. Längst upp i filen <var>dml_union</var> raderade jag kolumnen *lon*
och bytte namn på *ny_lon* till *lon*.

För att göra mitt script [idempotent][1] fick jag skapa en PROCEDURE:

<code>-- Replace my column ny_lon-
DROP PROCEDURE IF EXISTS column_lon;
DELIMITER $$
CREATE PROCEDURE column_lon()
BEGIN
    IF EXISTS(
        SELECT NULL
        FROM information_schema.COLUMNS
        WHERE TABLE_NAME = 'larare'
        AND TABLE_SCHEMA = 'skolan'
        AND COLUMN_NAME = 'ny_lon'
    )
    THEN
        ALTER TABLE larare DROP COLUMN lon;
        ALTER TABLE larare CHANGE ny_lon lon int(11) DEFAULT NULL;
        ALTER TABLE larare MODIFY COLUMN lon int(11) AFTER kon;
    END IF;
END
$$
DELIMITER ;
</code>

Coolt va?

### ER-modellering

Mitt första intryck av ER-modellering är att det rör sig om en dåligt
organiserad mind-map. Framför allt kardinaliteten känns för mig som 
något man behandlar i steget "Logisk modellering". Från och med steg
sju känns det som att man håller på att bygga en databas. På sätt och
vis har jag redan mitt sinne på det stadiet när jag börjar ställa de
inledande frågorna.

Kanske är det till min nackdel, kanske är det inte en relationsdatabas
som kunden beskriver, utan en txt- eller json-fil?

### Kort och koncist

__Berätta kort om den utvecklingsmiljö du sitter i__ och vilka
databaser/klienter du installerat och vilka versioner de har.

Jag sitter på Ubuntu (Debian) och har hamnat på MariaDB. Jag har
MySQL Workbench som GUI.

__Hur känns det att komma igång med databaser, klienter och SQL?__

När jag väl tog mig igenom installationsbekymren så var det inga
problem alls. Jag har seglat igenom uppgifterna. Mest tid har jag
lagt på att snygga till resultaten.

__Har du jobbat med databaser eller liknande tidigare?__

Ja, en hel del. Dels som del av en eller annan hemsida, och dels genom
databasprogram som MS Access.

__Hur gick det att jobba med SQL i guiden?__

Det var inga bekymmer.

__Jämför SQL med andra sätt att programmera.__

Det känns inte som att vi programmerat i SQL ännu. Det finns ju IF - ELSE-
strukturer och lite annat, men det är klart begränsat om man jämför med
regelrätta programmeringsspråk. I SQL programmerar man inte, man ställer
frågor och begränsar resultatet. Man flyttar runt data.

Vill man ha det mer dynamiskt får man koppla SQL samman med ett annat språk.

__Vilken är din TIL för detta moment?__

Jag har lärt mig att skriva Bash-script.

Det finns mer än `<code>`-elementet för att skriva kod-liknande text i
HTML-text. Till exempel `<kbd>` som står för input, `<samp>` som står
för output och `<var>` som står för variabel.

[1]: https://sv.wikipedia.org/wiki/Idempotent