## Kmom02

Välkommen att läsa min redovisning [online][2].

Här lär vi oss lite om nodejs. Det är en efter&shy;frågad förmåga och
jag känner att jag vill lägga mer tid på det. Vi jobbade mot en
node-server i kursen _vlinux_, så koncepten är inte så främmande för
mig. Det rör sig mest om JS-programmering, så det borde gå hyggligt
enkelt att lära sig. Här är node både server och klient, vi får
infor&shy;mationen utskriven direkt i terminalen.


### Svårigheter

Jag minns det här som ett svårt kurs&shy;moment förra året, och det är verkligen
inte självklart i år heller. Då har jag ändå läst igenom några kurser där vi
jobbat med server och klient. Jag har nog aldrig tänkt på databasen som en
server tidigare, men på sätt och vis är det så. Våra node-script begär data och
presenterar den på ett (för människor) läsbart vis.

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

Coolt va? Den ville jag visa upp, för den var jag nöjd med. Nu med lite mer
efter&shy;klokhet så hade det varit minst lika enkelt att gå tillbaks och göra
uppgiften på rätt sätt.

### Node JS mot MySQL

Att skriva nodejs mot MySQL var inte några stora bekymmer. Jag lade en del tid
på att försöka skapa en universaltabell för utdata, men det är ju ett
jättestort jobb. Nu hade vi ju dessutom turen att alla sökningar kom att rymmas
inom likadana tabeller. Så jag skapade en enda tabellfunktion ändå, och såg
till att resultatet passade i tabellen.

Terminalprogram som använder databasen är ett nytt arbetssätt för mig, men det
känns helt naturligt och till och med rätt smidigt. Istället för att nå min
databas via browsern eller MariaDB:s egen CLI-klient kan jag köra sql-filer
utifrån mitt eget script. Suveränt.

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

Förra året var det första gången jag kör node. Att köra JavaScript i terminalen
känns lite som att köra Python. Efter _vlinux_ har jag dessutom lärt mig mer om
att skriva servrar och API med node, så nu börjar det kännas hemtamt.

Varje gång vi provar något gammalt i ett nytt sammanhang så ökar min förståelse.
Python känns mer relevant nu när vi börjat med FLASK-lösningar. JavaScript och
MySQL i terminalen blir mer påtagligt och omedelbart än att sitta och ladda om
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

Jag lärde mig om <samp>php_codesniffer</samp>. Jag blev tvungen att linta 1500
rader kod i en modul jag använder på min redovisa-sida. Någon annan skrev alltså
koden, och 2013 dessutom. Nu slipper den som rättar hos er få huvudvärk, och jag
kan fortsätta att skriva markdown.

[1]: https://sv.wikipedia.org/wiki/Idempotent
[2]: http://www.student.bth.se/~olai19/dbwebb-kurser/databas/me/redovisa/redovisning.php?page=kmom02

