<!doctype html>
<html class="no-js" lang="$ContentLocale.ATT" dir="$i18nScriptDirection.ATT">
<head>
	<% base_tag %>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> - $SiteConfig.Title</title>
	<meta name="description" content="$MetaDescription.ATT" />
	<%--http://ogp.me/--%>
	<meta property="og:site_name" content="$SiteConfig.Title.ATT" />
	<meta property="og:type" content="website" />
	<meta property="og:title" content="$Title.ATT" />
	<meta property="og:description" content="$MetaDescription.ATT" />
	<meta property="og:url" content="$AbsoluteLink.ATT" />
	<% if $Image %>
	<meta property="og:image" content="<% with $Image.SetSize(500,500) %>$AbsoluteURL.ATT<% end_with %>" />
	<% end_if %>
	<link rel="icon" type="image/png" href="$ThemeDir/favicon.ico" />
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="$ThemeDir/css/style.css" />
</head>

<body class="$ClassName.ATT $URLSegment">
	<div class="off-canvas-wrap" data-offcanvas>
	  <div class="inner-wrap">

	    <a class="left-off-canvas-toggle hide-for-large-up button left" href="#" ><i class="fa fa-bars"></i></a>

	    <!-- Off Canvas Menu -->
	    <aside class="left-off-canvas-menu">
	    		<img src="$ThemeDir/images/Garabatos-Logo.png" class="logo-side" />
	        <!-- Off-Canvas Menu -->
	      	<% include Menu_Accordion %>
	    </aside>

	    <!-- main content goes here -->
	    <div class="row row-fluid">
				<div class="large-3 columns sidebar">

					<div class="row">
						<div class="small-3 large-12 columns">
							<a href="#">
								<img src="$ThemeDir/images/Garabatos-Logo-Dark.png" class="logo-side" />
							</a>
						</div>
						<div class="small-9 large-12 columns small-text-right">

							<div class="cart-tools medium-text-right large-text-center">
								<a href="cart"><i class="icon-basket-alt"></i><span class="simpleCart_total"></span> ( <span id="simpleCart_quantity" class="simpleCart_quantity"></span> items )</a>

								<a href="javascript:;" class="simpleCart_empty orange" title="Empty cart"><i class="fa fa-trash"></i></a>
							</div>
						</div>
					</div>

					<div class="show-for-large-up">
						<% include Menu_Accordion %>
					</div>

				</div><!-- end sidebar -->

				<div class="large-9 columns layout">
					$Layout
				</div>
			</div>

			<footer class="footer" role="contentinfo">
				<div class="row">
					<div class="large-12 columns text-center">
						<p>&copy; $Now.Year $SiteConfig.Title <span class="divider"></span> Made with <i class="fa fa-heart orange"></i> in <strong>LA</strong> <span class="divider"></span> <a href="#" data-reveal-id="license-modal">License</a>
					</p>

					</div>
				</div>
			</footer>

	  <!-- close the off-canvas menu -->
	  <a class="exit-off-canvas"></a>

	  </div>
	</div>

	<div id="license-modal" class="reveal-modal medium" data-reveal>
		<div class="license">
			<h3>License details</h3>
			<p class="license-details">
				The <span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/StillImage" rel="dct:type">work</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://garabatos.me" property="cc:attributionName" rel="cc:attributionURL" target="_blank">Garabatos</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/" target="_blank">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>
			</p>
			<p>
				<a rel="license" class="license-icon" href="http://creativecommons.org/licenses/by-nc-nd/4.0/" target="_blank"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a></span>
			</p>
		</div>
		<a class="close-reveal-modal">&#215;</a>
	</div>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="$ThemeDir/js/min/app.min.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>
</html>
