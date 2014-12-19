class CreateSpreeMenuBars < ActiveRecord::Migration
  def up
    create_table :spree_menu_bars, :force => true do |t|
      t.string :name
      t.string :description
      t.string :css_class      
      t.timestamps
    end
  end

  def down
    drop_table :spree_menu_bars
  end
end
