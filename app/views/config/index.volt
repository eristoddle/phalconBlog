
{{ content() }}

<div align="right">
    {{ link_to("config/new", "Create config") }}
</div>

{{ form("config/search", "method":"post", "autocomplete" : "off") }}

<div align="center">
    <h1>Search config</h1>
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
            <label for="config">Config</label>
        </td>
        <td align="left">
            {{ text_field("config", "size" : 30) }}
        </td>
    </tr>

    <tr>
        <td></td>
        <td>{{ submit_button("Search") }}</td>
    </tr>
</table>

</form>
