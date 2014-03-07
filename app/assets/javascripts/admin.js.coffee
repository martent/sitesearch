$ ->
  $("#edit-recommendation").on "click", ".remove", (event) ->
    event.preventDefault()
    $(@).closest(".controls").find("input[type=hidden]").val(true)
    $(@).closest(".control-group").hide()
