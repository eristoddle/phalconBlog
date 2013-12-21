<!DOCTYPE html>
<html>
	<head>
		<title>Phalcon Blog</title>
        {{ stylesheet_link("css/bootstrap/bootstrap.min.css") }}
        {{ stylesheet_link("css/bootstrap/bootstrap-responsive.min.css") }}
        {{ tag_html(
            "link",
            [
                "rel": "alternate",
                "type": "application/rss+xml",
                "title": "RSS Feed for Phalcon Blog",
                "href": "/phalconBlog/posts/feed"
            ],
             true,
             true,
             true)
         }}
	</head>
	<body>
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
        <div id="content" class="container-fluid">
            <div class="row-fluid">
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
            <div class="span9 well">
            {{ content() }}
            </div>
            </div>
        </div>
        {{ javascript_include("js/jquery.min.js") }}
        {{ javascript_include("js/bootstrap.min.js") }}
	</body>
</html>