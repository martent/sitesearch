$ ->
  # Load more results async
  $(".results").on "click", "#load-more-search-results a", (event) ->
    event.preventDefault()
    $.get $('#load-more-search-results a').attr("href"), (data) ->
      $('#load-more-search-results').replaceWith(data)
    $(this).text("Laddar fler...").closest("li").addClass('disabled')
