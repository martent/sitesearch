$ ->
  # Add term
  $("#edit-recommendation").on "click", ".add-term", (event) ->
    event.preventDefault()
    regexp = new RegExp($(@).data('id'), 'g')
    $(@).closest(".form-group")
      .before($(@).data('fields').replace(regexp, new Date().getTime()))
      .prev().find("input").focus()

  # Remove term
  $("#edit-recommendation .terms").on "click", ".remove", (event) ->
    event.preventDefault()
    $(@).closest(".controls").find("input[type=hidden]").val(true)
    $(@).closest(".form-group").hide()

  # Hide image on Remove image selection
  $("#edit-recommendation").on "change", "#recommendation_remove_image", (event) ->
    event.preventDefault()
    $(".form-group.image_preview").toggle(!@.checked)
