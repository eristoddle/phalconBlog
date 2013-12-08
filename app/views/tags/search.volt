
{{ content() }}

<table width="100%">
    <tr>
        <td align="left">
            {{ link_to("tags/index", "Go Back") }}
        </td>
        <td align="right">
            {{ link_to("tags/new", "Create ") }}
        </td>
    <tr>
</table>

<table class="browse" align="center">
    <thead>
        <tr>
            <th>Id</th>
            <th>Tag</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for tag in page.items %}
        <tr>
            <td>{{ tag.id }}</td>
            <td>{{ tag.tag }}</td>
            <td>{{ link_to("tags/edit/"~tag.id, "Edit") }}</td>
            <td>{{ link_to("tags/delete/"~tag.id, "Delete") }}</td>
        </tr>
    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="right">
                <table align="center">
                    <tr>
                        <td>{{ link_to("tags/search", "First") }}</td>
                        <td>{{ link_to("tags/search?page="~page.before, "Previous") }}</td>
                        <td>{{ link_to("tags/search?page="~page.next, "Next") }}</td>
                        <td>{{ link_to("tags/search?page="~page.last, "Last") }}</td>
                        <td>{{ page.current~"/"~page.total_pages }}</td>
                    </tr>
                </table>
            </td>
        </tr>
    <tbody>
</table>
