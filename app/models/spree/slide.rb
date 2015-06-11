class Spree::Slide < ActiveRecord::Base
  has_attached_file :attachment,
                    styles: { mobile: '479x479>', tablet: '786x768>', desktop_small: '980x980>', desktop: '1200x1200>' },
                    default_style: :desktop,
                    url: '/spree/slides/:id/:style/:basename.:extension',
                    path: ':rails_root/public/spree/slides/:id/:style/:basename.:extension',
                    convert_options: { all: '-strip -auto-orient -colorspace sRGB' }

  with_options if: :image_slide? do |slide|
    slide.validate :no_attachment_errors
    slide.validates_attachment :attachment,
      presence: true,
      content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) }
    slide.validates :link, presence: true
  end

  validates :body, presence: true, if: :html_slide?

  belongs_to :carousel, required: true

  acts_as_list scope: :carousel

  # save the w,h of the original image (from which others can be calculated)
  # we need to look at the write-queue for images which have not been saved yet
  after_post_process :find_dimensions

  def image_slide?
    slide_type.downcase == "image"
  end

  def html_slide?
    slide_type.downcase == "html"
  end

  def find_dimensions
    temporary = attachment.queued_for_write[:original]
    filename = temporary.path unless temporary.nil?
    filename = attachment.path if filename.blank?
    geometry = Paperclip::Geometry.from_file(filename)
    self.attachment_width  = geometry.width
    self.attachment_height = geometry.height
  end

  # if there are errors from the plugin, then add a more meaningful message
  def no_attachment_errors
    unless attachment.errors.empty?
      # uncomment this to get rid of the less-than-useful interim messages
      # errors.clear
      errors.add :attachment, "Paperclip returned errors for file '#{attachment_file_name}' - check ImageMagick installation or image source file."
      false
    end
  end
end