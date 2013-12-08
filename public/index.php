<?php

error_reporting(E_ALL);

$debug = new \Phalcon\Debug();
$debug->listen();

/**
 * Read the configuration
 */
$config = new \Phalcon\Config\Adapter\Ini(__DIR__ . "/../app/config/config.ini");

/**
 * Read auto-loader
 */
include __DIR__ . "/../app/config/loader.php";

/**
 * Read services
 */
include __DIR__ . "/../app/config/services.php";

/**
 * Handle the request
 */
$application = new \Phalcon\Mvc\Application($di);

echo $application->handle()->getContent();