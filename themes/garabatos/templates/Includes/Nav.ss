<li><a href="#">Home</a></li>
<li><a class="collections_dropdown">Collections <i class="icon icon-angle-down"></i></a>
	<ul class="collections_submenu submenu" style="display:none;">
		<% loop Collections %>
			<li><a href="#/$URLSegment">$Title</a></li>
		<% end_loop %>
	</ul>
</li>
<% loop Menu(1) %>
<% if URLSegment!="home" %>
	<li><a href="#/$URLSegment">$MenuTitle</a></li>
<% end_if %>
<% end_loop %>
<li><a href="#/cart">Cart</a></li>