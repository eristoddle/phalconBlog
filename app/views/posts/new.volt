
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
                {{ text_field("title") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="body">Body</label>
        </td>
        <td align="left">
                {{ text_area("body") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="excerpt">Excerpt</label>
        </td>
        <td align="left">
                {{ text_area("excerpt") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="tags">Tags</label>
        </td>
        <td align="left">
                {{ text_field("tags") }}
        </td>
    </tr>
    <tr>
        <td></td>
        <td>{{ submit_button("Save", "class" : "btn") }}</td>
    </tr>
</table>

{{ end_form() }}
