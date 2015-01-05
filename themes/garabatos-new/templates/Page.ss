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
	<%--See [Requirements](http://doc.silverstripe.org/framework/en/reference/requirements) for loading from controller--%>
	<link rel="stylesheet" href="js/fontello/css/fontello.css">
	<link rel="stylesheet" href="$ThemeDir/css/style.css" />
</head>
<body class="$ClassName.ATT $URLSegment">

	<header class="header" role="banner">
		<div class="fixed contain-to-grid">
			<% include TopBar %>
		</div>
	</header>

	$Layout

	<footer class="footer" role="contentinfo">
		<div class="row">
			<div class="large-12 columns">
				<p>&copy; $Now.Year $SiteConfig.Title <span class="divider"></span> Made with <i class="icon-heart orange"></i> in <strong>LA</strong> <span class="divider"></span> <a href="#" data-reveal-id="license-modal">License</a>
			</p>

			</div>
		</div>
	</footer>


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

	<script src="$ThemeDir/js/min/app.min.js"></script>
</body>
</html>
