<!doctype html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<% base_tag %>
		<title>Garabatos | $Title</title>

		<meta name="description" content="A framework for easily creating beautiful presentations using HTML">
		<meta name="author" content="KINK Creative">

		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />

		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<link rel="stylesheet" href="js/foundation/css/foundation.css" />
		<link rel="stylesheet" href="$ThemeDir/css/style.css" id="theme">

		<link rel="stylesheet" href="js/fontello/css/fontello.css">
    	<link rel="stylesheet" href="js/fontello/css/animation.css">

		<!-- For syntax highlighting -->
		<!-- <link rel="stylesheet" href="js/reveal.js/lib/css/zenburn.css"> -->

		<script src="js/foundation/js/vendor/modernizr.js"></script>
	
		<!--[if lt IE 9]>
		<script src="js/reveal.js/lib/js/html5shiv.js"></script>
		<![endif]-->
	</head>

	<body>


		<a href="#" class="logoWrap"><img src="$ThemeDir/images/Garabatos-Logo.png" class="logo" /></a>

		<h1>$Title</h1>
		$Content
		$Form

		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="js/foundation/js/foundation.min.js"></script>
		<script>
			$(document).foundation();
		</script>


	</body>
</html>