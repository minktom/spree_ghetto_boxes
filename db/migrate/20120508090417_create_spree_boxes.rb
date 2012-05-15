class CreateSpreeBoxes < ActiveRecord::Migration
  def change
    create_table :spree_boxes do |t|
      t.string    :title
      t.text      :body
      t.string    :target_url
      t.string    :location
      t.integer   :position
      t.string    :look
      t.boolean   :visible
      t.string    :image_file_name
      t.string    :image_content_type
      t.integer   :image_file_size
      t.datetime  :image_updated_at
      t.timestamps
    end
    
    add_index :spree_boxes, :location
  end
end
