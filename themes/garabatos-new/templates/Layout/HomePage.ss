<% include Images %>
<article class="text-center">
	
	<%-- $Content --%>
	$Form
	$CustomHtml.RAW
	
	<h2>Collections</h2>
	<div class="section-padded">
		<ul class="large-block-grid-3 blockgrid">
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
	</div>
</ul>
</article>