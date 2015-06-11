class Spree::Fairground::Carousel < ActiveRecord::Base
  has_many :slides, -> { order(position: :asc) }, class_name: 'Spree::Fairground::Slide'
  validates_presence_of :name
  validates_uniqueness_of :name
  accepts_nested_attributes_for :slides, allow_destroy: true
end