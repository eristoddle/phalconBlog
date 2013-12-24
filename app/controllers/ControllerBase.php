<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller {

    public function initialize() {
        $this->tag->setTitle($this->config->blog->title);
        $this->tag->setDoctype(\Phalcon\Tag::HTML5);
    }

    public function createKey($controller, $action, $parameters = array()){
        return urlencode($controller.$action.serialize($parameters));
    }
}