---
layout: default
format: blog-index
noindex: true
show_meta: false
title: "Projects"
subheadline: "Projects pages"

header:
  title: Projects
  image_fullwidth: blog-cover.png

permalink: "/projects/"
---
<div class="row">
	<div class="medium-8 columns t30">
    	{% include list-projects collection='projects' %}
	</div><!-- /.medium-7.columns -->


	<div class="medium-4 columns t30">
		{% include _sidebar.html %}
	</div><!-- /.medium-5.columns -->
</div><!-- /.row -->
