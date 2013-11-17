
{{ content() }}

<table width="100%">
    <tr>
        <td align="left">
            {{ link_to("posts/index", "Go Back") }}
        </td>
        <td align="right">
            {{ link_to("posts/new", "Create ") }}
        </td>
    <tr>
</table>

<table class="browse" align="center">
    <thead>
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Body</th>
            <th>Excerpt</th>
            <th>Published</th>
            <th>Updated</th>
            <th>Pinged</th>
            <th>To Of Ping</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for post in page.items %}
        <tr>
            <td>{{ post.id }}</td>
            <td>{{ post.title }}</td>
            <td>{{ post.body }}</td>
            <td>{{ post.excerpt }}</td>
            <td>{{ post.published }}</td>
            <td>{{ post.updated }}</td>
            <td>{{ post.pinged }}</td>
            <td>{{ post.to_ping }}</td>
            <td>{{ link_to("posts/edit/"~post.id, "Edit") }}</td>
            <td>{{ link_to("posts/delete/"~post.id, "Delete") }}</td>
        </tr>
    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="right">
                <table align="center">
                    <tr>
                        <td>{{ link_to("posts/search", "First") }}</td>
                        <td>{{ link_to("posts/search?page="~page.before, "Previous") }}</td>
                        <td>{{ link_to("posts/search?page="~page.next, "Next") }}</td>
                        <td>{{ link_to("posts/search?page="~page.last, "Last") }}</td>
                        <td>{{ page.current~"/"~page.total_pages }}</td>
                    </tr>
                </table>
            </td>
        </tr>
    <tbody>
</table>
