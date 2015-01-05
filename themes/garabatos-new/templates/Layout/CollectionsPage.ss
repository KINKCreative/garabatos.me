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
					<li><a href="$Link">
					<% with Products.First %>
						<div class="imagewrap">
							<img src="$Image.CroppedImage(500,500).URL" alt="$Title" class="under" />
						</div>
					<% end_with %>
						<h3>$Title</h3>
					</a></li>
				<% end_loop %>
			</ul>

			</article>
		</div>

	</div>
</div>