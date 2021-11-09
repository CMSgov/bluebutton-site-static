---
layout: default-full
title:  "Blue Button 2.0 API resources"
description: Resources and sample applications for the Blue Button 2.0 API.
landing-page: live
gradient: "blueberry-lime-background"
subnav-link-gradient: "blueberry-lime-link"
badge: resources
permalink: "/resources/"
---
<link rel="stylesheet" media="all" href="{{ " /css/main.css" | prepend: site.baseurl }}" type="text/css">
<style>
.bb-c-card.default-card {
    margin-top: 0;
}
.ds-u-border-bottom--1 {
    border-bottom: 1px solid #d6d7d9;
}
.ds-u-border-bottom--2 {
    border-bottom: 2px solid #d6d7d9;
}
.bb-c-card.default-card .card-description p {
    min-height: 1em;
}
</style>
<div class="ds-l-container" style="max-width: 60%;">
    <div class="ds-u-display--flex ds-u-lg-flex-direction--column ds-u-flex-direction--row ds-u-lg-flex-wrap--nowrap ds-u-flex-wrap--wrap">
        <div class="bb-c-card default-card ds-u-padding--2">
            <h2 class="ds-h2 ds-u-margin-top--2 ds-u-border-bottom--2">Documentation</h2>
            {% for a in site.data.resources.documentation %}
                <h3 class="ds-h3">
                    {{a.title}}
                    {% if a.date %}
                    <span class="ds-u-float--right ds-u-font-size--sm ds-u-font-weight--normal ds-u-color--success"><date>Updated {{a.date | date: "%m/%d/%Y" }}</date></span>
                    {% endif %}
                </h3>
                {% if forloop.last == true %}
                    <div class="card-description">
                {% else %}
                    <div class="card-description ds-u-border-bottom--1">
                {% endif %}
                        <p>{{a.description}}</p>
                        <div class="ds-u-float--right"><a href="{{a.link}}">Read more <i data-feather="arrow-right"></i></a></div>
                    </div>
            {% endfor %}
        </div>
        <div class="bb-c-card default-card ds-u-padding--2">
            <h2 class="ds-h2 ds-u-margin-top--2 ds-u-border-bottom--2">Test clients</h2>
            {% for a in site.data.resources.clients %}
                <h3 class="ds-h3">
                    {{a.title}}
                    {% if a.date %}
                    <span class="ds-u-float--right ds-u-font-size--sm ds-u-font-weight--normal ds-u-color--success"><date>Updated {{a.date | date: "%m/%d/%Y" }}</date></span>
                    {% endif %}
                </h3>
                {% if forloop.last == true %}
                    <div class="card-description">
                {% else %}
                    <div class="card-description ds-u-border-bottom--1">
                {% endif %}
                        <p>{{a.description}}</p>
                        <div class="ds-u-float--right"><a href="{{a.link}}">Read more <i data-feather="arrow-right"></i></a></div>
                    </div>
            {% endfor %}
        </div>
    </div>
</div>