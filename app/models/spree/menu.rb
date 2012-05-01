class Spree::Menu < ActiveRecord::Base
  
  before_validation :get_static_page_path
  
  belongs_to :menu_bar
  belongs_to :page
  
  attr_accessible :page_id, :sequence,:parent_id, :link_text, :url, :visible, :menu_bar_id
  alias_attribute :position, :sequence
  
  acts_as_tree :order => "sequence"
  
  #validates_presence_of :sequence
  #validates_numericality_of :sequence
  
  validates_presence_of :link_text
  validates_presence_of :url
  validates_presence_of :menu_bar
  
  default_scope order(:sequence)
  scope :visible, where(:visible => true)
  
  private
    def get_static_page_path
      if attribute_present?("page_id")
        self.url = self.page.path
      end
    end
end