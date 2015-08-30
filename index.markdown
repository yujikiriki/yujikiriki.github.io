---
layout: index
title: Nota introductoria
author: Yuji Kiriki
author_url: http://yujikiriki.com/me.html
---
<br/>
{% for post in site.posts %}        
<h3>
    <a href="http://yujikiriki.github.io{{ post.url }}">
        {{ post.title }} <p><small>{{ post.date | date: "%Y-%m-%d" }}</small></p>
    </a>
</h3>
{% endfor %}