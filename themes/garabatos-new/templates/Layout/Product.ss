<div class="product-header">

  <div class="section-padded">
    <article>
        <h2>$Title</h2>
        
        $Content

        <input type="hidden" class="itemQuantity" value="1" maxlength="2" />

        <% with Item %>
            
            <% if ProductVariations %>
            <div class="single-item slick">
              <% loop ProductVariations %>
                <div class="simpleCart_shelfItem">

                  <div class="product-image-wrapper" style="background-image: url($Up.Image.SetWidth(700).URL);">
                    <img src="http://placehold.it/<% if Up.Portrait %>{$PxWidth}x{$PxHeight}<% else %>{$PxHeight}x{$PxWidth}<% end_if %>" />
                  </div>

                  <h3>$Title</h3>
                  <p>{$DefaultPrice.Nice}</p>
                  <a href="javascript:;" class="addItem button round button-small" data-title="$Up.Title" data-price ="$DefaultPrice" data-sku="{$Up.SKUBase}-{$SKUExtension}" data-variation="$Title">Add to Cart <!-- i class="fa fa-plus-circle right"></i --></a>

                  

                </div>
              <% end_loop %>
            </div>
            <% else %>
              Item not available.
            <% end_if %>

        <% end_with %>
        
      </article>

      <h4 class="text-center"><% with Collection %><i class="fa fa-angle-left"></i> <a href="$Link">Back to <strong>$Title</strong></a><% end_with %></h4>
  </div>

</div>