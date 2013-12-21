<div class="span3">
    <div class="well">
        {{ form("posts/search", "method":"post", "autocomplete" : "off", "class" : "form-inline") }}
            <div class="input-append">
                {{ text_field("body", "class" : "input-medium") }}
                {{ submit_button("Search", "class" : "btn") }}
            </div>
        {{ end_form() }}
    </div>
</div>