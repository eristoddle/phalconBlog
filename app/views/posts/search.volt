
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

<div align="center">
    <h1>Search Posts</h1>
</div>

<table align="center">
    <tr>
        <td align="right">
            <label for="id">Id</label>
        </td>
        <td align="left">
            {{ text_field("id", "type" : "numeric") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="title">Title</label>
        </td>
        <td align="left">
                {{ text_field("title", "type" : "date") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="body">Body</label>
        </td>
        <td align="left">
                {{ text_field("body", "type" : "date") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="excerpt">Excerpt</label>
        </td>
        <td align="left">
                {{ text_field("excerpt", "type" : "date") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="published">Published</label>
        </td>
        <td align="left">
            {{ text_field("published", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="updated">Updated</label>
        </td>
        <td align="left">
            {{ text_field("updated", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="pinged">Pinged</label>
        </td>
        <td align="left">
                {{ text_field("pinged", "type" : "date") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="to_ping">To Of Ping</label>
        </td>
        <td align="left">
                {{ text_field("to_ping", "type" : "date") }}
        </td>
    </tr>

    <tr>
        <td></td>
        <td>{{ submit_button("Search", "class" : "btn") }}</td>
    </tr>
</table>

</form>
{% endif %}
