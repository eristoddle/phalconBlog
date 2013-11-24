{{ content() }}

<div>
    <h1>{{ post.title }}</h1>
</div>

<article>
    {{ post.body }}
    <div>{{ link_to("posts/edit/"~post.id, "Edit") }}</div>
    <div>{{ link_to("posts/delete/"~post.id, "Delete") }}</div>
</article>