<section id="$URLSegment" class="productSection">
	<h4>$Collection.Title
		<input type="hidden" class="itemQuantity" value="1" maxlength="2" />
		<% if ProductVariations %>
		<a class="button round primary dropdownClick" data-dropdown="drop-{$ID}"><i class="icon-basket-alt"></i></a>
			<ul id="drop-{$ID}" class="f-dropdown radius" data-dropdown-content>
				<% loop ProductVariations %>
				  <li class="simpleCart_shelfItem">
				  	<a href="javascript:;" class="addItem" data-title="$Up.Title" data-price ="$DefaultPrice" data-sku="{$Up.SKUBase}-{$SKUExtension}" data-variation="$Title"><span class="itemname">$Title</span> (<strong>$DefaultPrice.Nice</strong>) <span class="dd-buynow"><i class="  icon-plus-circled right"></i></span></a>
				  </li>
			  	<% end_loop %>
			</ul>
		<% else %>
		<% end_if %>
	</h4>
					
	
	<div class="row">
		<div class="medium-9 medium-centered small-12 columns">
			<div class="details">
				<style>
					.details {
						background-image: url($Image.SetWidth(700).URL);
					}
				</style>
			</div>
		</div>
	</div>

	<div class="navicon">
	<% if Last %>
		<a href="#/$FirstItem.URLSegment"><i class="icon-angle-circled-up"></i></a>
	<% else %>
		<a href="#/$NextItem.URLSegment"><i class="icon-angle-circled-down"></i></a>
	<% end_if %>
	</div>

</section>