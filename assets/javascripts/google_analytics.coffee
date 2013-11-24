$ ->
  # Event tracking of details for selected link in the search results
  if $("section.site-search").length
    $('section.site-search h2 a, section.site-search .ess-bestbets a, section.site-search ul.breadcrumb a, section.site-search .categories a').click (event) ->
      $a = $(this)
      if typeof gaDelayEvent is "function" then gaDelayEvent($a, event)
      link = $a.attr('href')
      GAAction = $("#q").val()
      GALabel = $.trim($a.text()) + " " + link

      # Track all clicks in the results list
      _gaq.push(['_trackEvent', 'SearchClickPosition', GAAction, GALabel, parseInt($a.closest('li').attr('data-position'), 10)])

      # Track clicks on breadcrumbs in the results list
      if $a.closest(".breadcrumb").length > 0
        _gaq.push(['_trackEvent', 'SearchClickBreadcrumb', GAAction,  GALabel])

      # Track clicks on editors choich in the results list
      if $a.closest(".editors_choice").length > 0
        _gaq.push(['_trackEvent', 'SearchClickEditorsChoice', GAAction,  GALabel])

      # Track clicks on editors choich in the results list
      if $a.closest(".categories").length > 0
        _gaq.push(['_trackEvent', 'SearchClickCategory', GAAction,  GALabel])
