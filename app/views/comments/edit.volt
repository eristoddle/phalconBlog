{{ form("comments/save", "method":"post") }}
{{ content() }}
{{ link_to("comments", "Go Back") }}

<div align="center">
    <h1>Edit comments</h1>
</div>

<table>
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
            <label for="name">Name</label>
        </td>
        <td align="left">
                {{ text_field("name", "type" : "date") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="email">Email</label>
        </td>
        <td align="left">
                {{ text_field("email", "type" : "date") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="url">Url</label>
        </td>
        <td align="left">
                {{ text_field("url", "type" : "date") }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="publish">Publish</label>
        </td>
        <td align="left">
            {{ radio_field("publish", "value" : 1) }} Yes
            {{ radio_field("publish", "value" : 0) }} No
        </td>
    </tr>
    <tr>
        <td>{{ hidden_field("id") }}</td>
        <td>{{ submit_button("Save", "class" : "btn") }}</td>
    </tr>
</table>

</form>
