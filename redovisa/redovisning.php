<!doctype html>

<?php
    require __DIR__ . "/vendor/autoload.php";
?>

<html lang="sv">
<head>
<meta charset="utf-8">
<title>Redovisning | Databas</title>
<link rel="stylesheet" href="style/style.css">
</head>

<body>

<?php
    include __DIR__ . "/view/header_nav.php";
?>

<article>
    <h1>Redovisning av kursmoment</h1>
    <header>
        <p>Snabblänkar till respektive kursmoment:</p>

        <a href="#kmom01">Kmom01</a> |
        <a href="#kmom02">Kmom02</a> |
        <a href="#kmom03">Kmom03</a> |
        <a href="#kmom04">Kmom04</a> |
        <a href="#kmom05">Kmom05</a> |
        <a href="#kmom06">Kmom06</a> |
        <a href="#kmom07">Slutredovisning</a>

    </header>

    <section>
    <?php
        $filename = __DIR__ . "/texter/kmom01.md";
        $text     = file_get_contents($filename);
        $filter   = new \Anax\TextFilter\TextFilter();
        $parsed   = $filter->parse($text, ["shortcode", "markdown"]);
        echo $parsed->text;
    ?>
    </section>

    <section>
    <?php
        $filename = __DIR__ . "/texter/kmom02.md";
        $text     = file_get_contents($filename);
        $filter   = new \Anax\TextFilter\TextFilter();
        $parsed   = $filter->parse($text, ["shortcode", "markdown"]);
        echo $parsed->text;
    ?>
    </section>

    <section>
        <?php
            $filename = __DIR__ . "/texter/kmom03.md";
            $text     = file_get_contents($filename);
            $filter   = new \Anax\TextFilter\TextFilter();
            $parsed   = $filter->parse($text, ["shortcode", "markdown"]);
            echo $parsed->text;
        ?>
    </section>

    <section>
    <a id="kmom04"><h2>Kmom04</h2></a>
    </section>

    <section>
    <a id="kmom05"><h2>Kmom05</h2></a>
    </section>

    <section>
    <a id="kmom06"><h2>Kmom06</h2></a>
    <p>Tänk, tryck, tala.</p>
    </section>

    <section>
    <a id="kmom07"><h2>Kmom07 - 10</h2></a>
    <p>Tänk, tryck, tala.</p>
    </section>

</article>

<footer id="site-footer">
    <h4>Valideringsverktyg</h4>
    <p>
        <a href="http://validator.w3.org/check/referer" target="_blank">HTML5</a> |
        <a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank">CSS</a> |
        <a href="http://validator.w3.org/unicorn/check?ucn_uri=referer&amp;ucn_task=conformance" target="_blank">Unicorn</a>
    </p>
</footer>

<script src="js/main.js"></script>
</body>
</html>
