<?php

use Phalcon\Mvc\Model\Criteria,
    Phalcon\Paginator\Adapter\Model as Paginator;

class PostsController extends ControllerBase
{

    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for posts
     */
    public function searchAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Posts", $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }
        $parameters["order"] = "id";

        $posts = Posts::find($parameters);
        if (count($posts) == 0) {
            $this->flash->notice("The search did not find any posts");
            return $this->dispatcher->forward(array(
                "controller" => "posts",
                "action" => "index"
            ));
        }

        $paginator = new Paginator(array(
            "data" => $posts,
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
     * Edits a post
     *
     * @param string $id
     */
    public function editAction($id)
    {

        if (!$this->request->isPost()) {

            $post = Posts::findFirstByid($id);
            if (!$post) {
                $this->flash->error("post was not found");
                return $this->dispatcher->forward(array(
                    "controller" => "posts",
                    "action" => "index"
                ));
            }

            $this->view->id = $post->id;

            $this->tag->setDefault("id", $post->getId());
            $this->tag->setDefault("title", $post->getTitle());
            $this->tag->setDefault("body", $post->getBody());
            $this->tag->setDefault("excerpt", $post->getExcerpt());
            $this->tag->setDefault("published", $post->getPublished());
            $this->tag->setDefault("updated", $post->getUpdated());
            $this->tag->setDefault("pinged", $post->getPinged());
            $this->tag->setDefault("to_ping", $post->getToPing());
            
        }
    }

    /**
     * Creates a new post
     */
    public function createAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "posts",
                "action" => "index"
            ));
        }

        $post = new Posts();

        $post->setId($this->request->getPost("id"));
        $post->setTitle($this->request->getPost("title"));
        $post->setBody($this->request->getPost("body"));
        $post->setExcerpt($this->request->getPost("excerpt"));
        $post->setPublished($this->request->getPost("published"));
        $post->setUpdated($this->request->getPost("updated"));
        $post->setPinged($this->request->getPost("pinged"));
        $post->setToPing($this->request->getPost("to_ping"));
        

        if (!$post->save()) {
            foreach ($post->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->dispatcher->forward(array(
                "controller" => "posts",
                "action" => "new"
            ));
        }

        $this->flash->success("post was created successfully");
        return $this->dispatcher->forward(array(
            "controller" => "posts",
            "action" => "index"
        ));

    }

    /**
     * Saves a post edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "posts",
                "action" => "index"
            ));
        }

        $id = $this->request->getPost("id");

        $post = Posts::findFirstByid($id);
        if (!$post) {
            $this->flash->error("post does not exist " . $id);
            return $this->dispatcher->forward(array(
                "controller" => "posts",
                "action" => "index"
            ));
        }

        $post->setId($this->request->getPost("id"));
        $post->setTitle($this->request->getPost("title"));
        $post->setBody($this->request->getPost("body"));
        $post->setExcerpt($this->request->getPost("excerpt"));
        $post->setPublished($this->request->getPost("published"));
        $post->setUpdated($this->request->getPost("updated"));
        $post->setPinged($this->request->getPost("pinged"));
        $post->setToPing($this->request->getPost("to_ping"));
        

        if (!$post->save()) {

            foreach ($post->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "posts",
                "action" => "edit",
                "params" => array($post->id)
            ));
        }

        $this->flash->success("post was updated successfully");
        return $this->dispatcher->forward(array(
            "controller" => "posts",
            "action" => "index"
        ));

    }

    /**
     * Deletes a post
     *
     * @param string $id
     */
    public function deleteAction($id)
    {

        $post = Posts::findFirstByid($id);
        if (!$post) {
            $this->flash->error("post was not found");
            return $this->dispatcher->forward(array(
                "controller" => "posts",
                "action" => "index"
            ));
        }

        if (!$post->delete()) {

            foreach ($post->getMessages() as $message){
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(array(
                "controller" => "posts",
                "action" => "search"
            ));
        }

        $this->flash->success("post was deleted successfully");
        return $this->dispatcher->forward(array(
            "controller" => "posts",
            "action" => "index"
        ));
    }

}
