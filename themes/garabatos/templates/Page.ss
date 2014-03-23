<!doctype html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<% base_tag %>
		<title>Garabatos</title>

		<meta name="description" content="A framework for easily creating beautiful presentations using HTML">
		<meta name="author" content="KINK Creative">

		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />

		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<link rel="stylesheet" href="js/foundation/css/foundation.css" />
		<link rel="stylesheet" href="js/reveal.js/css/reveal.min.css">
		<link rel="stylesheet" href="$ThemeDir/css/style.css" id="theme">

		<link rel="stylesheet" href="js/fontello/css/fontello.css">
    	<link rel="stylesheet" href="js/fontello/css/animation.css">

		<!-- For syntax highlighting -->
		<!-- <link rel="stylesheet" href="js/reveal.js/lib/css/zenburn.css"> -->

		<script src="js/vendor/modernizr.js"></script>

		<!-- If the query includes 'print-pdf', include the PDF print sheet -->
		<script>
			if( window.location.search.match( /print-pdf/gi ) ) {
				var link = document.createElement( 'link' );
				link.rel = 'stylesheet';
				link.type = 'text/css';
				link.href = 'css/print/pdf.css';
				document.getElementsByTagName( 'head' )[0].appendChild( link );
			}
		</script>

		<!--[if lt IE 9]>
		<script src="js/reveal.js/lib/js/html5shiv.js"></script>
		<![endif]-->
	</head>

	<body>
		
		<a href="#" class="logoWrap"><img src="$ThemeDir/images/Garabatos-Logo.png" class="logo" /></a>

		<div class="nav cart-nav">
			<i class="icon-basket-alt"></i></a> <a class="simpleCart_total orange" href="#/cart" ></a> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> items<a href="javascript:;" class="simpleCart_empty orange" title="Empty trash"><i class="icon-trash"></i> </a>)
		</div>

		<ul class="nav side-nav">
			<li><a href="#">Home</a></li>
			<li><a href="#/collections">Collections</a>
			<% if Collections %>
			<ul class="submenu">
				<% loop Collections %>
				<li><a href="#/$URLSegment">$Title</a></li>
				<% end_loop %>
			</ul>
			<% end_if %>
			</li>
			<li><a href="#/order">How to order</a></li>
			<li><a href="#/contact">Contact</a></li>
			<li><a href="#/cart">Cart</a></li>
		</ul>

		<div class="reveal">

			<!-- Any section element inside of this container is displayed as a slide -->
			<div class="slides">
				
				$Layout

			</div>

		</div>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="js/foundation/js/foundation.min.js"></script>
		<script src="js/reveal.js/lib/js/head.min.js"></script>
		<script src="js/reveal.js/js/reveal.min.js"></script>
		<script src="js/simplecart-js/simpleCart.min.js"></script>

		<script>

			$(document).foundation();

			simpleCart({
			    checkout: {
			      type: "PayPal",
			      email: "info@kinkcreative.com"
			    },
			    cartStyle: "table"
			  });

			// Full list of configuration options available here:
			// https://github.com/hakimel/reveal.js#configuration
			Reveal.initialize({
				controls: true,
				progress: true,
				history: true,
				center: true,

				theme: Reveal.getQueryHash().theme, // available themes are in /css/theme
				transition: Reveal.getQueryHash().transition || 'default', // default/cube/page/concave/zoom/linear/fade/none

				// Parallax scrolling
				//parallaxBackgroundImage: 'https://s3.amazonaws.com/hakim-static/reveal-js/reveal-parallax-1.jpg',
				//parallaxBackgroundSize: '2100px 900px',

				// Optional libraries used to extend on reveal.js
				dependencies: [
					{ src: 'js/reveal.js/lib/js/classList.js', condition: function() { return !document.body.classList; } },
					{ src: 'js/reveal.js/plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
					{ src: 'js/reveal.js/plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
					{ src: 'js/reveal.js/plugin/highlight/highlight.js', async: true, callback: function() { hljs.initHighlightingOnLoad(); } },
					{ src: 'js/reveal.js/plugin/zoom-js/zoom.js', async: true, condition: function() { return !!document.body.classList; } },
					{ src: 'js/reveal.js/plugin/notes/notes.js', async: true, condition: function() { return !!document.body.classList; } }
				]
			});

			/* window.addEventListener("mousedown", handleClick, false);
			window.addEventListener("contextmenu", function(e) { e.preventDefault(); }, false);
			 
			function handleClick(e) {
				e.preventDefault();
				if(e.button === 0) Reveal.next(); 
				if(e.button === 2) Reveal.prev(); 
			} */

			var dd = false;
			$(".dropdownClick").click(function(e) {
				//e.preventDefault();
				dd = true;
			});

			$(".addClick").click(function() {
				if(!dd) {
					addItem($(this));
				}
				else {
					dd=false;
				}
			});
			$(".addItem").click(function() {
				addItem($(this));
			});

			function addItem(element) {
				title = element.data("title") + " - " + element.data("variation");
				sku = element.data("sku");
				price = element.data("price");
				quantity = element.closest(".cartItem-wrapper").find(".itemQuantity").val();
				simpleCart.add({ 
				    name: title,
				    price: price,
				    sku: sku ,
				    quantity: quantity
				});
			}

		</script>

		<!-- <aside class="mycontrols">
			<div class="navigate-up"><i class="icon-up-open"></i></div>
			<div class="navigate-right"><i class="icon-right-open"></i></div>
			<div class="navigate-down"><i class="icon-down-open"></i></div>
			<div class="navigate-left"><i class="icon-left-open"></i></div>
		</aside> -->

	</body>
</html>
