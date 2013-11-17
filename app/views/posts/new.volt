
{{ form("posts/create", "method":"post") }}

<table width="100%">
    <tr>
        <td align="left">{{ link_to("posts", "Go Back") }}</td>
        <td align="right">{{ submit_button("Save") }}</td>
    <tr>
</table>

{{ content() }}

<div align="center">
    <h1>Create posts</h1>
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
        <td>{{ submit_button("Search") }}</td>
    </tr>
</table>

</form>
