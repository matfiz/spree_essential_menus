class Spree::MenuBar < ActiveRecord::Base
  
  has_many :menus
  
  attr_accessible :name, :description, :css_class
  
  validates_presence_of :name
  
end