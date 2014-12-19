class Spree::Admin::MenusController < Spree::Admin::ResourceController
  before_filter :load_resource
  before_filter :parent, :only => :index
  before_filter :update_sequence, :only => :new
  
  #before_filter :get_menu_bars, :only => [ :new, :edit, :create, :update ]
  
  belongs_to 'spree/menu_bar'
  
  def update_positions
    @menu_bar = parent
    if params[:positions]
      params[:positions].each do |id, index|
        @menu_bar.menus.update_all(['sequence=?', index], ['id=?', id])
      end
    end
    respond_to do |format|
      format.html { redirect_to admin_menu_bar_menus_url(@menu_bar) }
      format.js { render :text => 'Ok' }
    end
  end
  
  private
  
    def update_sequence
      if params[:menu_bar_id].present?
        @sequence = Spree::MenuBar.find(params[:menu_bar_id]).menus.count + 1
      end
    end

    def get_menu_bars
      @menu_bars = Spree::MenuBar.order(:sequence).all
    end

    def parent
      if params[:menu_bar_id].present?
        @menu_bar ||= Spree::MenuBar.find(params[:menu_bar_id])
      end
    end

    def collection
      params[:q] ||= {}
      params[:q][:sort] ||= "menu_bar.asc"
      @search = parent.menus.search(params[:q])
      @collection = @search.result#.page(params[:menu_bar]).per(Spree::Config[:orders_per_page])
    end
  

end