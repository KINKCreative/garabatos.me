<div class="main typography" role="main">
	<div class="row">

		<div class="large-12 columns">
			<article>
				<h2>$Title</h2>
				$Content
				$Form
				$CustomHtml.RAW

				<ul class="large-block-grid-3">
				<% loop Collections %>
					<a href="$Link">
					<% with Products.First %>
						<div class="imagewrap">
							<img src="$Image.SetWidth(400).URL" alt="$Title" class="under" />
						</div>
					<% end_with %>
					</a>
				<% end_loop %>
			</ul>

			</article>
		</div>

	</div>
</div>