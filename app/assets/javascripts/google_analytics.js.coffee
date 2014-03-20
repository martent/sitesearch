$ ->
  # Event tracking of details for selected link in the search results
  $('body').on "click", "section.site-search h2 a, section.site-search .recommendations a, section.site-search .ess-bestbets a, section.site-search ul.breadcrumb a, section.site-search .categories a", (event) ->
    $a = $(@)
    if typeof gaDelayEvent is "function" then gaDelayEvent($a, event)
    link = $a.attr('href')
    GAAction = $("#q").val()
    GALabel = $.trim($a.text()) + " " + link

    # Track all clicks in the results list
    if $a.closest(".results").length > 0
      _gaq.push(['_trackEvent', 'SearchClickPosition', GAAction, GALabel, $(".results > ul > li").index($a.closest("li")) + 1, 10])

    # Track clicks on breadcrumbs in the results list
    if $a.closest(".breadcrumb").length > 0
      _gaq.push(['_trackEvent', 'SearchClickBreadcrumb', GAAction,  GALabel])

    # Track clicks on editors choice in the results list
    if $a.closest(".editors_choice").length > 0
      _gaq.push(['_trackEvent', 'SearchClickEditorsChoice', GAAction,  GALabel])

    # Track clicks on recommendations in the results list
    if $a.closest(".recommendations").length > 0
      _gaq.push(['_trackEvent', 'SearchClickRecommendations', GAAction,  GALabel])

    # Track clicks on editors choich in the results list
    if $a.closest(".categories").length > 0
      _gaq.push(['_trackEvent', 'SearchClickCategory', GAAction,  GALabel])
