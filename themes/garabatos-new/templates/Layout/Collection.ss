<div class="main typography" role="main">
	<div class="row">

		<div class="large-12 columns">
			<article>
				<h2><small><a href="collections">Collections</a><i class="icon-angle-right"></i></small>$Title</h2>
				$Content
				$Form
				$CustomHtml.RAW

				<ul class="large-block-grid-5 medium-block-grid-3">
					<% loop Products %>
					<li><% include ShelfItem %></li>
					<% end_loop %>
				</ul>

			</article>
		</div>

	</div>
</div>