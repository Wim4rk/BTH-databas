<?php

$title = "Redovisning";

include(__DIR__ . "/templates/header.php");
?>

    <h1>Redovisning av kursmoment</h1>
    <header>
        <p>Snabblänkar till respektive moment</p>

        <a href="?page=kmom01">Kmom01</a> |
        <a href="?page=kmom02">Kmom02</a> |
        <a href="?page=kmom03">Kmom03</a> |
        <a href="?page=kmom04">Kmom04</a> |
        <a href="?page=kmom05">Kmom05</a> |
        <a href="?page=kmom06">Kmom06</a> |
        <a href="?page=kmom10">Slutredovisning</a>
    </header>

<?php
if (file_exists(__DIR__ . "/texter/{$kmom}.md")) {
    $filename   = __DIR__ . "/texter/{$kmom}.md";
    $text       = file_get_contents($filename);
    $Pants      = new SmartyPants();
    $Pars       = new Parsedown();
    echo $Pants->defaultTransform($Pars->text($text));
} else { ?>
    <h2>Texten finns inte</h2>
    <p>Antagligen så har jag inte hunnit redovisa det här kurs-momentet...</p>
<?php } 

include(__DIR__ . "/templates/footer.php");

?>

