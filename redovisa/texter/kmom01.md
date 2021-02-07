## Kmom01

Välkommen att läsa min redovisning [online][1].

Jag gjorde ett försök att ta mig igenom den här kursen förra vårterminen, men
corona-pandemien kom emellan. Min arbetssituation förändrades och jag hade inte
samma möjlighet att studera som jag hade tänkt mig.

Jag kommer därför att använda kod från förra året närhelst det fungerar, men
jag skriver nya redovisningar.

Jag har valt att bygga om min me-sida. Jag uppdaterar den ju för varje kurs
och inom några iterationer kommer jag att ha mitt eget flat-file-ramverk, så
jag fortsätter att jobba med det. Säg ifrån om det inte beter sig som det
borde.

För varje kursmoment kommer jag att läsa igenom övningarna, och genomföra
ett eller annat för att få bort ringrosten till de moment som jag _inte_
har genomfört ännu.

### Svårigheter

När jag startade upp den här kursen försökte jag att använda MySQL, men
det ville inte fungera. När jag sedan bytta över till MariaDB så fungerade inte det heller.
Det fanns en bugg som gjorde det svårt att flytta emellan dessa varianter. Jag 
lade några dagar på installationen, vilket alltid är lite tråkigt.

Atom &ndash; texteditorn jag använder i GUI &ndash; valde att ge upp. Jag hade begått misstaget att installera den med Ubuntus mjukvaruhantering, och när jag återinstallerade den (på rätt sätt) via terminalen så blev jag av med alla mina genvägar och inställningar.

Jag skriver mest i Vim ändå.

### Introduktion, labb

Jag har ju kört en hel del SQL tidigare, så själva koden var från början
ganska enkel att hänga med i. CLI-klienten var en nyhet, och jag upplevde
den som väldigt smidig. Det har heller inte ändrat sig, efter linux-kursen
så föredrar jag att jobba i terminalen när det fungerar.

Att spara SQL i filer som _back up_ hade jag gjort förut, men uppdelning i
_ddl_, _dml_ och så vidare var nytt. Det är ett bra sätt att hålla ordning på
sin kod. Över lag lärde jag mig att det är bra att följa vissa konventioner
när man jobbar med databaser. Det finns en hel filosofi som har utvecklats
genom årtioenden, och det är bara att lära sig att tillämpa den.

En sak som var ny för mig senast var att skriva bash-script. Jag hade gjort
några smarta alias och genvägar i <samp>.bashrc</samp>, men inget rent
script. Det har jag nu, rätt mycket, både i linux-kursen och i mina privata
projekt.

###Kort och koncist

__Berätta kort om den utvecklingsmiljö du sitter i__ och vilka
databaser/klienter du installerat och vilka versioner de har.

Jag sitter på Ubuntu (Debian) och har hamnat på MariaDB. Jag har
MySQL Workbench som GUI, men jag använder det inte mycket. Det mesta sker
i terminalen.

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

Det finns mer än &lt;code&gt;-elementet för att skriva kod-liknande text i
HTML. Till exempel &lt;kbd&gt; som står för input, &lt;samp&gt; som står för output och
&lt;var&gt; som står för variabel.

[1]: http://www.student.bth.se/~olai19/dbwebb-kurser/databas/me/redovisa/redovisning.php?page=kmom01
