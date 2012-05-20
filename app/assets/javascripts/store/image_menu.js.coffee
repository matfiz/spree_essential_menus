$ ->
  #root level
  rt = true
  root_li = $("ul.image_menu").find("li.first-level")
  
  root_li.mouseover ->
    parent_id = $("ul.subimage_menu").data("parent")
    $("#"+parent_id).find("img.grey").first().stop().animate({"opacity": "1"}, "fast")
    $("#"+parent_id).find("img.color").first().stop().animate({"opacity": "0"}, "slow")
    $("ul.subimage_menu").data("parent", $(@).attr("id"))
    $(@).find("img.grey").first().stop().animate({"opacity": "0"}, "fast")
    $(@).find("img.color").first().stop().animate({"opacity": "1"}, "fast")
    if $(@).find("ul").find("li").length == 0     
      $("ul.subimage_menu").stop(true, true).fadeTo(2000,0)     
    else
      $("ul.subimage_menu").html $(@).find("ul").html()  
      if $("ul.subimage_menu").css('display') == 'none' 
        $("ul.subimage_menu").stop(true, true).slideDown("slow").css('display','block')
      else
        $("ul.subimage_menu").stop().fadeTo(500,1)
     
  root_li.mouseout -> 
    #$(@).find("img.grey").first().stop().animate({"opacity": "1"}, "fast")
    #$(@).find("img.color").first().stop().animate({"opacity": "0"}, "slow")
  
  $(".menu_container").mouseleave (e) -> 
    $("ul.subimage_menu").stop(true, true).delay(100).fadeOut(2000) 
    parent_id = $("ul.subimage_menu").data("parent")
    $("#"+parent_id).find("img.grey").first().stop().animate({"opacity": "1"}, "fast")
    $("#"+parent_id).find("img.color").first().stop().animate({"opacity": "0"}, "slow")
    #e.stopPropagation()
  
  $("ul.subimage_menu").on "mouseover", "li.second-level", ->
    $(@).find("img.grey").first().stop().animate({"opacity": "0"}, "fast")
    $(@).find("div.label").first().addClass("over").stop().animate({"opacity":"0.4"}, "fast")
  
  $("ul.subimage_menu").on "mouseout", "li.second-level", ->
    $(@).find("img.grey").first().stop().animate({"opacity": "1"}, "fast")
    $("ul.subimage_menu").data("parent", $(@).find("ul").attr("id"))
    $(@).find("div.label").first().removeClass("over").stop().animate({"opacity":"1"}, "fast")
  

  #podpisy
