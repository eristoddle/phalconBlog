<?php
use Phalcon\Mvc\User\Plugin;

class PageCache extends Plugin {

    static function createKey($controller, $action, $parameters = array()){
        return urlencode($controller.$action.serialize($parameters));
    }

    public function afterRender($event, $view) {
        if($view->getCache()->isStarted()){
            $controller = $view->getControllerName();
            $action = $view->getActionName();
            $parameters = $view->getParams();
            $key = $this->createKey($controller, $action, $parameters);
            $view->getCache()->save($key, $view->getContent());
        }
    }
}