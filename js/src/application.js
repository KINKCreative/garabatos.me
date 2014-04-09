/*global $:false */

$(document).foundation();
jQuery.noConflict();

jQuery(function($){

	simpleCart({
	    checkout: {
	      type: "PayPal",
	      email: "info@kinkcreative.com"
	    },
	    cartStyle: "table",
	    shippingCustom: function(){ 
	    	return 5 + simpleCart.quantity()*2;
	    }
	  });

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
			// { src: 'js/reveal.js/lib/js/classList.js', condition: function() { return !document.body.classList; } },
			// { src: 'js/reveal.js/plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
			// { src: 'js/reveal.js/plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
			// { src: 'js/reveal.js/plugin/highlight/highlight.js', async: true, callback: function() { hljs.initHighlightingOnLoad(); } },
			{ src: 'js/reveal.js/plugin/zoom-js/zoom.js', async: true, condition: function() { return !!document.body.classList; } }
			// { src: 'js/reveal.js/plugin/notes/notes.js', async: true, condition: function() { return !!document.body.classList; } }
		]
	});

	Reveal.configure({
		keyboard: {
			27: function() { window.location.href("#/cart") }
		}
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

	$(".checkbox").change(function() {
		if($(this).prop("checked")==true) {
			simpleCart.data[taxRate] = 0.08;
			$(".simpleCart_tax").fadeIn();
		}
		else {
			simpleCart.data[taxRate] = 0;
			$(".simpleCart_tax").fadeOut();	
		}
	});

	$(".collections_dropdown").click(function() {

		$(".collections_submenu").slideToggle(500);
		$(this).find(".icon").toggleClass("icon-angle-down").toggleClass("icon-angle-up");
	});

});