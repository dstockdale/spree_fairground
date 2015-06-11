require 'spec_helper'

RSpec.describe Spree::Owl, type: :model do
  
  describe "associations" do
    it { is_expected.to belong_to(:parliament) }
  end

  describe "validations" do

    context "slide_type=image" do
      
      it "missing attachment invalid" do
        owl = build(:owl, { attachment_file_name: nil, slide_type: 'image' })
        expect(owl.valid?).to eq(false)
      end

      it "with attachment valid" do
        owl = build(:owl, { slide_type: 'image' })
        expect(owl.valid?).to eq(true)
      end 
    
    end

    context "slide_type=html" do
      
      it "missing body invalid" do
        owl = build(:owl, { body: nil, slide_type: 'html' })
        expect(owl.valid?).to eq(false)
      end

      it "with body valid" do
        owl = build(:owl, { body: "Hello World!", slide_type: 'html' })
        expect(owl.valid?).to eq(true)
      end 
    
    end
  
  end

end
