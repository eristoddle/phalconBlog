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
         public function setId($id)
    {
        $this->id = $id;
        return $this;
    }
    public function setTitle($title)
    {
        $this->title = $title;
        return $this;
    }
    public function setBody($body)
    {
        $this->body = $body;
        return $this;
    }
    public function setExcerpt($excerpt)
    {
        $this->excerpt = $excerpt;
        return $this;
    }
    public function setPublished($published)
    {
        $this->published = $published;
        return $this;
    }
    public function setUpdated($updated)
    {
        $this->updated = $updated;
        return $this;
    }
    public function setPinged($pinged)
    {
        $this->pinged = $pinged;
        return $this;
    }
    public function setToPing($to_ping)
    {
        $this->to_ping = $to_ping;
        return $this;
    }
    public function getId()
    {
        return $this->id;
    }
    public function getTitle()
    {
        return $this->title;
    }
    public function getBody()
    {
        return $this->body;
    }
    public function getExcerpt()
    {
        return $this->excerpt;
    }
    public function getPublished()
    {
        return $this->published;
    }
    public function getUpdated()
    {
        return $this->updated;
    }
    public function getPinged()
    {
        return $this->pinged;
    }
    public function getToPing()
    {
        return $this->to_ping;
    }

}
