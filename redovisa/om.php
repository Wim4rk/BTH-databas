<?php
include __DIR__ . "/Parsedown.php";
use Michelf\SmartyPants;

    $title = "Om";

    include __DIR__ . "/templates/header.php";

    $filename   = __DIR__ . "/texter/om.md";
    $text       = file_get_contents($filename);
    $Pants      = new SmartyPants();
    $Pars       = new Parsedown();
    echo $Pants->defaultTransform($Pars->text($text));

include(__DIR__ . "/templates/footer.php");
