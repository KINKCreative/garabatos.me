<section id="$URLSegment">
	<h3>$Collection.Title - <strong>$Title</strong></h3>
	
	<div class="cartItem-wrapper">
		<div class="row">
			<div class="large-12 columns details">
				$Image.SetWidth(700)
				<div class="left">
					$Title (<% if ProductVariations %>from <% end_if %><strong>{$QuickPrice.Nice}</strong>)
				</div>
				<div class="right">
					Qty. <input type="text" class="itemQuantity" value="1" />
					<a class="button split round primary addClick" data-title="$Title" data-price="5" data-variation="Postcard 5x7">Add to Cart 
						<% if ProductVariations %>
							<span data-dropdown="drop-{$ID}" class="dropdownClick"></span></a><br>
							<ul id="drop-{$ID}" class="f-dropdown radius" data-dropdown-content>
								<% loop ProductVariations %>
								  <li class="simpleCart_shelfItem">
								  	<a href="javascript:;" class="addItem" data-title="$Title" data-price ="$DefaultPrice" data-variation="$Title"><span class="itemname">$Title</span> (<strong>$DefaultPrice.Nice</strong>)</a>
								  </li>
							  	<% end_loop %>
							</ul>
						<% else %>
							</a>
						<% end_if %>
				</div>

			</div>
		</div>
	</div>
</section>