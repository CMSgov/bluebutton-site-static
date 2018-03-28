---
layout: post
title:  "Blue Button Blog"
date:   2018-03-26 23:46:00 -0500
description: The Blue Button Blog for Developers using Blue Button 2.0 API.
landing-page: live
gradient: "blueberry-lime-background"
subnav-link-gradient: "blueberry-lime-link"
badge: api
permalink: "/blog/"
ctas:
  - 
    title: Home
    link: /
  -
    title: Comments via Google Group
    link: https://groups.google.com/forum/#!forum/Developer-group-for-cms-blue-button-api
---
<div class="post-categories">
  {% if post %}
    {% assign categories = post.categories %}
  {% else %}
    {% assign categories = page.categories %}
  {% endif %}
  {% for category in categories %}
  <a href="{{site.baseurl}}/categories/#{{category|slugize}}">{{category}}</a>
  {% unless forloop.last %}&nbsp;{% endunless %}
  {% endfor %}
</div>

<ul>
{% for post in site.posts %}
  <li>
    <a href="{{ post.url }}">
      <h2>{{ post.title }}</h2>
    </a>
  </li>
{% endfor %}
</ul>

