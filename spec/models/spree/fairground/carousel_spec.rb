require 'spec_helper'

module Spree

  RSpec.describe Spree::Fairground::Carousel, type: :model do
    
    describe "associations" do
      it { is_expected.to have_many(:slides) }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_uniqueness_of(:name) }
      it { is_expected.to accept_nested_attributes_for(:slides).allow_destroy(true) }
  
    end

  end

end