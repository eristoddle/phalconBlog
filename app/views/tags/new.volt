
{{ form("tags/create", "method":"post") }}

<table width="100%">
    <tr>
        <td align="left">{{ link_to("tags", "Go Back") }}</td>
        <td align="right">{{ submit_button("Save") }}</td>
    <tr>
</table>

{{ content() }}

<div align="center">
    <h1>Create tags</h1>
</div>

<table>
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
