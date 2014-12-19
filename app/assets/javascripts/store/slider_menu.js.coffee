$ ->
  window.onload = ->
    $(".touchcarousel").touchCarousel
      scrollbar: false
      itemsPerMove: 1
      snapToItems: true
      loopItems: false
      dragUsingMouse: false
    if $(".touchcarousel").find("ul").width() < $(".touchcarousel").width()
      $(".touchcarousel").find("a.arrow-holder").css('display','none')
      $(".touchcarousel").find("ul").css("margin","auto")  
  $(".touchcarousel-item").mouseover ->
    $(@).find("img.grey").first().stop().animate({"opacity": "0"}, "fast")
  $(".touchcarousel-item").mouseout ->
    $(@).find("img.grey").first().stop().animate({"opacity": "1"}, "fast")