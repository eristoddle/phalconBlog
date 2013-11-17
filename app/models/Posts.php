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
     
}
