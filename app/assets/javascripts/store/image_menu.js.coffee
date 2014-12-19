window.notSlidedDown = true
$ ->
  root_li = $("ul.image_menu").find("li.first-level")
  root_li.mouseover ->
    parent_id = $("ul.subimage_menu").data("parent")
    current = @
    $("#"+parent_id).find("img.grey").first().stop().animate({"opacity": "1"}, "fast")
    $("#"+parent_id).find("img.color").first().stop().animate({"opacity": "0"}, "slow")
    $("ul.subimage_menu").data("parent", $(@).attr("id"))
    $(@).find("img.grey").first().stop(1).animate({"opacity": "0"}, "slow")
    $(@).find("img.color").first().stop(1).animate({"opacity": "1"}, "fast")
    if $(@).find("ul").find("li").length == 0     
      if !window.notSlidedDown
        $("ul.subimage_menu").stop(true, true).animate({"opacity":"0"},500).slideUp(1,->  
          window.notSlidedDown = true
        )  
    else
      if window.notSlidedDown
        $("ul.subimage_menu").html $(current).find("ul").html() 
        $("ul.subimage_menu").stop(true,true).css("opacity","1").slideDown("slow",->  
          window.notSlidedDown = false
        )
            
      else
        $("ul.subimage_menu").stop(true, true).animate({"opacity":"0"},500,->  
          $("ul.subimage_menu").html $(current).find("ul").html() 
          $("ul.subimage_menu").stop(true, true).animate({"opacity":"1"},500)
        )
     
  root_li.mouseout -> 
    $(@).find("img.grey").first().stop(true,true).css("opacity": "1")
    $(@).find("img.color").first().stop(true,true).css("opacity": "0")
  
  $(".menu_container").mouseleave (e) -> 
    $("ul.subimage_menu").stop(true, true).animate({"opacity":"0"},500).slideUp(1,->  
      window.notSlidedDown = true 
    )   

  $("ul.subimage_menu").on "mouseover", "li.second-level", ->
    $(@).find("img.grey").first().stop().animate({"opacity": "0"}, "fast")
    $(@).find("div.label").first().addClass("over").stop().animate({"opacity":"0.4"}, "fast")
  
  $("ul.subimage_menu").on "mouseout", "li.second-level", ->
    $(@).find("img.grey").first().stop().animate({"opacity": "1"}, "fast")
    $("ul.subimage_menu").data("parent", $(@).find("ul").attr("id"))
    $(@).find("div.label").first().removeClass("over").stop().animate({"opacity":"1"}, "fast")