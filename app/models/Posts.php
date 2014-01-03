<?php
use Phalcon\Mvc\Model\Behavior\Timestampable;


class Posts extends \Phalcon\Mvc\Model {

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
    public function initialize() {
        $this->hasMany("id", "Comments", "posts_id", NULL);
        $this->hasMany("id", "PostTags", "posts_id", NULL);
        $this->belongsTo("users_id", "Users", "id", array("foreignKey" => true));
        $this->addBehavior(new Timestampable(
            array(
                'beforeCreate' => array(
                    'field' => 'published',
                    'format' => 'Y-m-d H:i:s'
                )
            )
        ));
        $this->addBehavior(new Timestampable(
            array(
                'beforeUpdate' => array(
                    'field' => 'updated',
                    'format' => 'Y-m-d H:i:s'
                )
            )
        ));
    }

    /**
     * Adds tags to a post
     */
    public function addTags($tags) {
        foreach ($tags as $t) {
            $t = trim($t);
            $tag = Tags::findFirst(array("tag = '$t'"));
            if (!$tag) {
                $tag = new Tags();
                $tag->tag = $t;
                $tag->save();
            }
            $postTag = PostTags::findFirst(
                array(
                    "conditions" => "posts_id = ?1 AND tags_id = ?2",
                    "bind" => array(
                        1 => $this->id,
                        2 => $tag->id
                    )
                )
            );
            if (!$postTag) {
                $postTag = new PostTags();
                $postTag->posts_id = $this->id;
                $postTag->tags_id = $tag->id;
                $postTag->save();
            }
            unset($tag);
            unset($postTag);
        }
    }

}
