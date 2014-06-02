
<img src="http://placehold.it/400/300" />

<h5>$Title</h5>
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