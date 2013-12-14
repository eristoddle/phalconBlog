{{'<?xml version="1.0" encoding="UTF-8" ?>'}}

<rss version="2.0">
    <channel>
        <title>Phalcon Blog</title>
        <description>This is a demonstration of the Phalcon Framework</description>
        <link>http://localhost/phalconBlog/posts/feed</link>
        <lastBuildDate>{{ date("D, d M Y H:i:s O") }}</lastBuildDate>
        <pubDate>{{ date("D, d M Y H:i:s O") }}</pubDate>
        {% for post in posts %}
            <item>
                <title>{{ post.title }}</title>
                <description>{{ post.excerpt }}</description>
                <link>http://localhost{{ url("posts/show/"~post.id) }}</link>
                <guid>http://localhost{{ url("posts/show/"~post.id) }}</guid>
                <pubDate>{{ post.rss_date }}</pubDate>
            </item>
        {% endfor %}
    </channel>
</rss>