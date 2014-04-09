<section id="$URLSegment">
	<h4>$Collection.Title</h4>
	
	<div class="cartItem-wrapper">
		<div class="row">
			<div class="large-12 columns details">
				$Image.SetWidth(700)
				<div class="row">
					<div class="medium-6 columns text-left">
						<h3>$Title</h3>
					</div>
					<div class="medium-6 columns text-right">
						Qty. <input type="text" class="itemQuantity" value="1" maxlength="2" />
						<a class="button round primary" data-dropdown="drop-{$ID}" class="dropdownClick">Add to Cart <i class="icon-angle-up"></i></a>
							<% if ProductVariations %>
								<ul id="drop-{$ID}" class="f-dropdown dropup radius" data-dropdown-content>
									<% loop ProductVariations %>
									  <li class="simpleCart_shelfItem">
									  	<a href="javascript:;" class="addItem" data-title="$Up.Title" data-price ="$DefaultPrice" data-sku="{$Up.SKUBase}-{$SKUExtension}" data-variation="$Title"><span class="itemname">$Title</span> (<strong>$DefaultPrice.Nice</strong>) <span class="dd-buynow"><i class=" icon-basket-alt right"></i></span></a>
									  </li>
								  	<% end_loop %>
								</ul>
							<% else %>
							<% end_if %>
					</div>
				</div>
			</div>
		</div>
	</div>
	<% if Last %>
		<div class="navicon"><a href="#/$FirstItem.URLSegment"><i class="icon-angle-up"></i></a></div>
	<% else %>
		<div class="navicon"><a href="#/$NextItem.URLSegment"><i class="icon-angle-down"></i></a></div>
	<% end_if %>
</section>