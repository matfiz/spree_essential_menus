class Spree::Menu < ActiveRecord::Base
  
  attr_accessible :spree_page_id, :sequence,:parent_id, :link_text, :url, :visible, :menu_type
  alias_attribute :position, :sequence
  
  acts_as_tree :order => "sequence"
  
  validates_presence_of :sequence
  validates_numericality_of :sequence
  
  validates_presence_of :link_text
  validates_presence_of :url
  validates_presence_of :menu_type
  
  default_scope order(:position)
  scope :visible, where(:visible => true)
end