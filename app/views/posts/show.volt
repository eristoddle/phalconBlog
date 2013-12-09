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
    <div>{{ link_to("posts/edit/"~post.id, "Edit") }}</div>
    <div>{{ link_to("posts/delete/"~post.id, "Delete") }}</div>
</article>