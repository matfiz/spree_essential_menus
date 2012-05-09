class Spree::Menu < ActiveRecord::Base
  
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
    :url => '/spree/posts/:id/:style/:basename.:extension',
    :path => ':rails_root/public/spree/posts/:id/:style/:basename.:extension'
    
  def image_content?
    menu_image_content_type.to_s.match(/\/(jpeg|png|gif|tiff|x-photoshop)/)
  end
  
  def attachment_sizes
    hash = {}
    hash.merge!(:mini => '48x48>',:color => '320x100#', :greyscale => {:geometry => '320x100#', :processors => [:grayscale]}) if image_content?
    hash
  end
  
  private
    def get_static_page_path
      if attribute_present?("page_id")
        self.url = self.page.path
      end
    end
end