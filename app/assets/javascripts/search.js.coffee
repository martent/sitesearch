$ ->
  # Scroll to set search field on top on touch devices
  $("body.touch #q").focus ->
    y = $("#q").offset().top - 6
    times = 0
    i = setInterval ->
      window.scrollTo(0, y)
      if times++ > 100
        clearInterval(i)
    , 1
    $("#malmo-masthead").css("position", "absolute")

  $("body.touch #q").blur ->
    $("#malmo-masthead").css("position", "fixed")

  # Focus empty search field on non touch devices
  $("body:not(.touch) #q").focus() unless !$("#q").length or $("#q").val().length

