FactoryGirl.define do
  factory :carousel, :class => Spree::Fairground::Carousel do
    sequence(:name) { |n| "slide-#{n}" }
  end
end