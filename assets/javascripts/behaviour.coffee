$ ->
  # Scroll to search box on narrow devices
  if $("#q") && $(document).width() <= 568
    newY = $("#q").offset().top - 6
    $("body").css("min-height", $(document).height() + newY)
    $(document).scrollTop(newY)
