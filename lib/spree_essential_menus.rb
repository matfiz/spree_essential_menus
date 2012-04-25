require "spree_essentials"
require "spree_sample" unless Rails.env.production?

require "spree_essential_menus/version"
require "spree_essential_menus/engine"

module SpreeEssentialMenus

  def self.tab
    { :label => "Menus", :route => :admin_menus }
  end
  
  def self.sub_tab
    [ :menus, { :match_path => '/menus' }]
  end
  
end

SpreeEssentials.register :menus, SpreeEssentialMenus