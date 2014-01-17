$ ->
  # Scroll to search box on narrow devices
  $q = $("#q")
  if $q.length
    if $(document).width() <= 568
      newY = $("#q").offset().top
      $("body").css("min-height", $(document).height() + newY)
      $q.focus ->
        $q.css("font-size", "16px") # hack to prevent iOS from zooming
        $("html, body").animate
          scrollTop: newY - 6
        , 100

    else # set focus on field if not a narrow device and if no search field is empty
      $q.focus() unless $q.val().length
