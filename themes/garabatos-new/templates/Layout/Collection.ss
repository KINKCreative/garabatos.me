<div class="section-padded">

		<article>
			<h2><small><a href="collections">Collections</a> <i class="fa fa-angle-right"></i></small>$Title</h2>
			$Content
			$Form
			$CustomHtml.RAW

			<ul class="medium-block-grid-3 blockgrid">
				<% loop Products %>
				<li><% include ShelfItem %></li>
				<% end_loop %>
			</ul>

		</article>
		
</div>