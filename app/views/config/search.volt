
{{ content() }}

<table width="100%">
    <tr>
        <td align="left">
            {{ link_to("config/index", "Go Back") }}
        </td>
        <td align="right">
            {{ link_to("config/new", "Create ") }}
        </td>
    <tr>
</table>

<table class="browse" align="center">
    <thead>
        <tr>
            <th>Id</th>
            <th>Config</th>
         </tr>
    </thead>
    <tbody>
    {% if page.items is defined %}
    {% for config in page.items %}
        <tr>
            <td>{{ config.id }}</td>
            <td>{{ config.config }}</td>
            <td>{{ link_to("config/edit/"~config.id, "Edit") }}</td>
            <td>{{ link_to("config/delete/"~config.id, "Delete") }}</td>
        </tr>
    {% endfor %}
    {% endif %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="2" align="right">
                <table align="center">
                    <tr>
                        <td>{{ link_to("config/search", "First") }}</td>
                        <td>{{ link_to("config/search?page="~page.before, "Previous") }}</td>
                        <td>{{ link_to("config/search?page="~page.next, "Next") }}</td>
                        <td>{{ link_to("config/search?page="~page.last, "Last") }}</td>
                        <td>{{ page.current~"/"~page.total_pages }}</td>
                    </tr>
                </table>
            </td>
        </tr>
    <tbody>
</table>
