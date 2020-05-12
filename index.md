---
layout: index
---

## _ bitácora
<a href="https://telegra.ph/Estado-de-la-industria-de-SW-en-Colombia-seg%C3%BAn-yo-11-08">[2018/11/08] Estado de la industria de SW en Colombia según yo</a>
{% for post in site.posts %}
<p>
    <a href="{{ baseurl }}{{ post.url }}">[{{ post.date | date: "%Y/%m/%d" }}] {{ post.title }}</a>
</p>
{% endfor %}

