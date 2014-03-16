$ ->
  $("#edit-recommendation").on "click", ".remove", (event) ->
    event.preventDefault()
    $(@).closest(".controls").find("input[type=hidden]").val(true)
    $(@).closest(".control-group").hide()

  $("#edit-recommendation").on "click", ".add-term", (event) ->
    event.preventDefault()
    regexp = new RegExp($(@).data('id'), 'g')
    $(@).closest(".control-group")
      .before($(@).data('fields').replace(regexp, new Date().getTime()))
      .prev().find("input").focus()

  $("#edit-recommendation").on "change", "#recommendation_remove_image", (event) ->
    event.preventDefault()
    $(".control-group.image_preview").toggle(!@.checked)
