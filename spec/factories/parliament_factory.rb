FactoryGirl.define do
  factory :parliament, :class => Spree::Parliament do
    sequence(:name) { |n| "owl-#{n}" }
  end
end