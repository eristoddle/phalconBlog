<?php

use Phalcon\Mvc\Model\Validator\Email as Email;

class Comments extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var string
     */
    public $body;
     
    /**
     *
     * @var string
     */
    public $name;
     
    /**
     *
     * @var string
     */
    public $email;
     
    /**
     *
     * @var string
     */
    public $url;
     
    /**
     *
     * @var string
     */
    public $submitted;
     
    /**
     *
     * @var integer
     */
    public $publish;
     
    /**
     *
     * @var integer
     */
    public $posts_id;

    /**
     * Initialize method for model.
     */
    public function initialize() {
        $this->belongsTo("posts_id", "Posts", "id", array("foreignKey" => true));

    }
     
    /**
     * Validations and business logic
     */
    public function validation()
    {

        $this->validate(
            new Email(
                array(
                    "field"    => "email",
                    "required" => true,
                )
            )
        );
        if ($this->validationHasFailed() == true) {
            return false;
        }
    }

}
