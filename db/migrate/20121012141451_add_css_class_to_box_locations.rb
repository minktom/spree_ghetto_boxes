class AddCssClassToBoxLocations < ActiveRecord::Migration
  def change
    add_column :spree_box_locations, :css_class, :string
  end
end
