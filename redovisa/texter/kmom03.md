<a id="kmom03"><h2>Kmom03</h2></a>

Det går skapligt just nu. Möjligen har jag lite dålig struktur på mitt läsande
kring just den här kursen. Det känns som att jag missat något i tidigare
kursmoment. Jag får läsa baklänges när jag kommer på vad det är.

Jag har också kunnat plocka lite kunskaper från kmom04. Det känns nästan som
att de här bägge momenten sitter ihop.

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

Än så länge är det JavaScript som är svårast i den här kursen, även om jag den
här gången träffade jag ett kvistigt problem. Jag kunde inte få *Foreign
keys* att fungera när jag skapade en tabell mellan två andra tabeller-
(Övningen [skapa fler tabeller][2].) MariaDB anmälde hela tiden att det var ett
bekymmer med tabellen där jag försökte att skapa en referens, och jag felsökte
där i timmar. Niklas Andersson hjälpte mig på lördagskvällen och fann att det
inte fanns någon primärnyckel på den av tabellerna jag länkade till, och då
fungerar det ju inte.

Som en trevlig bieffekt så lärde jag mig en del om teckenkodning och
databas-motorer. Och att det finns otroligt formella sätt att uttrycka
beroenden, kopplingar med mera.

###Introduktion, labb

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

Det finns mer än <samp>\<code\></samp>-elementet för att skriva kodliknande
text i HTML-text. Till exempel <samp>\<kbd\></samp> som står för input,
<samp>\<amp\></samp> som står för output och <samp>\<var\></samp> som står för
variabel.

[2]: https://dbwebb.se/guide/kom-igang-med-sql-i-mysql/skapa-fler-tabeller
