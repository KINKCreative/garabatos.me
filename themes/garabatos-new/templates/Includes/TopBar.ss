<nav class="top-bar" role="navigation" data-topbar>
	<ul class="title-area">
		<li class="name">
			<h1><a href="{$baseUrl}"><img src="$ThemeDir/images/Garabatos-Logo.png" class="logo-img" /></a></h1>
		</li>
		<li class="toggle-topbar menu-icon"><a href=""><span>Menu</span></a></li>
	</ul>
	<section class="top-bar-section">
		<!-- Right Nav Section -->
		<ul class="right">
			<li><a href="cart"><i class="icon-basket-alt"></i><span class="simpleCart_total orange"></span> ( <span id="simpleCart_quantity" class="simpleCart_quantity"></span> items )</a></li>
			<li><a href="javascript:;" class="simpleCart_empty orange" title="Empty cart"><i class="icon-trash"></i></a></li>
			<!-- <li><a href="mailto:info@garabatos.me">info@garabatos.me</a></li> -->
		</ul>
	</section>
</nav>

<div class="menu">
	<div class="row">
		<div class="large-4 columns">
			
		</div>
		<div class="large-8 columns">
			<ul class="left">
			<li class="divider"></li>
			<% loop Menu(1) %>
			<li class="<% if $LinkingMode == "current" || $LinkingMode == "section" %>active<% end_if %><% if $Children %> has-dropdown<% end_if %>">
				<a href="$Link" title="Go to $Title.ATT">$MenuTitle</a>
				<% if $Children %>
					<ul class="dropdown">
						<li><label>$MenuTitle</label></li>
						<% loop $Children %>
						<li class="<% if $LinkingMode == "current" || $LinkingMode == "section" %>active<% end_if %><% if $Children %> has-dropdown<% end_if %>">
							<a href="$Link" title="Go to $Title.ATT">$MenuTitle</a>
							<% if $Children %>
							<ul class="dropdown">
								<% loop $Children %>
								<li class="<% if $LinkingMode == "current" || $LinkingMode == "section" %>active<% end_if %>"><a href="$Link" title="Go to the $Title.ATT">$MenuTitle</a></li>
								<% end_loop %>
							</ul>
							<% end_if %>
						</li>
						<% end_loop %>
						<li><a href="$Link">See all &rarr;</a></li>
					</ul>
				<% end_if %>
			</li>
			<% if not Last %><li class="divider"></li><% end_if %>
			<% end_loop %>
		</ul>
	</div>
