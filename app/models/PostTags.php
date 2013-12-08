<?php


class PostTags extends \Phalcon\Mvc\Model
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
    public $posts_id;
     
    /**
     *
     * @var integer
     */
    public $tags_id;
     
    /**
     * Initialize method for model.
     */
    public function initialize()
    {
		$this->belongsTo("tags_id", "Tags", "id", array("foreignKey"=>true));
		$this->belongsTo("posts_id", "Posts", "id", array("foreignKey"=>true));

    }

}
