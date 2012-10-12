class AddShowInFieldsToBoxLocations < ActiveRecord::Migration
  def change
    add_column :spree_box_locations, :show_on_frontend, :boolean, :default => false, :null => false
    add_column :spree_box_locations, :show_in_sidebar,  :boolean, :default => false, :null => false
    add_column :spree_box_locations, :show_in_footer,   :boolean, :default => false, :null => false
  end
end
