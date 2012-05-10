$ ->
  #root level
  root_li = $("ul.image_menu").find("li.first-level")
  root_li.mouseover ->
    $(@).find("img.grey").first().stop().animate({"opacity": "0"}, "fast")
    $("ul.subimage_menu").html $(@).find("ul").html() unless $(@).find("ul").find("li").length == 0
    $("ul.subimage_menu").data("parent", $(@).attr("id"))
    $("ul.subimage_menu").slideDown("slow").css('display','block')
  root_li.mouseout -> 
    $(@).find("img.grey").first().stop().animate({"opacity": "1"}, "slow")
    #$("ul.subimage_menu").fadeOut("slow")
  $(".subimage_menu_container").mouseout (e) ->
    $("ul.subimage_menu").delay(6000).fadeOut(2000)
    e.stopPropagation()
  $(".subimage_menu_container").mouseover ->
    $("ul.subimage_menu").show()
    
  $("ul.subimage_menu").on "mouseover", "li.second-level", ->
    $(@).find("img.grey").first().stop().animate({"opacity": "0"}, "fast")
    parent_id = $("ul.subimage_menu").data("parent")
    $("#"+parent_id).find("img.grey").first().stop().animate({"opacity": "0"}, "fast")
    $(@).find("div.label").first().addClass("over").stop().animate({"opacity":"0.4"}, "fast")
  $("ul.subimage_menu").on "mouseout", "li.second-level", ->
    $(@).find("img.grey").first().stop().animate({"opacity": "1"}, "slow")
    $("ul.subimage_menu").data("parent", $(@).find("ul").attr("id"))
    parent_id = $("ul.subimage_menu").data("parent")
    $("#"+parent_id).find("img.grey").first().stop().animate({"opacity": "1"}, "slow")
    $(@).find("div.label").first().removeClass("over").stop().animate({"opacity":"1"}, "fast")
  #close when click close button and make the root grey again
  $("ul.subimage_menu").on "click", "div.close", ->
    parent_id = $("ul.subimage_menu").data("parent")
    $("#"+parent_id).find("img.grey").first().stop().animate({"opacity": "1"}, "slow")
    $("ul.subimage_menu").fadeOut(3000)
  #podpisy
