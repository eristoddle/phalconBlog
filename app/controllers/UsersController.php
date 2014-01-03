<?php

use Phalcon\Mvc\Model\Criteria,
    Phalcon\Mvc\Model\Validator\Email as Email,
    Phalcon\Paginator\Adapter\Model as Paginator;

class UsersController extends ControllerBase {

    /**
     * Index action
     */
    public function indexAction() {
        $this->persistent->parameters = null;
        if ($this->cookies->has('user_id')) {
            $this->session->set('user_id', $this->cookies->get('user_id'));
        }
        if ($this->session->has("user_id")) {
            return $this->dispatcher->forward(
                array(
                    "controller" => "users",
                    "action" => "search"
                )
            );
        }
    }

    /**
     * Login action
     */
    public function loginAction() {
        if ($this->request->isPost()) {
            $username = $this->request->getPost('username');
            $password = $this->request->getPost('password');

            $user = Users::findFirstByUsername($username);
            if ($user && $this->security->checkHash($password, $user->password)) {
                $this->session->set("user_id", $user->id);
                $this->cookies->set('user_id', $user->id);
                $this->session->set('auth', array(
                    'id' => $user->id,
                    'name' => $user->name
                ));
                $this->flash->success("Welcome " . $user->name);
            }else{
                $this->flash->error("Username and Password combination not found");
            }
        }
        return $this->dispatcher->forward(
            array(
                "controller" => "posts",
                "action" => "index"
            )
        );
    }

    /**
     * Logout action
     */
    public function logoutAction() {
        $this->cookies->delete("user_id");
        $this->session->destroy();
        $this->flash->success("You have been logged out");
        return $this->dispatcher->forward(
            array(
                "controller" => "posts",
                "action" => "index"
            )
        );
    }

    /**
     * Searches for users
     */
    public function searchAction() {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Users", $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }
        $parameters["order"] = "id";

        $users = Users::find($parameters);
        if (count($users) == 0) {
            $this->flash->notice("The search did not find any users");
            return $this->dispatcher->forward(
                array(
                    "controller" => "users",
                    "action" => "index"
                )
            );
        }

        $paginator = new Paginator(array(
            "data" => $users,
            "limit" => 10,
            "page" => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
    }

    /**
     * Displayes the creation form
     */
    public function newAction() {

    }

    /**
     * Edits a user
     *
     * @param string $id
     */
    public function editAction($id) {

        if (!$this->request->isPost()) {

            $user = Users::findFirstByid($id);
            if (!$user) {
                $this->flash->error("user was not found");
                return $this->dispatcher->forward(
                    array(
                        "controller" => "users",
                        "action" => "index"
                    )
                );
            }

            $this->view->id = $user->id;

            $this->tag->setDefault("id", $user->id);
            $this->tag->setDefault("username", $user->username);
            $this->tag->setDefault("password", $user->password);
            $this->tag->setDefault("name", $user->name);
            $this->tag->setDefault("email", $user->email);

        }
    }

    /**
     * Creates a new user
     */
    public function createAction() {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(
                array(
                    "controller" => "users",
                    "action" => "index"
                )
            );
        }

        $user = new Users();

        $user->id = $this->request->getPost("id");
        $user->username = $this->request->getPost("username");
        $password = $this->request->getPost("password");
        $user->password = $this->security->hash($password);
        $user->name = $this->request->getPost("name");
        $user->email = $this->request->getPost("email", "email");


        if (!$user->save()) {
            foreach ($user->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->dispatcher->forward(
                array(
                    "controller" => "users",
                    "action" => "new"
                )
            );
        }

        $this->flash->success("user was created successfully");
        return $this->dispatcher->forward(
            array(
                "controller" => "users",
                "action" => "index"
            )
        );

    }

    /**
     * Saves a user edited
     *
     */
    public function saveAction() {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(
                array(
                    "controller" => "users",
                    "action" => "index"
                )
            );
        }

        $id = $this->request->getPost("id");

        $user = Users::findFirstByid($id);
        if (!$user) {
            $this->flash->error("user does not exist " . $id);
            return $this->dispatcher->forward(
                array(
                    "controller" => "users",
                    "action" => "index"
                )
            );
        }

        $user->id = $this->request->getPost("id");
        $user->username = $this->request->getPost("username");
        $password = $this->request->getPost("password");
        $user->password = $this->security->hash($password);
        $user->name = $this->request->getPost("name");
        $user->email = $this->request->getPost("email", "email");


        if (!$user->save()) {

            foreach ($user->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(
                array(
                    "controller" => "users",
                    "action" => "edit",
                    "params" => array($user->id)
                )
            );
        }

        $this->flash->success("user was updated successfully");
        return $this->dispatcher->forward(
            array(
                "controller" => "posts",
                "action" => "index"
            )
        );

    }

    /**
     * Deletes a user
     *
     * @param string $id
     */
    public function deleteAction($id) {

        $user = Users::findFirstByid($id);
        if (!$user) {
            $this->flash->error("user was not found");
            return $this->dispatcher->forward(
                array(
                    "controller" => "users",
                    "action" => "index"
                )
            );
        }

        if (!$user->delete()) {

            foreach ($user->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(
                array(
                    "controller" => "users",
                    "action" => "search"
                )
            );
        }

        $this->flash->success("user was deleted successfully");
        return $this->dispatcher->forward(
            array(
                "controller" => "users",
                "action" => "index"
            )
        );
    }

}
