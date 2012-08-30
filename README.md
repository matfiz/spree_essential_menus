SpreeEssentialMenus
===================

The extension closely cooperates with citrus/spree_essential_cms. It allows you to organize menus in you Spree app. 
Both extensions together opens possibility to have a fully customizeable CMS with pages, picutres and attachments in you app.

Installation
------------

Add the following line to your gemfile:

    gem 'spree_essential_menus', :git => 'git://github.com/matfiz/spree_essential_menus.git'
    
Run:

    bundle
    rails g spree_essential_menus:install

Accept to run migrations now.

You are ready to play!

Usage
-----
The SpreeEssentialMenus extension adds a subtab *Menus* to spree_essential tab (usually *Static content*, depending on you translation).
You should first create *Menu bars* that you need for your shop (usually **main menu** and **footer menu**, but can be infinitely many).
Then in every menu bar, you can create as many menu elements as you want to. You can either manually type the path (it can be both relative or absolute, but in case of aboulute path remember to start with "http://")
or you can select a static page created in citrus/spree_essential_cms, that the menu element should point to. In this case, the path will be filled in automatically.

### How to reorganize menu elements? ###

The menu elements can be easily reorganized by drag&drop functionality - just click on green arrows left to the element's name and drag it where you want to.

Example
=======

When you create *Menu bars*, you can easily embedd them in your layout by the partial, like below (written in *HAML*):

    %header
      %nav
        - @menu_bar = Spree::MenuBar.find_by_name("main_menu")
        = render :partial => "spree/shared/render_menu", :locals => {:menu_bar => @menu_bar}


Testing
-------

**So far there are no tests for this extension - I will be thankful for any help you can give me with that!**

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

Copyright (c) 2012 Grzegorz Brzezinka, released under the New BSD License

