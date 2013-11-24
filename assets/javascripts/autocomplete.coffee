$ ->
  $searchField = $('#full-search #q')
  $searchField.autocomplete
    source: (request, response) ->
      $.ajax
        url: $searchField.attr("data-autocomplete-path")
        data:
          q: request.term
          ilang: 'sv'
        dataType: "jsonp"
        jsonpCallback: "results"
        success: (data) ->
          if data.length
            response $.map data, (item) ->
              return {
                hits: item.nHits
                suggestionHighlighted: item.suggestionHighlighted
                value: item.suggestion
              }
    minLength: 2
    select: (event, ui) ->
      document.location = $("#full-search").attr('action') + '?q=' + unescape(ui.item.value)
  .data( "ui-autocomplete" )._renderItem = (ul, item) ->
    return $("<li></li>")
    .data("ui-autocomplete-item", item)
    .append("<a><span class='hits'>" + item.hits + "</span>" + item.suggestionHighlighted + "</a>")
    .appendTo(ul)
