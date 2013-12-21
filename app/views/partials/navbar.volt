<div class="navbar">
    <div class="navbar-inner">
        <div class="container">
            <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            {{ link_to("", "Phalcon Blog", "class" : "brand") }}
            <div class="nav-collapse">
                <ul class="nav">
                    <li>{{ link_to("posts/", "Posts") }}</li>
                    <li>{{ link_to("tags/", "Tags") }}</li>
                    <li>{{ link_to("users/", "Users") }}</li>
                    <li>{{ link_to("posts/new", "Create posts") }}</li>
                    <li>{{ link_to("comments/", "Comments") }}</li>
                    <li>{{ link_to("webtools.php", "Webtools", "target" : "blank") }}</li>
                </ul>
            </div>
        </div>
    </div>
</div>