
{{ content() }}

{{ submit_button("Save") }}

<table width="100%">
    <tr>
        <td align="left">{{ link_to("config", "Go Back") }}</td>
        <td align="right">{{ submit_button("Save") }}</td>
    <tr>
</table>

<div align="center">
    <h1>Edit config</h1>
</div>

<table>
    <tr>
        <td align="right">
            <label for="config">Config</label>
        </td>
        <td align="left">
            {{ text_field("config", "size" : 30) }}
        </td>
    </tr>

    <tr>
        <td>{{ hidden_field("id") }}</td>
        <td>{{ submit_button("Search") }}</td>
    </tr>
</table>

</form>
