---
layout: index 
---

# _bitácora

{% for post in site.posts %}        
<p>
    <a href="{{ baseurl }}{{ post.url }}">[{{ post.date | date: "%Y/%m/%d" }}] {{ post.title }}</a>
</p>
{% endfor %}

