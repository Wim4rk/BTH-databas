## <a id="kmom02">Kmom02</a>

Jag tuffar vidare. Förmodligen i lite lägre fart än de flesta andra, men jag är
fast besluten om att faktiskt ta mig igenom ett par kurser i mer eller mindre
rätt tidsram.

Det har blivit så att jag jobbar med tre kursmoment samtidigt här. Det var inte
direkt meningen, men det finns vissa fördelar. Det kan bli svårt att
redovisa exakt vad som hörde till vilket kursmoment, men jag gör mitt bästa.

### Svårigheter

Jag har gått vilse i min planering. Jag har jobbat parallellt med kmom03 och
-04 bara för att nu inse att jag inte gjort kmom02 färdigt. Det är inte utan
att man känner sig lite asyncron själv, jag har liksom jobbat i cirklar.

Trots ovanstående tar jag in kunskap, vissa saker bättre just för att jag
läser baklänges. Jag kan async och await när jag börjar på artikeln om
asynkron programmering.

Mina stora svårigheter inom JavaScript snarare än inom SQL.

### Skolan

Jag tuffade på ganska bra genom de instruerade övningarna. Vid ett tillfälle
skulle vi kopiera tabellen för lönerevision, och där råkade jag på bekymmer.
Just för att kunna räkna ut löneutveckling och dylikt så skapade jag en
kolumn "ny_lon" redan i kmom01. Det var ju grymt smidigt då, men gjorde ju
kopiering lite struligare nu, när kolumnerna inte överensstämde.

För att göra mitt script [idempotent][1] fick jag skapa en PROCEDURE:

<code>-- Replace my column ny_lon
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

Coolt va? Den ville jag visa upp, för det är väl några kursmoment innan vi
kommer till procedurer, eller hur?

### Node JS mot MySQL

Att skriva nodejs mot MySQL var inte några stora bekymmer. Jag lade en del tid
på att försöka skapa en universaltabell för utdata, men det är ju ett
jättestort jobb. Nu hade vi ju dessutom turen att alla sökningar kom att rymmas
inom likadana tabeller. Så jag skapade en enda tabellfunktion ändå, och såg
till att resultatet passade i tabellen.

Terminalprogram som använder databasen är ett nytt arbetssätt för mig, men det
känns helt naturligt och till och med rätt smidigt. Istället för att nå min
databas via browsern eller MariaDB:s egen CLI-klient kan jag köra sql-filer
med hjälp av mitt eget program. Suveränt.

### Kort och koncist

__Du har nu använt både UNION och JOIN för att slå samman tabeller i SQL__,
 vilken är din uppfattning om databaser och SQL så här långt?

Förenklat skulle jag vilja säga att UNION sätter samman data i nya rader, och
JOIN kombinerar data i nya kolumner. Med UNION kan man stapla resultat ovanpå
varandra, och med JOIN kan man räkna ihop kolumnerna.

Jag tycker att SQL är ett mycket kraftfullt verktyg. Istället för att jobba med
ett resultat när man hämtat det från (till exempel) en textfil så kan man
förbereda data så att den kräver minimal hantering i efterhand.

__Är detta den första bekantskap med JavaScript på serversidan och Node.js__,
hur känns det och vilken uppfattning, eller förutfattade meningar, har du om
detta?

Det är första gången jag kör node. Att köra JavaScript i terminalen känns lite
som att köra Python.

Varje gång vi provar något gammalt i ett nytt sammanhang så ökar min förståelse.
Python känns mer relevant nu när vi börjat med FLASK-lösningar. JavaScript och
MySQL i terminalen blir påtagligt och omedelbart än att sitta och ladda om
en browser.

I stort sett allt blir bättre om det kan hanteras via CLI. Jag har kommit att
hata pekdon och multitasking med massor av fönster och flikar.

__Hur kändes konceptet med async och await och asynkron programmering?__

Fullständigt naturligt. Eftersom jag i stort sett bara har jobbat med program
som exekveras på begäran, via events och requests så har det varit förlösande
att finna att saker och ting inte nödvändigtvis måste ske i ett helt linjärt
flöde.

__Hur gick det att koppla ihop JavaScript, Node.js med SQL och databasen?__

Det var inga bekymmer. Det känns som allt går smidigare ju fler lösningar vi har
provat på. Den här gången har jag inte ens haft bekymmer med installationerna.
Allt fungerar direkt.

__Vilken är din TIL för detta moment?__

Jag behöver hålla ordning på mina studier. Jag har läst runt i cirklar ett tag
nu, och det är lite onödigt. Det är svårt nog att vi skall läsa flera kodspråk,
CLI-klienter och serverlösningar parallellt.

[1]: https://sv.wikipedia.org/wiki/Idempotent
