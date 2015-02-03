<ul class="accordion" data-accordion >
  <% loop Menu(1) %>
    <li class="accordion-navigation <% if $LinkingMode == "current" || $LinkingMode == "section" %>active<% end_if %>">
      <% if Children %>
        <a href="#panel_{$URLSegment}" title="$Title.ATT" class="expandable accordion-link">$MenuTitle</a>
        <div id="panel_{$URLSegment}" class="content <% if $LinkingMode == "current" || $LinkingMode == "section" %>active<% end_if %>">
          <ul class="side-nav">
            <% loop $Children %>
              <li class="<% if $LinkingMode == "current" || $LinkingMode == "section" %>active<% end_if %>"><a href="$Link" title="Go to the $Title.ATT">$MenuTitle</a></li>
            <% end_loop %>
          </ul>
        </div>
      <% else %>
        <a href="$Link" title="Go to $Title.ATT" class="link">$MenuTitle</a>
      <% end_if %>
    </li>
  <% end_loop %>
</ul>