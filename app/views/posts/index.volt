{{ content() }}

{% if page.items is defined %}
{% for post in page.items %}
    <article>
        <h2>{{ post.title }}</h2>
        <div>{{ post.excerpt }}</div>
        <div>{{ link_to("posts/show/"~post.id, "Show") }}</div>
    </article>
{% endfor %}
<ul class="pager">
    <li>{{ link_to("posts/index", "First") }}</li>
    <li>{{ link_to("posts/index?page="~page.before, "Previous") }}</li>
    <li>{{ link_to("posts/index?page="~page.next, "Next") }}</li>
    <li>{{ link_to("posts/index?page="~page.last, "Last") }}</li>
    <li>{{ page.current~"/"~page.total_pages }}</li>
</ul>
{% endif %}
