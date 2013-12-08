
{{ content() }}

<table width="100%">
    <tr>
        <td align="left">
            {{ link_to("comments/index", "Go Back") }}
        </td>
        <td align="right">
            {{ link_to("comments/new", "Create ") }}
        </td>
    <tr>
</table>

<table class="browse" align="center">
    <thead>
        <tr>
            <th>Id</th>
            <th>Post</th>
            <th>Body</th>
            <th>Name</th>
            <th>Email</th>
            <th>Url</th>
            <th>Submitted</th>
            <th>Publish</th>
            <th>Posts</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for comment in page.items %}
        <tr>
            <td>{{ comment.id }}</td>
            <td>{{ comment.post_id }}</td>
            <td>{{ comment.body }}</td>
            <td>{{ comment.name }}</td>
            <td>{{ comment.email }}</td>
            <td>{{ comment.url }}</td>
            <td>{{ comment.submitted }}</td>
            <td>{{ comment.publish }}</td>
            <td>{{ comment.posts_id }}</td>
            <td>{{ link_to("comments/edit/"~comment.id, "Edit") }}</td>
            <td>{{ link_to("comments/delete/"~comment.id, "Delete") }}</td>
        </tr>
    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="right">
                <table align="center">
                    <tr>
                        <td>{{ link_to("comments/search", "First") }}</td>
                        <td>{{ link_to("comments/search?page="~page.before, "Previous") }}</td>
                        <td>{{ link_to("comments/search?page="~page.next, "Next") }}</td>
                        <td>{{ link_to("comments/search?page="~page.last, "Last") }}</td>
                        <td>{{ page.current~"/"~page.total_pages }}</td>
                    </tr>
                </table>
            </td>
        </tr>
    <tbody>
</table>
