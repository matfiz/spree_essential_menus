$ ->
  $(".touchcarousel").touchCarousel
    scrollbar: false
    itemsPerMove: 4
    snapToItems: true
    loopItems: true
    dragUsingMouse: false
  $(".touchcarousel-item").mouseover ->
    $(@).find("img.grey").first().stop().animate({"opacity": "0"}, "fast")
  $(".touchcarousel-item").mouseout ->
    $(@).find("img.grey").first().stop().animate({"opacity": "1"}, "fast")