$ ->
  $("ul.image_menu").find("li").mouseover ->
    $(@).find("img.grey").first().stop().animate({"opacity": "0"}, "fast")
  $("ul.image_menu").find("li").click ->  
    $("ul.subimage_menu").html $(@).find("ul").html() unless $(@).find("ul").find("li").length == 0
    $("ul.subimage_menu").data("parent", $(@).attr("id"))
    $("ul.subimage_menu").slideDown("slow").css('display','block')
    return false
  $("ul.image_menu").find("li").mouseout -> 
    $(@).find("img.grey").first().stop().animate({"opacity": "1"}, "slow")
    #$("ul.subimage_menu").fadeOut("slow")
  $("ul.subimage_menu").mouseout ->
    #$(@).fadeOut("slow").hide()
    
  $("ul.subimage_menu").on "mouseover", "li", ->
    $(@).find("img.grey").first().stop().animate({"opacity": "0"}, "fast")
    parent_id = $("ul.subimage_menu").data("parent")
    $("#"+parent_id).find("img.grey").first().stop().animate({"opacity": "0"}, "fast")
    $("ul.subimage_menu").slideDown("slow")
  $("ul.subimage_menu").on "mouseout", "li", ->
    $(@).find("img.grey").first().stop().animate({"opacity": "1"}, "slow")
    $("ul.subimage_menu").data("parent", $(@).find("ul").attr("id"))
    parent_id = $("ul.subimage_menu").data("parent")
    $("#"+parent_id).find("img.grey").first().stop().animate({"opacity": "1"}, "slow")
  $("ul.subimage_menu").on "click", "div", ->
    parent_id = $("ul.subimage_menu").data("parent")
    $("#"+parent_id).find("img.grey").first().stop().animate({"opacity": "1"}, "slow")
    $("ul.subimage_menu").fadeOut(3000)