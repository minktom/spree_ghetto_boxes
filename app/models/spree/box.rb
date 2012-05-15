class Spree::Box < ActiveRecord::Base

  LOOKS = [ :overlay, :right, :bottom, :image, :text ]

  attr_accessible :title, :body, :target_url, :position, :look, :visible, :image, :location_id

  acts_as_list
  has_attached_file :image, :styles => {:thumb => "100x100>" }

  belongs_to :box_location, :foreign_key => :location_id

  default_scope :order => :position

  scope :visible, where(:visible => true)

end
