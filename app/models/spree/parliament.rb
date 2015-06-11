class Spree::Parliament < ActiveRecord::Base
  has_many :owls, -> { order(position: :asc) }, class_name: 'Spree::Owl'
  validates_presence_of :name
  validates_uniqueness_of :name
  accepts_nested_attributes_for :owls, allow_destroy: true
end