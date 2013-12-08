<?php


class Comments extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;
     
    /**
     *
     * @var integer
     */
    public $post_id;
     
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

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
		$this->belongsTo("posts_id", "Posts", "id", array("foreignKey"=>true));

    }

}
