$ ->
  $("#edit-recommendation").on "click", ".remove", (event) ->
    event.preventDefault()
    $(@).closest(".controls").find("input[type=hidden]").val(true)
    $(@).closest(".control-group").hide()

  $("#edit-recommendation").on "click", ".add-term", (event) ->
    event.preventDefault()
    time = new Date().getTime()
    regexp = new RegExp($(@).data('id'), 'g')
    $(@).closest(".control-group").before($(@).data('fields').replace(regexp, time))
