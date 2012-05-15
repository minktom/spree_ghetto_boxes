class CreateSpreeBoxLocations < ActiveRecord::Migration
  def change
    create_table :spree_box_locations do |t|
      t.string  :title
      t.boolean :title_visible
      t.integer :position
      t.timestamps
    end

    remove_column :spree_boxes, :location
    add_column    :spree_boxes, :location_id, :integer
    add_index     :spree_boxes, :location_id
  end
end
