<?php


class Tags extends \Phalcon\Mvc\Model {

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var string
     */
    public $tag;

    /**
     * Initialize method for model.
     */
    public function initialize() {
        $this->hasMany("id", "PostTags", "tags_id", NULL);

    }

}
