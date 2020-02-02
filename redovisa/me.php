<!doctype html>
<?php
    require __DIR__ . "/vendor/autoload.php";
?>
<html lang="sv">
<head>
    <meta charset="utf-8">
    <title>Me | Databas</title>
    <link rel="stylesheet" href="style/style.css">
</head>

<body>


<?php
    include __DIR__ . "/view/header_nav.php";
?>


<article>

<?php
    $filename = __DIR__ . "/texter/me.md";
    $text     = file_get_contents($filename);
    $filter   = new \Anax\TextFilter\TextFilter();
    $parsed   = $filter->parse($text, ["shortcode", "markdown"]);
    echo $parsed->text;
?>

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
