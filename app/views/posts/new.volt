
{{ form("posts/create", "method":"post") }}

{{ content() }}

<div align="center">
    <h1>Create Post</h1>
</div>

<table>
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
                {{ text_area("body", "type" : "date") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="excerpt">Excerpt</label>
        </td>
        <td align="left">
                {{ text_area("excerpt", "type" : "date") }}
        </td>
    </tr>
    <tr>
        <td></td>
        <td>{{ submit_button("Save", "class" : "btn") }}</td>
    </tr>
</table>

</form>
