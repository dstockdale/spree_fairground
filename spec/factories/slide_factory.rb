FactoryGirl.define do
  factory :slide, :class => Spree::Fairground::Slide do |f|
    f.carousel { |p| p.association(:carousel) }
    body Faker::Lorem.paragraph
    alt Faker::Lorem.sentence
    attachment_content_type 'image/jpeg'
    attachment_file_name "#{SecureRandom.hex(5)}.jpg"
    link "/some-page"
  end
end