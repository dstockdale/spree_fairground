FactoryGirl.define do
  factory :owl, :class => Spree::Owl do |f|
    f.parliament { |p| p.association(:parliament) }
    body Faker::Lorem.paragraph
    alt Faker::Lorem.sentence
    attachment_content_type 'image/jpeg'
    attachment_file_name "#{SecureRandom.hex(5)}.jpg"
    link "/some-page"
  end
end