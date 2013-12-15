{{ content() }}
{{ link_to("comments", "Go Back") }}

<div align="center">
    <h1>Edit comments</h1>
</div>

<div>
    {{ form("comments/save", "method":"post") }}
        <label for="body">Body</label>{{ text_area("body") }}
        <label for="name">Name</label>{{ text_field("name") }}
        <label for="email">Email</label>{{ text_field("email") }}
        <label for="url">Url</label>{{ text_field("url") }}
        <label for="publish">Publish</label>
        {{ radio_field("publish", "value" : 1) }} Yes
        {{ radio_field("publish", "value" : 0) }} No
        {{ hidden_field("id") }}
        {{ submit_button("Save", "class" : "btn") }}
    {{ end_form() }}
</div>