<?php
    // Install PSR-0-compatible class autoloader
    // spl_autoload_register(function($class){
    // 	require preg_replace('{\\\\|_(?!.*\\\\)}', DIRECTORY_SEPARATOR, ltrim($class, '\\')).'.php';
    // });
    include __DIR__ . "/Parsedown.php";
    // require_once dirname(__FILE__) . 'SmartyPants/SmartyPants.php';
    // include "SmartyPants/SmartyPants.inc.php";

    // Install PSR-0-compatible class autoloader
    spl_autoload_register(function($class){
    	require preg_replace('{\\\\|_(?!.*\\\\)}', DIRECTORY_SEPARATOR, ltrim($class, '\\')).'.php';
    });

    // Get SmartyPants and Markdown classes
    use Michelf\SmartyPants;

    $kmom = isset($_GET["page"]) ? $_GET["page"] : "kmom01";
?>

<!doctype html>
<html lang="sv">
<head>
<meta charset="utf-8">
<title>Redovisning | vlinux</title>
<link rel="stylesheet" href="style/style.css">
</head>

<body>



<header>
    <nav>
        <a href="me.html">Me</a> |
        <a href="redovisning.php">Redovisning</a> |
        <a href="om.html">Om</a>
    </nav>
</header>



<article>
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

<section>
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
<?php } ?>

</article>


</body>
</html>
