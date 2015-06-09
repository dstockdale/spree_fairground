require 'spec_helper'

module Spree

  RSpec.describe Spree::Parliament, type: :model do
    
    describe "associations" do
      it { is_expected.to have_many(:owls) }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_uniqueness_of(:name) }
      it { is_expected.to accept_nested_attributes_for(:owls).allow_destroy(true) }
  
    end

  end

end