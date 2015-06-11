FactoryGirl.define do
  factory :carousel, :class => Spree::Carousel do
    sequence(:name) { |n| "slide-#{n}" }
  end
end