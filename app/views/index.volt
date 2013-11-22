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
                    <a href="/" class="brand">Phalcon Blog</a>
                    <div class="nav-collapse">
                        <ul class="nav">
                            <li class="active"><a href="/phalconBlog/webtools.php?_url=/index">Home</a></li>
                            <li><a href="/phalconBlog/webtools.php?_url=/controllers">Controllers</a></li>
                            <li><a href="/phalconBlog/webtools.php?_url=/models">Models</a></li>
                            <li><a href="/phalconBlog/webtools.php?_url=/scaffold">Scaffold</a></li>
                            <li><a href="/phalconBlog/webtools.php?_url=/migrations">Migrations</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span2">
                    <div class="well">
                        <ul class="nav nav-list">
                            <li class="active">
                                {{ form("posts/search", "method":"post", "autocomplete" : "off") }}
                                <label for="body">Body</label>
                                {{ text_field("body", "type" : "date") }}
                                {{ submit_button("Search") }}
                               </form>
                           </li>
                            <li>Recent Posts</li>
                            <li>Tags</li>
                        </ul>
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