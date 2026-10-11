<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom">
<xsl:output method="html" encoding="utf-8" />
<xsl:template match="/atom:feed">
	<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html &gt;</xsl:text>
	<html>
	<head>
		<xsl:text disable-output-escaping="yes"><![CDATA[
		<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Atom Feed (Styled)</title>

    <link rel="stylesheet" type="text/css" href="https://blog.alessiomorale.com/assets/css/styles_feeling_responsive.css">

  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.0/css/font-awesome.min.css">
  

	<script>document.documentElement.className = "js";</script>

	<link rel="preload" href="https://blog.alessiomorale.com/assets/fonts/archivo-800-900.woff2" as="font" type="font/woff2" crossorigin>
	<link rel="preload" href="https://blog.alessiomorale.com/assets/fonts/ibm-plex-sans-400-700.woff2" as="font" type="font/woff2" crossorigin>


	<!-- Search Engine Optimization -->
	<meta name="description" content="Robotics, drones, electronics and software engineering, built and documented by Alessio Morale.">
	<meta name="google-site-verification" content="">
	<meta name="msvalidate.01" content="" >
	
	
	
	<link rel="canonical" href="https://blog.alessiomorale.com/assets/xslt/atom.xslt">

	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="0">
	
	<!-- Facebook Open Graph -->
	<meta property="og:title" content="Atom Feed (Styled)">
	<meta property="og:description" content="Robotics, drones, electronics and software engineering, built and documented by Alessio Morale.">
	<meta property="og:url" content="https://blog.alessiomorale.com/assets/xslt/atom.xslt">
	<meta property="og:locale" content="en_EN">
	<meta property="og:type" content="website">
	<meta property="og:site_name" content="Slamming Works">
	
	<meta property="article:author" content="https://www.facebook.com/alessiomorale">


	
	<!-- Twitter -->
	<meta name="twitter:card" content="summary">
	<meta name="twitter:site" content="alessiomorale">
	<meta name="twitter:creator" content="alessiomorale">
	<meta name="twitter:title" content="Atom Feed (Styled)">
	<meta name="twitter:description" content="Robotics, drones, electronics and software engineering, built and documented by Alessio Morale.">
	
	

	<link type="text/plain" rel="author" href="https://blog.alessiomorale.com/humans.txt">

	

	<link rel="icon" sizes="32x32" href="https://blog.alessiomorale.com/assets/img/favicon.ico">

	

	

	

	

	

	

	

	

	

	

	


	


		]]></xsl:text>
	</head>
	<body id="top-of-page">
		<xsl:text disable-output-escaping="yes"><![CDATA[
		
<header id="navigation">
  <nav class="site-nav" aria-label="Primary">
    <a class="brand-link" href="/" aria-label="Slamming Works home">
      <img class="brand-lockup" src="/slamming-works-logo/slw-lockup.svg" alt="Slamming Works">
    </a>
    <a class="nav-byline" href="/info/">by Alessio Morale</a>
    <button class="nav-toggle" type="button" aria-controls="primary-navigation" aria-expanded="false">Menu</button>
    <ul id="primary-navigation" class="nav-list">
      
        
        
        <li class="nav-item">
          <a href="/projects/">Projects</a>
        </li>
      
        
        
        <li class="nav-item">
          <a href="/blog/">Articles</a>
        </li>
      
        
        
        <li class="nav-item nav-item-right">
          <a href="/info/">About</a>
        </li>
      
        
        
        <li class="nav-item nav-item-right">
          <a href="https://github.com/AlessioMorale/alessiomorale.github.io" rel="noopener noreferrer">Source</a>
        </li>
      
    </ul>
  </nav>
</header>

		

<div id="masthead-no-image-header">
	<div class="row">
		<div class="small-12 columns">
			<a id="logo" href="https://blog.alessiomorale.com/" title="Slamming Works">
				<img src="/slamming-works-logo/slw-lockup.svg" alt="Slamming Works">
			</a>
		</div><!-- /.small-12.columns -->
	</div><!-- /.row -->
</div><!-- /#masthead -->








		


<div class="alert-box warning text-center"><p>This <a href="https://en.wikipedia.org/wiki/RSS" target="_blank">Atom feed</a> is meant to be used by <a href="https://en.wikipedia.org/wiki/Template:Aggregators" target="_blank">RSS reader applications and websites</a>.</p>
</div>



		]]></xsl:text>
		<header class="t30 row">
	<p class="subheadline"><xsl:value-of select="atom:subtitle" disable-output-escaping="yes" /></p>
	<h1>
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="atom:id" />
			</xsl:attribute>
			<xsl:value-of select="atom:title" />
		</xsl:element>
	</h1>
