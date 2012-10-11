class AddImageDimensionsToBoxes < ActiveRecord::Migration
  def change
    add_column :spree_boxes, :image_width, :integer
    add_column :spree_boxes, :image_height, :integer
  end
end
