{{'<?xml version="1.0" encoding="UTF-8" ?>'}}

<rss version="2.0">
    <channel>
        <title>{{ config.blog.title }}</title>
        <description>This is a demonstration of the Phalcon Framework</description>
        <link>{{ config.blog.url }}</link>
        {% for post in posts %}
            <item>
                <title>{{ post.title|e }}</title>
                <description>{{ post.excerpt|e }}</description>
                <link>{{ config.blog.url }}{{ url("posts/show/"~post.id) }}</link>
                <guid>{{ config.blog.url }}{{ url("posts/show/"~post.id) }}</guid>
                <pubDate>{{ post.rss_date }}</pubDate>
            </item>
        {% endfor %}
    </channel>
</rss>