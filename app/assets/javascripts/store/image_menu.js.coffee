window.notSlidedDown = true
$ ->
  root_li = $("ul.image_menu").find("li.first-level")
  root_li.mouseover ->
    parent_id = $("ul.subimage_menu").data("parent")
    current = @
    $("#"+parent_id).find("img.grey").first().stop().animate({"opacity": "1"}, "fast")
    $("#"+parent_id).find("img.color").first().stop().animate({"opacity": "0"}, "slow")
    $("ul.subimage_menu").data("parent", $(@).attr("id"))
    $(@).find("img.grey").first().stop().animate({"opacity": "0"}, "fast")
    $(@).find("img.color").first().stop().animate({"opacity": "1"}, "fast")
    if $(@).find("ul").find("li").length == 0     
      $("ul.subimage_menu").stop(true, true).fadeTo(500,0, ->
        $("ul.subimage_menu").css("display","none")
        window.notSlidedDown = true
        return
      )     
    else
      if  window.notSlidedDown
        $("ul.subimage_menu").html $(current).find("ul").html() 
        $("ul.subimage_menu").css("opacity","1")  
        $("ul.subimage_menu").slideDown("slow",->
          window.notSlidedDown = false
        )        
      else
        $("ul.subimage_menu").stop(true, true).fadeTo(300,0,->  
          $("ul.subimage_menu").html $(current).find("ul").html() 
          $("ul.subimage_menu").css('display','block').stop(true,true).fadeTo(300,1)
        )
     
  root_li.mouseout -> 
    #$(@).find("img.grey").first().stop().animate({"opacity": "1"}, "fast")
    #$(@).find("img.color").first().stop().animate({"opacity": "0"}, "slow")
  
  $(".menu_container").mouseleave (e) -> 
    $("ul.subimage_menu").stop(true, true).delay(100).fadeTo(1000,0,->
       $("ul.subimage_menu").css("display","none")
       window.notSlidedDown = true
       return
    )      
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
