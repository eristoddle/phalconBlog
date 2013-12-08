<!DOCTYPE html>
<html>
	<head>
		<title>Phalcon Blog</title>
		<link rel="stylesheet" href="/phalconBlog/css/bootstrap/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="/phalconBlog/css/bootstrap/bootstrap-responsive.min.css" type="text/css" />
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
                    <a href="/phalconBlog" class="brand">Phalcon Blog</a>
                    <div class="nav-collapse">
                        <ul class="nav">
                            <li>{{ link_to("posts/", "Posts") }}</li>
                            <li>{{ link_to("posts/search", "Advanced Search") }}</li>
                            <li>{{ link_to("posts/new", "Create posts") }}</li>
                            <li><a href="/phalconBlog/webtools.php?_url=/index" target="_blank">Webtools</a></li>
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
                       </form>
                    </div>
                </div>
            <div class="span9 well">
            {{ content() }}
            </div>
            </div>
        </div>
		<script src="/phalconBlog/js/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="/phalconBlog/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
	</body>
</html>