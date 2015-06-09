require 'spec_helper'

RSpec.describe Spree::Owl, type: :model do
  
  describe "associations" do
    it { is_expected.to belong_to(:parliament) }
  end

end
