<dl class="sub-nav">
  <% loop Menu(1) %>
  <dd class="<% if $LinkingMode == "current" || $LinkingMode == "section" %>active<% end_if %>" >
    <% if URLSegment=="collections" %>
      <a href="{$Link}" data-options="align:right" data-dropdown="collections-drop">$MenuTitle <i class="fa fa-angle-down"></i></a>
    <% else %>
      <a href="$Link" title="Go to $Title.ATT">$MenuTitle</a>
    <% end_if %>
  </dd>
  <% end_loop %>
</dl>

<ul id="collections-drop" class="small f-dropdown" data-dropdown-content>
  <% loop $Collections %>
    <li><a href="$Link">$Title</a></li>
  <% end_loop %>
</ul>