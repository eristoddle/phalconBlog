{{ get_doctype() }}
<html>
	<head>
		{{ get_title() }}
        {{ stylesheet_link("css/bootstrap/bootstrap.min.css") }}
        {{ stylesheet_link("css/bootstrap/bootstrap-responsive.min.css") }}
        {{ tag_html(
            "link",
            [
                "rel": "alternate",
                "type": "application/rss+xml",
                "title": "RSS Feed for Phalcon Blog",
                "href": config.application.baseUri~"posts/feed"
            ],
             true,
             true,
             true)
         }}
	</head>
	<body>
	    {{ partial("partials/navbar") }}
        <div id="content" class="container-fluid">
            <div class="row-fluid">
            {{ partial("partials/sidebar") }}
            <div class="span9 well">
            {{ content() }}
            </div>
            </div>
        </div>
        {{ javascript_include("js/jquery.min.js") }}
        {{ javascript_include("js/bootstrap.min.js") }}
	</body>
</html>