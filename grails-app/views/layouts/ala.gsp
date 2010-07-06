<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US">

<head profile="http://gmpg.org/xfn/11">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

  <title><g:layoutTitle/></title>

  <link rel="stylesheet" href="http://test.ala.org.au/wp-content/themes/ala/style.css" type="text/css" media="screen" />
  <link rel="icon" type="image/x-icon" href="http://test.ala.org.au/wp-content/themes/ala/images/favicon.ico" />
  <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon">

  <link rel="stylesheet" type="text/css" media="screen" href="http://test.ala.org.au/wp-content/themes/ala/css/sf.css" />
  <link rel="stylesheet" type="text/css" media="screen" href="http://test.ala.org.au/wp-content/themes/ala/css/superfish.css" />
  <link rel="stylesheet" type="text/css" media="screen" href="http://test.ala.org.au/wp-content/themes/ala/css/skin.css" />
  <link rel="stylesheet" href="${resource(dir:'css',file:'public.css')}" />

  <script language="JavaScript" type="text/javascript" src="http://test.ala.org.au/wp-content/themes/ala/scripts/form.js"></script>
  <script language="JavaScript" type="text/javascript" src="http://test.ala.org.au/wp-content/themes/ala/scripts/jquery-1.4.2.min.js"></script>
  <script language="JavaScript" type="text/javascript" src="http://test.ala.org.au/wp-content/themes/ala/scripts/ui.core.js"></script>
  <script language="JavaScript" type="text/javascript" src="http://test.ala.org.au/wp-content/themes/ala/scripts/ui.tabs.js"></script>
  <script language="JavaScript" type="text/javascript" src="http://test.ala.org.au/wp-content/themes/ala/scripts/hoverintent-min.js"></script>
  <script language="JavaScript" type="text/javascript" src="http://test.ala.org.au/wp-content/themes/ala/scripts/superfish/superfish.js"></script>
  <script language="JavaScript" type="text/javascript" src="http://test.ala.org.au/wp-content/themes/ala/scripts/jquery.jcarousel.min.js"></script>
  <script type="text/javascript">

		// initialise plugins
		jQuery(function(){
			jQuery('ul.sf').superfish( {
				delay:500,
				autoArrows:false,
				dropShadows:false
			});
		});

	</script>
	<script type="text/javascript">

		function mycarousel_initCallback(carousel)
		{
			jQuery('.jcarousel-control a').bind('click', function() {
				carousel.scroll(jQuery.jcarousel.intval(jQuery(this).text()));
				carousel.startAuto(0);
				return false;
			});
			// Disable autoscrolling if the user clicks the prev or next button.
			carousel.buttonNext.bind('click', function() {
				carousel.startAuto(0);
			});

			carousel.buttonPrev.bind('click', function() {
				carousel.startAuto(0);
			});

			// Pause autoscrolling if the user moves with the cursor over the clip.
			carousel.clip.hover(function() {
				carousel.stopAuto();
			}, function() {
				carousel.startAuto();
			});
		};

	</script>
