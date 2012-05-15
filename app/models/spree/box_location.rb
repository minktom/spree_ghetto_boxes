class Spree::BoxLocation < ActiveRecord::Base

  attr_accessible :title, :title_visible, :position

  acts_as_list
  has_many :boxes, :foreign_key => :location_id

  default_scope :order => :position

  def to_s
    title
  end

end
