FactoryGirl.define do
  factory :owl, :class => Spree::Owl do |f|
    f.parliament { |p| p.association(:parliament) }

    alt "Image description"
    attachment_content_type 'image/jpeg'
    attachment_file_name "#{SecureRandom.hex(5)}.jpg"
  end
end