<meta name='robots' content='noindex,nofollow' />
<link rel="alternate" type="application/rss+xml" title="Atlas Living Australia NG &raquo; Feed" href="http://test.ala.org.au/?feed=rss2" />
<link rel="alternate" type="application/rss+xml" title="Atlas Living Australia NG &raquo; Comments Feed" href="http://test.ala.org.au/?feed=comments-rss2" />
<link rel="alternate" type="application/rss+xml" title="Atlas Living Australia NG &raquo; Institution Placeholder Comments Feed" href="http://test.ala.org.au/?feed=rss2&amp;page_id=371" />
<link rel='stylesheet' id='external-links-css'  href='http://test.ala.org.au/wp-content/plugins/sem-external-links/sem-external-links.css?ver=20090903' type='text/css' media='all' />
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="http://test.ala.org.au/xmlrpc.php?rsd" />
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="http://test.ala.org.au/wp-includes/wlwmanifest.xml" />
<link rel='index' title='Atlas Living Australia NG' href='http://test.ala.org.au' />
<link rel='up' title='Natural History Collections' href='http://test.ala.org.au/?page_id=16' />
<link rel='prev' title='Conserving Shorebird Breeding Sites' href='http://test.ala.org.au/?page_id=320' />
<link rel='next' title='Collection Overview Page' href='http://test.ala.org.au/?page_id=379' />
<meta name="generator" content="WordPress 3.0" />
<link rel='canonical' href='http://test.ala.org.au/?page_id=371' />
  <g:layoutHead />
  <g:javascript library="application" />
  <g:javascript library="collectory" />
  <script type="text/javascript" src="http://openlayers.org/api/OpenLayers.js"></script>
  <script type="text/javascript" src='http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAJdniJYdyzT6MyTJB-El-5RQumuBjAh1ZwCPSMCeiY49-PS8MIhSVhrLc20UWCGPHYqmLuvaS_b_FaQ'></script>
  <!--ABQIAAAA9XNhd8q0UdwNC7YSO4YZghSPUCi5aRYVveCcVYxzezM4iaj_gxQ9t-UajFL70jfcpquH5l1IJ-Zyyw-->

</head>
<!-- WP Menubar 4.7: start CSS -->
<!-- WP Menubar 4.7: end CSS -->
<body onload="initialize()" id="page-collections-map" class="page page-template page-template-default two-column-right">
<div id="wrapper">
	<div id="banner">
		<div id="logo">
			<a  href="http://test.ala.org.au" title="Atlas of Living Australia home"><img src="http://test.ala.org.au/wp-content/themes/ala/images/ala_logo.png" width="176" height="165" alt="Atlas of Living Ausralia logo" /></a>
		</div><!--close logo-->
		<div id="nav">
			<!-- WP Menubar 4.7: start menu nav-site, template Superfish, CSS  -->


<ul class="sf"><li><a  href="http://test.ala.org.au/" id="nav-home"><span>Home</span></a></li><li><a  href="http://test.ala.org.au/?page_id=2" id="nav-about"><span>About the Atlas</span></a><ul><li><a  href="http://test.ala.org.au/?page_id=434"><span>Photo credits</span></a></li><li><a  href="http://test.ala.org.au/?page_id=10"><span>What is the Atlas?</span></a></li><li><a  href="http://test.ala.org.au/?page_id=12"><span>Project Time Line</span></a></li><li><a  href="http://test.ala.org.au/?page_id=14"><span>Partners</span></a></li><li><a  href="http://test.ala.org.au/?page_id=16"><span>Natural History Collections</span></a></li><li><a  href="http://test.ala.org.au/?page_id=18"><span>Contributors</span></a></li><li><a  href="http://test.ala.org.au/?page_id=22"><span>Atlas Team</span></a></li><li><a  href="http://test.ala.org.au/?page_id=24"><span>Media Centre</span></a></li><li><a  href="http://test.ala.org.au/?page_id=26"><span>Atlas Documents</span></a></li></ul></li><li><a  href="http://test.ala.org.au/?page_id=36" id="nav-tools"><span>Tools &amp; Services</span></a><ul><li><a  href="http://test.ala.org.au/?page_id=269"><span>Search</span></a></li><li><a  href="http://test.ala.org.au/?page_id=60"><span>Themes/Highlights</span></a></li><li><a  href="http://test.ala.org.au/?page_id=37"><span>Community Science</span></a></li><li><a  href="http://test.ala.org.au/?page_id=43"><span>Identification Tools</span></a></li><li><a  href="http://test.ala.org.au/?page_id=51"><span>Maps</span></a></li><li><a  href="http://test.ala.org.au/?page_id=72"><span>For Developers</span></a></li></ul></li><li><a  href="http://test.ala.org.au/?page_id=74" id="nav-contact"><span>Contact Us</span></a><ul><li><a  href="http://test.ala.org.au/?page_id=75"><span>Contact Our Team</span></a></li><li><a  href="http://test.ala.org.au/?page_id=77"><span>Contribute Data &amp; Images</span></a></li></ul></li><li><a  href="http://test.ala.org.au/?page_id=81" id="nav-support"><span>Support</span></a><ul><li><a  href="http://test.ala.org.au/?page_id=83"><span>Get Started</span></a></li><li><a  href="http://test.ala.org.au/?page_id=85"><span>Forum</span></a></li><li><a  href="http://test.ala.org.au/?page_id=87"><span>Frequently Asked Questions</span></a></li><li><a  href="http://test.ala.org.au/?page_id=89"><span>Help</span></a></li></ul></li><li class="nav-right"><a  id="nav-signin" href="/#" title=""><span>Sign In</span></a> <ul class="sign-in"> <li> <form method="post" id="sign-in" action=""> <input id="authenticity_token" name="authenticity_token" type="hidden" value="" /> <input id="return_to_ssl" name="return_to_ssl" type="hidden" value="false" /> <p><label for="username">Username or e-mail</label> <input type="text" class="filled" id="username" name="session[username_or_email]" value="" title="username" tabindex="4"/></p> <p><label for="password">Password</label> <input type="password" class="filled" id="password" name="session[password]" value="" title="password" tabindex="5"/></p> <p><input type="submit" id="signin_submit" value="Sign in" tabindex="7"/></p> <p class="remember-me"><input type="checkbox" id="remember" name="remember_me" value="1" tabindex="6"/> <label for="remember">Remember me</label></p> <p><a  href="/account/resend_password" id="resend_password_link">Forgot password?</a><a href="" id="forgot_username_link" title="If you remember your password, try logging in with your email">Forgot username?</a></p> </form> </li> </ul> </li><li class="nav-right"><a  href="http://test.ala.org.au/?page_id=95" id="nav-register"><span>Register</span></a></li></ul>

