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
	<% with Page(about) %>
		<h2>$Title</h2>
		$Content
	<% end_with %>
</section>

<!-- Example of nested vertical slides  data-background="#333333" -->
<% loop Collections %>
<section id="$URLSegment" >
	<% loop Products %>
	<% include ShelfItem %>
	<% end_loop %>
</section>
<% end_loop %>

<section id="contact">
	<% with Page(contact) %>
		<h2>$Title</h2>
		$Content
	<% end_with %>
</section>

<section id="cart">
	<div class="cartwrap">
		<div class="row">
			<div class="medium-8 medium-centered small-12 columns">
				<h2>Your cart</h2>
				<div class="simpleCart_items" ></div>

				<br />
				<div class="cart-totals">
					SubTotal: <span id="simpleCart_total" class="simpleCart_total"></span> <br />
					<!-- Tax Rate: <span id="simpleCart_taxRate" class="simpleCart_taxRate"></span><br />
					Tax: <input type="checkbox" name="tax_checkbox" class="checkbox" value="10"> Check if you reside in California
					<span id="simpleCart_tax" class="simpleCart_tax" style="display:none;"></span> <br /> -->
					Shipping: <span id="simpleCart_shipping" class="simpleCart_shipping"></span><br/>
					Final Total: <span id="simpleCart_grandTotal" class="simpleCart_grandTotal"></span> <br />

					<a href="javascript:;" class="simpleCart_checkout button round">checkout</a>	
				</div>
			</div>
		</div>
	</div>

</section>