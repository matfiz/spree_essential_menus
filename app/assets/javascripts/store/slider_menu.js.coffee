$ ->
  window.onload = ->
    $(".touchcarousel").touchCarousel
      scrollbar: false
      itemsPerMove: 4
      snapToItems: true
      loopItems: true
      dragUsingMouse: false
    if $(".touchcarousel").find("ul").find("li").length <= 4
      $(".touchcarousel").find("a.arrow-holder").css('display','none')  
  $(".touchcarousel-item").mouseover ->
    $(@).find("img.grey").first().stop().animate({"opacity": "0"}, "fast")
  $(".touchcarousel-item").mouseout ->
    $(@).find("img.grey").first().stop().animate({"opacity": "1"}, "fast")