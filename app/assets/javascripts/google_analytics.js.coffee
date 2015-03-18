$ ->
  # Event tracking of details for selected link in the search results
  $('body').on "click", "main h2 a, main .recommendations a, main .ess-bestbets a, main ul.breadcrumbs a, main .categories a", (event) ->
    $a = $(@)
    if typeof gaDelayEvent is "function" then gaDelayEvent($a, event)
    link = $a.attr('href')
    GAAction = $("#q").val()
    GALabel = $.trim($a.text()) + " " + link

    # Track all clicks in the results list
    if $a.closest(".results").length > 0
      ga('send', 'event', 'SearchClickPosition', GAAction, GALabel, $(".results > ol > li").index($a.closest("li")) + 1)

    # Track clicks on breadcrumbs in the results list
    if $a.closest(".breadcrumbs").length > 0
      ga('send', 'event', 'SearchClickBreadcrumb', GAAction,  GALabel)

    # Track clicks on editors choice in the results list
    if $a.closest(".editors_choice").length > 0
      ga('send', 'event', 'SearchClickEditorsChoice', GAAction,  GALabel)

    # Track clicks on recommendations in the results list
    if $a.closest(".recommendations").length > 0
      ga('send', 'event', 'SearchClickRecommendations', GAAction,  GALabel)

    # Track clicks on editors choich in the results list
    if $a.closest(".categories").length > 0
      ga('send', 'event', 'SearchClickCategory', GAAction,  GALabel)
