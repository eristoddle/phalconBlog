<?php

use Phalcon\Mvc\Model\Criteria,
    Phalcon\Paginator\Adapter\Model as Paginator;

class ConfigController extends ControllerBase
{

    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for config
     */
    public function searchAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Config", $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }
        $parameters["order"] = "id";

        $config = Config::find($parameters);
        if (count($config) == 0) {
            $this->flash->notice("The search did not find any config");
            return $this->dispatcher->forward(array(
                "controller" => "config",
                "action" => "index"
            ));
        }

        $paginator = new Paginator(array(
            "data" => $config,
            "limit"=> 10,
            "page" => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
    }

    /**
     * Displayes the creation form
     */
    public function newAction()
    {

    }

    /**
     * Edits a config
     *
     * @param string $id
     */
    public function editAction($id)
    {

        if (!$this->request->isPost()) {

            $config = Config::findFirstByid($id);
            if (!$config) {
                $this->flash->error("config was not found");
                return $this->dispatcher->forward(array(
                    "controller" => "config",
                    "action" => "index"
                ));
            }

            $this->view->id = $config->id;

            $this->tag->setDefault("id", $config->id);
            $this->tag->setDefault("config", $config->config);
            
        }
    }

    /**
     * Creates a new config
     */
    public function createAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "config",
                "action" => "index"
            ));
        }

        $config = new Config();

        $config->id = $this->request->getPost("id");
        $config->config = $this->request->getPost("config");
        

        if (!$config->save()) {
            foreach ($config->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->dispatcher->forward(array(
                "controller" => "config",
                "action" => "new"
            ));
        }

        $this->flash->success("config was created successfully");
        return $this->dispatcher->forward(array(
            "controller" => "config",
            "action" => "index"
        ));

    }

    /**
     * Saves a config edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "config",
                "action" => "index"
            ));
        }

        $id = $this->request->getPost("id");

        $config = Config::findFirstByid($id);
        if (!$config) {
            $this->flash->error("config does not exist " . $id);
            return $this->dispatcher->forward(array(
                "controller" => "config",
                "action" => "index"
            ));
        }

        $config->id = $this->request->getPost("id");
        $config->config = $this->request->getPost("config");
        

        if (!$config->save()) {

            foreach ($config->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "config",
                "action" => "edit",
                "params" => array($config->id)
            ));
        }

        $this->flash->success("config was updated successfully");
        return $this->dispatcher->forward(array(
            "controller" => "config",
            "action" => "index"
        ));

    }

    /**
     * Deletes a config
     *
     * @param string $id
     */
    public function deleteAction($id)
    {

        $config = Config::findFirstByid($id);
        if (!$config) {
            $this->flash->error("config was not found");
            return $this->dispatcher->forward(array(
                "controller" => "config",
                "action" => "index"
            ));
        }

        if (!$config->delete()) {

            foreach ($config->getMessages() as $message){
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "config",
                "action" => "search"
            ));
        }

        $this->flash->success("config was deleted successfully");
        return $this->dispatcher->forward(array(
            "controller" => "config",
            "action" => "index"
        ));
    }

}
