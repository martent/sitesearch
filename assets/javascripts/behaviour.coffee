$ ->
  # Scroll to search box on narrow devices
  $q = $("#q")
  if $q.length && $(document).width() <= 568
    $q.blur()
    newY = $("#q").offset().top
    $("body").css("min-height", $(document).height() + newY)
    $q.focus ->
      $q.css("font-size", "16px")
      $(document).scrollTop(newY - 6)
