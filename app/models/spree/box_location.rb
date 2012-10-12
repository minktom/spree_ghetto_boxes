class Spree::BoxLocation < ActiveRecord::Base

  attr_accessible :title, :title_visible, :position, :show_on_frontend, :show_in_sidebar, :show_in_footer

  acts_as_list
  has_many :boxes, :foreign_key => :location_id

  default_scope :order => :position
  scope :frontend, where(show_on_frontend: true)
  scope :sidebar, where(show_in_sidebar: true)
  scope :footer, where(show_in_footer: true)

  def to_s
    title
  end

end
