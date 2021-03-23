## Kmom04

Välkommen att läsa min redovisning [online][1].

Äntligen kan jag lämna in det här kursmomentet. Jag jobbade igenom det här
under sommaren 2020. Det är således den sista kod jag haft färdig på förhand,
och också det första kursmoment som jag inte redovisat tidigare.

### Express

Express-servern var ny för mig. Ett väldigt bra verktyg som jag kommer att
använda i ett hemma-projekt när jag hinner. Hade tänkt att ha en server
som står här och susar, och som jag har full koll på själv. Behöver lära mig
mer, framför allt om säkerhet innan jag börjar hosta mig själv.

Jag har inte sett &ndash; eller i alla fall förstått &ndash; att någon av de
webbhotell som jag använder ger mig möjlighet att använda vare sig Express
eller Flask. Jag förmodar att man måste ha full kontroll över själva maskinen
för att kunna köra sådant och liknande.


### Banken &ndash; CLI och EJS

Jag skapade först ett program för cli. Det känns lättare att testa sig fram
där. När jag var övertygad om att alla bakomliggande funktioner fungerade
var det ganska enkelt att skapa EJS-miljön. Eller, riktigt enkelt. Två timmar
för CLI-programmet och en kvart för EJS.

Den här gången har jag inte lagt så mycket tid på layout, varken på sidorna
eller i terminalen. Jag har också använt mycket av exempelkoden rakt av. När
jag växlat mellan delmomenten så har allt följt med. Enklast möjliga den här
gången.

### ER-modellering

Återigen så är bekymret inte med själva modelleringen, eller att formulera mig
när jag skriver. Libre Office Writer är däremot ganska motsträvigt. Jag brukade
använda MS Office och där är det mesta lite lättare. Men nu kör jag Ubuntu,
så...

Jag har hela tiden känt att det kanske är lite väl mycket extra jobb att skriva
om databasupplägget så många gånger. Och det går säkert att skära bort ett
eller annat steg om man inte gör projekt med alltför många människor
involverade. Fast det finns ju fördelar med att jobba såhär noggrant.

Det jag fann var att jag skapade själva databasen väldigt snabbt och
smidigt när jag väl satte mig för att koda.

Förresten tror jag aldrig att jag har skapat en <em>tom</em> databas förut. Jag
har skapat en tabell i taget som jag genast börjat fylla på. Ibland med fake-
data, och ibland rakt in i projektet med stor risk för att städningen tagit mer
tid än konstruktionen.

### Kort och koncist

__Hur gick det att förstå konceptet transaktioner i databas?__

Själva databasen känns enkel, än så länge. Jag kände inte till transaktioner
tidigare, men jag har funderat över problemet som de löser. Vad händer med min
data i det korta intervallet mellan två requests? I mina applikationer så har
risken varit försumbar, men hur löser man det här på lite större skala?

__Gick det bra att komma igång med Express.js, Node, EJS och MySQL?__

Jovars, inget som direkt strulade den här gången. Tvärtom fungerade allt som
jag hade tänkt mig. Servern hoppade igång och tickade på fastän jag flyttade
sökvägar och ställde till med krångel för den.

Alldeles i sista stund fick jag problem med att localhost vägrade rendera
sidorna. Enligt uppgift så fungerar allt på studentservern, och jag får rätt
data bakom kulisserna. Undersökning pågår, kanske är det något tillfälligt.

__Lyckas du med god kodstruktur för terminal och webbklient?__ du såg att man
kunde göra en enda funktion som löste flytten av pengar åt båda hållen?

Det kändes som att det gick bra. Jag har insett att det är ganska smart att
läsa kravlistan baklänges. Om man försöker att lösa en extrauppgift så
löser man garanterat grunduppgifterna.

__Gick det bra att sluföra uppgiften om ER modellering__ samt skapa SQL-kod för
databasen?

Det var en tung uppgift. Jag har verkligen en motsträvig ordbehandlare. Det är
nästan så att jag funderar på att byta ut den.

Jag gillar verkligen att skriva, men de många illustrationerna blev tunga för
mig. Egentligen var det ett bra verktyg ni tipsade om &ndash; diagrams.net
&ndash; men ibland undrade jag om det inte hade varit enklare att rita för
hand och scanna in diagrammet? (Antagligen inte, för jag ändrade en hel del i
diagrammet allt eftersom.)

__Hur känner du allmänt inför kursen så här långt?__

Jag har roligt, och jag lär mig mycket. Uppgifterna är lagom svåra. Det faller
inte på databaskunskaperna, utan snarare på JavaScript, precis som tidigare.

__Vilken är din TIL för detta kmom?__

Express.

[1]: http://www.student.bth.se/~olai19/dbwebb-kurser/databas/me/redovisa/redovisning.php?page=kmom04
