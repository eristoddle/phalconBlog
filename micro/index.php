<?php

$app = new Phalcon\Mvc\Micro();

$app->get(
    '/user/{name}', function ($name) {
        echo "<h1>Hi $name!</h1>";
    }
);

$app->get(
    '/api/user/{name}', function ($name) {
        echo json_encode(array("message" => "Hi ". $name));
    }
);

$app->handle();