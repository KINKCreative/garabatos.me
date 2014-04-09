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

		<script src="js/foundation/js/vendor/modernizr.js"></script>

		<!--[if lt IE 9]>
		<script src="js/reveal.js/lib/js/html5shiv.js"></script>
		<![endif]-->
	</head>

	<body>
		
<div class="off-canvas-wrap" data-offcanvas>
<div class="inner-wrap">

    <a class="show-for-small-only left-off-canvas-toggle" href="#" ><i class="icon-right-open"></i></a>

    <!-- Off Canvas Menu -->
    <aside class="left-off-canvas-menu">
        <!-- whatever you want goes here -->
        <ul class="side-nav">
          <li><a href="#">Item 1</a></li>
        ...
        </ul>
    </aside>


		<a href="#" class="logoWrap"><img src="$ThemeDir/images/Garabatos-Logo.png" class="logo" /></a>

		<div class="nav cart-nav">
			<i class="icon-basket-alt"></i></a> <a class="simpleCart_total orange" href="#/cart" ></a> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> items<a href="javascript:;" class="simpleCart_empty orange" title="Empty trash"><i class="icon-trash"></i> </a>)
		</div>

		<ul class="nav side-nav hide-for-small">
			<li><a href="#">Home</a></li>
			<li><a href="javascript:;" class="collections_dropdown">Collections <i class="icon icon-angle-down"></i></a>
				<ul class="collections_submenu submenu" style="display:none;">
					<% loop Collections %>
					<li><a href="#/$URLSegment">$Title</a></li>
					<% end_loop %>
				</ul>
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

	<a class="exit-off-canvas"></a>

</div>
</div>

		<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
		<!-- <script src="js/foundation/js/foundation.min.js"></script>
		<script src="js/reveal.js/lib/js/head.min.js"></script>
		<script src="js/reveal.js/js/reveal.min.js"></script>
		<script src="js/simplecart-js/simpleCart.min.js"></script> -->
		<script src="js/src/application.min.js"></script>

		<!-- <aside class="mycontrols">
			<div class="navigate-up"><i class="icon-up-open"></i></div>
			<div class="navigate-right"><i class="icon-right-open"></i></div>
			<div class="navigate-down"><i class="icon-down-open"></i></div>
			<div class="navigate-left"><i class="icon-left-open"></i></div>
		</aside> -->

	</body>
</html>
