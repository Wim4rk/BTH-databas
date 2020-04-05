## <a id="kmom01">Kmom01</a>

Det är alltid roligt att starta upp en ny kurs. Även om det än en gång
skulle börja med installationsbekymmer. Det är roligt att ställa upp en
ny presentationssida. Jag lär mig mer och mer och kan skapa bättre sidor
enklare.

### Svårigheter

Av någon anledning gav jag mig
sjutton på att jag skulle använda MySQL, och det ville inte min version
av Debian. Därför gick jag över till MariaDB, men det gick inte heller.

Efter att en mycket tålmodig Mikael Roos handlett mig en stund kom vi fram
till att det rörde sig om en officiell bugg. Det kändes ganska så bra,
eller i alla fall bättre än att lägga tre dagars felhantering på ett
enkelt användarfel.

###Introduktion, labb

Jag har ju kört en hel del SQL tidigare, så själva koden är ganska enkel
att hänga med i för mig. När jag väl fått igång allting så är jag mycket
imponerad av hur smidigt det är att köra CLI-klienten. Särskilt när man
anropar sql-filer, antingen direkt från terminalen, eller genom att
ange <em>source</em> inifrån klienten.

Att spara SQL i filer som _back up_ har jag gjort förut, men jag har aldrig
tänkt på att det borde vara uppdelat i olika typer; _ddl_, _dml_ och så
vidare. Det var rätt smart. Innan vi lärde oss att skriva ett bash-script
valde jag att kopiera över alla SQL-uttryck till en enda fil --
<code>reset.sql</code>. Det hade i stort sett samma funktion men kunde
dessutom köras inifrån MariaDB-klienten.

Det var inte särdeles svåra övningar den här gången. Jag har gjort det här
tidigare. När jag väl fått miljön på plats gjorde jag övningarna på en dag.
Skönt med en mjukstart.

###Kort och koncist

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
