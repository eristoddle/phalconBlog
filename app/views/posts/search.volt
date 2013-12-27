{{ form("posts/search", "method":"post") }}

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
    <li>{{ link_to("posts/search", "First") }}</li>
    <li>{{ link_to("posts/search?page="~page.before, "Previous") }}</li>
    <li>{{ link_to("posts/search?page="~page.next, "Next") }}</li>
    <li>{{ link_to("posts/search?page="~page.last, "Last") }}</li>
    <li>{{ page.current~"/"~page.total_pages }}</li>
</ul>
{% else %}
{{ form("posts/search", "method":"post", "autocomplete" : "off") }}
{% endif %}