</header>
<ul class="accordion row" data-accordion="">
	<xsl:for-each select="atom:entry">
		<li class="accordion-navigation">
			<xsl:variable name="slug-id">
				<xsl:call-template name="slugify">
					<xsl:with-param name="text" select="atom:id" />
				</xsl:call-template>
			</xsl:variable>
			<xsl:element name="a">
				<xsl:attribute name="href"><xsl:value-of select="concat('#', $slug-id)"/></xsl:attribute>
				<xsl:value-of select="atom:title"/>
				<br/>
				<small><xsl:value-of select="atom:updated"/></small>
			</xsl:element>
			<xsl:element name="div">
				<xsl:attribute name="id"><xsl:value-of select="$slug-id"/></xsl:attribute>
				<xsl:attribute name="class">content</xsl:attribute>
				<h1>
					<xsl:element name="a">
						<xsl:attribute name="href"><xsl:value-of select="atom:id"/></xsl:attribute>
						<xsl:value-of select="atom:title"/>
					</xsl:element>
				</h1>
				<xsl:value-of select="atom:content" disable-output-escaping="yes" />
			</xsl:element>
		</li>
	</xsl:for-each>
</ul>

		<xsl:text disable-output-escaping="yes"><![CDATA[
		    <div id="up-to-top" class="row">
      <div class="small-12 columns" style="text-align: right;">
        <a class="to-top" href="#top-of-page">Back to top</a>
      </div><!-- /.small-12.columns -->
    </div><!-- /.row -->


    <footer id="footer-content" class="bg-grau">
      <div id="footer">
        <div class="row">
          <div class="medium-6 large-5 columns">
            <h5 class="shadow-black">About this site</h5>

            <p class="shadow-black">
              Robotics, drones, electronics and software engineering, built and documented by Alessio Morale.
              <a href="https://blog.alessiomorale.com/info/">More ›</a>
            </p>
          </div><!-- /.large-6.columns -->


          <div class="small-6 medium-3 large-3 large-offset-1 columns">
            
              
                <h5 class="shadow-black">Services</h5>
              
            
              
            
              
            
              
            
              
            

              <ul class="no-bullet shadow-black">
              
                
                  <li >
                    <a href="https://blog.alessiomorale.com"  title=""></a>
                  </li>
              
                
                  <li >
                    <a href="https://blog.alessiomorale.com/info/"  title="Info">Info</a>
                  </li>
              
                
                  <li >
                    <a href="https://blog.alessiomorale.com/feed.xml"  title="Subscribe to RSS Feed">RSS</a>
                  </li>
              
                
                  <li >
                    <a href="https://blog.alessiomorale.com/atom.xml"  title="Subscribe to Atom Feed">Atom</a>
                  </li>
              
                
                  <li >
                    <a href="https://blog.alessiomorale.com/sitemap.xml"  title="Sitemap for Google Webmaster Tools">sitemap.xml</a>
                  </li>
              
              </ul>
          </div><!-- /.large-4.columns -->


          <div class="small-6 medium-3 large-3 columns">
            

            <ul class="no-bullet shadow-black">
            
            </ul>
          </div><!-- /.large-3.columns -->
        </div><!-- /.row -->

      </div><!-- /#footer -->


      <div id="subfooter">
        <nav class="row">
          <section id="subfooter-left" class="small-12 medium-6 columns credits">
            <p>Created by <a href="https://alessiomorale.com/">Alessio Morale</a> with <a href="http://jekyllrb.com/" target="_blank">Jekyll</a> based on <a href="http://phlow.github.io/feeling-responsive/">Feeling Responsive</a>.</p>
          </section>

          <section id="subfooter-right" class="small-12 medium-6 columns">
            
<ul class="social-links" aria-label="Profiles">

    <li><a href="https://github.com/alessiomorale" target="_blank" rel="noopener noreferrer">GitHub</a></li>

    <li><a href="https://www.youtube.com/@alessiomorale" target="_blank" rel="noopener noreferrer">YouTube</a></li>

    <li><a href="https://twitter.com/alessiomorale" target="_blank" rel="noopener noreferrer">Twitter</a></li>

    <li><a href="https://www.linkedin.com/in/alessiomorale" target="_blank" rel="noopener noreferrer">linkedin</a></li>

</ul>

          </section>
        </nav>
      </div><!-- /#subfooter -->
    </footer>

		<script src="https://blog.alessiomorale.com/assets/js/site.js" defer></script>




		]]></xsl:text>
	</body>
	</html>
</xsl:template>
<xsl:template name="slugify">
	<xsl:param name="text" select="''" />
	<xsl:variable name="dodgyChars" select="' ,.#_-!?*:;=+|&amp;/\\'" />
	<xsl:variable name="replacementChar" select="'-----------------'" />
	<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
	<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
	<xsl:variable name="lowercased"><xsl:value-of select="translate( $text, $uppercase, $lowercase )" /></xsl:variable>
	<xsl:variable name="escaped"><xsl:value-of select="translate( $lowercased, $dodgyChars, $replacementChar )" /></xsl:variable>
	<xsl:value-of select="$escaped" />
</xsl:template>
</xsl:stylesheet>
