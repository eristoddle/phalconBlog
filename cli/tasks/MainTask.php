<?php

class mainTask extends \Phalcon\CLI\Task
{

    public function mainAction() {
        echo "I am a task that doesn't do much";
    }

    public function anotherAction(array $params) {
        foreach($params as $p){
            echo "I am ".$p.PHP_EOL;
        }
    }
}