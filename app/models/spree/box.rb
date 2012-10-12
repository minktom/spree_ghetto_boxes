class Spree::Box < ActiveRecord::Base

  LOOKS = [ :overlay, :left, :right, :bottom, :image, :text, :highlighted ]

  attr_accessible :title, :body, :target_url, :position, :look, :visible, :image, :location_id

  acts_as_list :scope => :box_location

  has_attached_file :image,
                    :styles => {:thumb => "100x100>" },
                    :url => '/spree/boxes/:id/:basename_:style.:extension',
                    :path => ':rails_root/public/spree/boxes/:id/:basename_:style.:extension'
  # save the w,h of the original image (from which others can be calculated)
  # we need to look at the write-queue for images which have not been saved yet
  after_post_process :find_dimensions

  # Load user defined paperclip settings
  if Spree::Config[:use_s3]
    s3_creds = { :access_key_id => Spree::Config[:s3_access_key], :secret_access_key => Spree::Config[:s3_secret], :bucket => Spree::Config[:s3_bucket] }
    Spree::Box.attachment_definitions[:image][:storage] = :s3
    Spree::Box.attachment_definitions[:image][:s3_credentials] = s3_creds
    Spree::Box.attachment_definitions[:image][:s3_headers] = ActiveSupport::JSON.decode(Spree::Config[:s3_headers])
    Spree::Box.attachment_definitions[:image][:bucket] = Spree::Config[:s3_bucket]
    Spree::Box.attachment_definitions[:image][:s3_protocol] = Spree::Config[:s3_protocol] unless Spree::Config[:s3_protocol].blank?
  end

  belongs_to :box_location, :foreign_key => :location_id
  validates :title, :target_url, :look, :presence => true

  default_scope :order => [:location_id, :position]
  scope :visible, where(:visible => true)

  def find_dimensions
    temporary = image.queued_for_write[:original]
    filename = temporary.path unless temporary.nil?
    filename = image.path if filename.blank?
    geometry = Paperclip::Geometry.from_file(filename)
    self.image_width  = geometry.width
    self.image_height = geometry.height
  end

  def css_classes
    ary = []
    ary << "look-#{look}"
    ary << 'no-image' unless image.present?
    ary.join(' ')
  end

end
