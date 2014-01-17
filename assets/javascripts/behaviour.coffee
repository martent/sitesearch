$ ->
  # Scroll to search box on narrow devices
  $q = $("#q")
  if $q.length
    if $(document).width() <= 568
      newY = $("#q").offset().top
      $("body").css("min-height", $(document).height() + newY)
      $q.focus ->
        $q.css("font-size", "16px") # hack to prevent iOS from zooming

        times = 0
        i = setInterval ->
          window.scrollTo(0, $q.offset().top - 6)
          if times++ > 20
            clearInterval(i)
        , 10
    else # set focus on field if not a narrow device and if no search field is empty
      $q.focus() unless $q.val().length
