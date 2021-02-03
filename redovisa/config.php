<?php header('content-type: text/html;charset=utf-8');

// Error reporting
error_reporting(-1);

// Install PSR-0-compatible class autoloader
spl_autoload_register(function ($class) {
    require preg_replace('{\\\\|_(?!.*\\\\)}', DIRECTORY_SEPARATOR, ltrim($class, '\\')).'.php';
});
