
{{ content() }}

{{ form("users/login", "method":"post", "autocomplete" : "off") }}

<div align="center">
    <h1>Users</h1>
</div>

<table>
    <tr>
        <td align="right">
            <label for="username">Username</label>
        </td>
        <td align="left">
            {{ text_field("username", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td align="right">
            <label for="password">Password</label>
        </td>
        <td align="left">
            {{ text_field("password", "size" : 30) }}
        </td>
    </tr>
    <tr>
        <td></td>
        <td>{{ submit_button("Login") }}</td>
    </tr>
</table>

</form>
