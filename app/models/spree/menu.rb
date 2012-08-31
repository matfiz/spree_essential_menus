require 'acts_as_tree'

class Spree::Menu < ActiveRecord::Base
  include ActsAsTree

  before_validation :get_static_page_path
  
  belongs_to :menu_bar
  belongs_to :page
  
  attr_accessible :page_id, :sequence,:parent_id, :link_text, :url, :visible, :menu_bar_id
  alias_attribute :position, :sequence
  
  attr_accessible :alt, :menu_image, :vieweable

  acts_as_tree :order => "sequence"
  
  #validates_presence_of :sequence
  #validates_numericality_of :sequence
  
  validates_presence_of :link_text
  validates_presence_of :url
  validates_presence_of :menu_bar
  
  default_scope order(:sequence)
  scope :visible, where(:visible => true)
  
   has_attached_file :menu_image,
    :styles => Proc.new{ |clip| clip.instance.attachment_sizes },
    :default_style => :medium,
    :url => '/spree/menus/:id/:style/:basename.:extension',
    :path => ':rails_root/public/spree/menus/:id/:style/:basename.:extension'
    
  def image_content?
    menu_image_content_type.to_s.match(/\/(jpeg|png|gif|tiff|x-photoshop)/)
  end
  
  def attachment_sizes
    hash = {}
    hash.merge!(:mini => '48x48>', :greyscale => {:processors => [:grayscale]}) if image_content?
    hash.merge!(:logo_color => '123x81>', :logo_grey => {:geometry => '123x81>', :processors => [:thumbnail,:grayscale]}) if parent_id.nil?
    hash
  end
  
  private
    def get_static_page_path
      if attribute_present?("page_id")
        self.url = self.page.path
      end
    end
end