<!-- WP Menubar 4.7: end menu nav-site, template Superfish, CSS  -->
		</div><!--close nav-->
		<div id="border_search">
		<div id="wrapper_search">
			<form id="search-form" action="http://alaslvweb2-cbr.vm.csiro.au:8080/bie-webapp/species/search" method="get" name="search-form">
				<label for="search">Search</label>
				<input type="text" class="filled" id="search" name="q" value="Search the Atlas" />
			</form>
		</div>
		</div><!--close wrapper_search-->
	</div><!--close banner-->
	<div id="wrapper_border"><!--main content area-->
		<div id="border">

        <g:layoutBody />


		</div><!--close border-->
	</div><!--close wrapper_border-->
	<div id="nav-footer">
		<ul>
			<!--About the Atlas-->
			<li>About the Atlas			<ul>
			<li class="page_item page-item-434"><a  href="http://test.ala.org.au/?page_id=434" title="Photo credits">Photo credits</a></li>
<li class="page_item page-item-10"><a  href="http://test.ala.org.au/?page_id=10" title="What is the Atlas?">What is the Atlas?</a></li>
<li class="page_item page-item-12"><a  href="http://test.ala.org.au/?page_id=12" title="Project Time Line">Project Time Line</a></li>
<li class="page_item page-item-14"><a  href="http://test.ala.org.au/?page_id=14" title="Partners">Partners</a></li>
<li class="page_item page-item-16 current_page_ancestor current_page_parent"><a  href="http://test.ala.org.au/?page_id=16" title="Natural History Collections">Natural History Collections</a></li>
<li class="page_item page-item-18"><a  href="http://test.ala.org.au/?page_id=18" title="Contributors">Contributors</a></li>
<li class="page_item page-item-22"><a  href="http://test.ala.org.au/?page_id=22" title="Atlas Team">Atlas Team</a></li>
<li class="page_item page-item-24"><a  href="http://test.ala.org.au/?page_id=24" title="Media Centre">Media Centre</a></li>
<li class="page_item page-item-26"><a  href="http://test.ala.org.au/?page_id=26" title="Atlas Documents">Atlas Documents</a></li>
			</ul>
			</li>
		</ul>
		<ul>
			<!--Tools & Services-->
			<li>Tools &#038; Services			<ul>
			<li class="page_item page-item-60"><a  href="http://test.ala.org.au/?page_id=60" title="Themes/Highlights">Themes/Highlights</a></li>
