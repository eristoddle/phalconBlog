{{ content() }}

<div>
    <h1>{{ post.title }}</h1>
</div>

<article>
    {{ post.body }}
    <div>
    {% for posttag in post.postTags %}
        {{ posttag.tags.tag }},
    {% endfor %}
    </div>
</article>

<div>{{ link_to("posts/edit/"~post.id, "Edit") }} | {{ link_to("posts/delete/"~post.id, "Delete") }}</div>

<div class="comments">
    <h3>Comments</h3>
    <div class="comment">
    {% for comments in post.comments if comments.publish == true %}
        <div>{{ comments.body }}</div>
        <div><a href="{{ comments.url }}">{{ comments.name }}</a></div>
    {% endfor %}
    </div>
    <h3>Leave a Comment</h3>
    <div>
        {{ form("posts/comment", "method":"post") }}
        {{ hidden_field("posts_id", "value" : post.id) }}
        <div>
            <label for="title">Comment</label>
            {{ text_area("body") }}
        </div>
        <div>
            <label for="title">Name</label>
            {{ text_field("name") }}
        </div>
        <div>
            <label for="title">Email</label>
            {{ text_field("email") }}
        </div>
        <div>
            <label for="title">Website</label>
            {{ text_field("url") }}
        </div>
        {{ submit_button("Comment", "class" : "btn") }}
        {{ end_form() }}
    </div>
</div>