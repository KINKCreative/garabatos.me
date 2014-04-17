<section id="home">
	<img src="$ThemeDir/images/Garabatos-Logo.png" alt="Garabatos" class="mainlogo" />
	<p>Sketch designs with an essence.</p>
	<p class="smaller">Use your arrow keys to navigate. Swipe left-right and up-down on mobile.<!-- <br/>At any time, press the <span class="label radius">ESC<span> key to jump to the cart.--> </p>
	$Form
	<p class="footer">
		<small>Made with <i class="icon-heart"></i> in <strong>LA</strong></small>
	</p>
</section>

<section id="about">
	<h2>About Garabatos</h2>
	<p>
		<span class="garabatos">Garabatos</span> is a collection beautiful gifts.
	</p>

	<aside class="notes">
		Oh hey, these are some notes. They'll be hidden in your presentation, but you can see them if you open the speaker notes window (hit 's' on your keyboard).
	</aside>
</section>

<!-- Example of nested vertical slides  data-background="#333333" -->
<% loop Collections %>
<section id="$URLSegment" >
	<% loop Products %>
	<% include ShelfItem %>
	<% end_loop %>
</section>
<% end_loop %>

<section id="order">
	<h2>How to order</h2>
	<p>
		<h4>We love you</h4>
		<p>Order information here. Pick whatever you want. We ship it.</p>
		<h4>Questions?</h4>
		<p>Shoot us an email at<br/><a href="mailto:info@garabatos.me">info@garabatos.me</a></p>
	</p>
</section>

<section id="contact">
	<h2>How to contact us</h2>
	<p>Call us at<br/><strong><a href="tel:2133949559">(213) 394-9559</a></strong></p>
	<p>Shoot us an email at<br/><a href="mailto:info@garabatos.me">info@garabatos.me</a></p>
</section>

<section id="cart">
	<div class="cartwrap">
		<div class="row">
			<div class="medium-10 medium-centered small-12 columns">
				<h2>Your cart</h2>
				<div class="simpleCart_items" ></div>

				<br />
				SubTotal: <span id="simpleCart_total" class="simpleCart_total"></span> <br />
				<!-- Tax Rate: <span id="simpleCart_taxRate" class="simpleCart_taxRate"></span><br />
				Tax: <input type="checkbox" name="tax_checkbox" class="checkbox" value="10"> Check if you reside in California
				<span id="simpleCart_tax" class="simpleCart_tax" style="display:none;"></span> <br /> -->
				Shipping: <span id="simpleCart_shipping" class="simpleCart_shipping"></span><br/>
				Final Total: <span id="simpleCart_grandTotal" class="simpleCart_grandTotal"></span> <br />

				<a href="javascript:;" class="simpleCart_checkout button round">checkout</a>	
				
				<div id="test_id"></div>
			</div>
		</div>
	</div>

</section>