<li class="page_item page-item-269"><a  href="http://test.ala.org.au/?page_id=269" title="Search">Search</a></li>
<li class="page_item page-item-37"><a  href="http://test.ala.org.au/?page_id=37" title="Community Science">Community Science</a></li>
<li class="page_item page-item-43"><a  href="http://test.ala.org.au/?page_id=43" title="Identification Tools">Identification Tools</a></li>
<li class="page_item page-item-51"><a  href="http://test.ala.org.au/?page_id=51" title="Maps">Maps</a></li>
<li class="page_item page-item-72"><a  href="http://test.ala.org.au/?page_id=72" title="For Developers">For Developers</a></li>
			</ul>
			</li>
		</ul>
		<ul>
			<!--Contact Us-->
			<li>Contact Us			<ul>
			<li class="page_item page-item-75"><a  href="http://test.ala.org.au/?page_id=75" title="Contact Our Team">Contact Our Team</a></li>
<li class="page_item page-item-77"><a  href="http://test.ala.org.au/?page_id=77" title="Contribute Data &amp; Images">Contribute Data &amp; Images</a></li>
			</ul>
			</li>
		</ul>
		<ul>
			<!--Support-->
			<li>Support			<ul>
			<li class="page_item page-item-83"><a  href="http://test.ala.org.au/?page_id=83" title="Get Started">Get Started</a></li>
<li class="page_item page-item-85"><a  href="http://test.ala.org.au/?page_id=85" title="Forum">Forum</a></li>
<li class="page_item page-item-87"><a  href="http://test.ala.org.au/?page_id=87" title="Frequently Asked Questions">Frequently Asked Questions</a></li>
<li class="page_item page-item-89"><a  href="http://test.ala.org.au/?page_id=89" title="Help">Help</a></li>
			</ul>
			</li>
		</ul>
		<ul class="no-parent">
									<li class="page_item page-item-91"><a  href="http://test.ala.org.au/?page_id=91" title="Privacy Policy">Privacy Policy</a></li>
<li class="page_item page-item-92"><a  href="http://test.ala.org.au/?page_id=92" title="Terms of Use">Terms of Use</a></li>
<li class="page_item page-item-93"><a  href="http://test.ala.org.au/?page_id=93" title="Citing the Atlas">Citing the Atlas</a></li>
<li class="page_item page-item-94"><a  href="http://test.ala.org.au/?page_id=94" title="Disclaimer">Disclaimer</a></li>
		</ul>
	</div><!--close nav-footer-->
	<div id="footer">
		<p><a  href="http://creativecommons.org/licenses/by/2.5/au/" title="External link to Creative Commons" class="left no-pipe external"><img src="http://test.ala.org.au/wp-content/themes/ala/images/somerights20.png" width="88" height="31" alt="" /></a>This work is licensed under a <a  href="http://creativecommons.org/licenses/by/2.5/au/" title="External link to Creative Commons" class="external external_icon">Creative Commons Attribution 2.5 Australia License</a></p><ul><li class="page_item page-item-91"><a  href="http://test.ala.org.au/?page_id=91" title="Privacy Policy">Privacy Policy</a></li>
<li class="page_item page-item-92"><a  href="http://test.ala.org.au/?page_id=92" title="Terms of Use">Terms of Use</a></li>
<li class="page_item page-item-93"><a  href="http://test.ala.org.au/?page_id=93" title="Citing the Atlas">Citing the Atlas</a></li>
<li class="page_item page-item-94"><a  href="http://test.ala.org.au/?page_id=94" title="Disclaimer">Disclaimer</a></li>
</ul>
	</div><!--close footer-->
	</div><!--close wrapper-->
</body>
</html>