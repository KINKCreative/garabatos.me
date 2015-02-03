<div class="product-header">

  <div class="section-padded">
    <article>
        <h2 class="small-text-center">$Title</h2>
        
        $Content

        <input type="hidden" class="itemQuantity" value="1" maxlength="2" />

        <% with Item %>
            
            <% if ProductVariations %>
            <div class="single-item slick">
              <% loop ProductVariations %>
                <div class="simpleCart_shelfItem">
                  <div class="row">
                    <div class="large-8 columns large-centered">
                      
                      <% if Up.Portrait %>
                        $Up.Image.CroppedImage($PxWidth,$PxHeight)
                      <% else %>
                        $Up.Image.CroppedImage($PxHeight,$PxWidth)
                      <% end_if %>

                    </div> 
                  </div>
                  <div class="details">
                    <h3>$Title <small>{$DefaultPrice.Nice}</small></h3>
                    <a href="javascript:;" class="addItem button round button-small" data-title="$Up.Title" data-price ="$DefaultPrice" data-sku="{$Up.SKUBase}-{$SKUExtension}" data-variation="$Title">Add to Cart <!-- i class="fa fa-plus-circle right"></i --></a>
                  </div>
                </div>
              <% end_loop %>
            </div>
            <% else %>
              Item not available.
            <% end_if %>

        <% end_with %>
        
      </article>

      <h4 class="text-center"><% with Collection %><i class="fa fa-angle-left"></i> Back to <a href="$Link"><strong>$Title</strong></a><% end_with %></h4>
  </div>

</div>