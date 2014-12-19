require "spree_essentials"
require "spree_sample" unless Rails.env.production?

require "spree_essential_menus/version"
require "spree_essential_menus/engine"

module SpreeEssentialMenus

  def self.tab
    { :label => "Menu bars", :route => :admin_menu_bars }
  end
  
  def self.sub_tab
    [ :menu_bars, { :match_path => '/menu_bars' }]
  end
  
end

SpreeEssentials.register :menu_bars, SpreeEssentialMenus