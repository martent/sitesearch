$ ->
  if $('#full-search').length
    $('#q').focus() unless $('#q').val().length

    # Load more results async
    $(".results").on "click", "#load-more-search-results a", (event) ->
      event.preventDefault()
      $.get $('#load-more-search-results a').attr("href"), (data) ->
        $('#load-more-search-results').replaceWith(data)
      $(this).text("Laddar fler...").addClass('disabled')
