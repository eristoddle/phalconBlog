<?php


class Posts extends \Phalcon\Mvc\Model
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
    public $users_id;
     
    /**
     *
     * @var string
     */
    public $title;
     
    /**
     *
     * @var string
     */
    public $body;
     
    /**
     *
     * @var string
     */
    public $excerpt;
     
    /**
     *
     * @var string
     */
    public $published;
     
    /**
     *
     * @var string
     */
    public $updated;
     
    /**
     *
     * @var string
     */
    public $pinged;
     
    /**
     *
     * @var string
     */
    public $to_ping;
     
    /**
     * Initialize method for model.
     */
    public function initialize()
    {
		$this->hasMany("id", "Comments", "posts_id", NULL);
		$this->hasMany("id", "PostTags", "posts_id", NULL);
		$this->belongsTo("users_id", "Users", "id", array("foreignKey"=>true));

    }

}
