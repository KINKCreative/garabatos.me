<section id="$URLSegment">
	<h3>$Collection.Title - <strong>$Title</strong></h3>
	
	<div class="cartItem-wrapper">
		<div class="row">
			<div class="large-12 columns details">
				$Image.SetWidth(700)
				<div class="row">
					<div class="medium-6 columns text-left">
						$Title (<% if ProductVariations %>from <% end_if %><strong>{$QuickPrice.Nice}</strong>)
					</div>
					<div class="medium-6 columns text-right">
						Qty. <input type="text" class="itemQuantity" value="1" />
						<a class="button split round primary" data-dropdown="drop-{$ID}" class="dropdownClick">Add to Cart <i class=" icon-basket-alt"></i>	</a>
							<% if ProductVariations %>
								<ul id="drop-{$ID}" class="f-dropdown radius" data-dropdown-content>
									<% loop ProductVariations %>
									  <li class="simpleCart_shelfItem">
									  	<a href="javascript:;" class="addItem" data-title="$Title" data-price ="$DefaultPrice" data-variation="$Title"><span class="itemname">$Title</span> (<strong>$DefaultPrice.Nice</strong>)</a>
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
</section>