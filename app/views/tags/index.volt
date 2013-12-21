
{{ content() }}

<div align="right">
    {{ link_to("tags/new", "Create tags") }}
</div>

{{ form("tags/search", "method":"post", "autocomplete" : "off") }}

<div align="center">
    <h1>Search tags</h1>
</div>

<table>
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
            <label for="tag">Tag</label>
        </td>
        <td align="left">
            {{ text_field("tag", "size" : 30) }}
        </td>
    </tr>

    <tr>
        <td></td>
        <td>{{ submit_button("Search") }}</td>
    </tr>
</table>

{{ end_form() }}
