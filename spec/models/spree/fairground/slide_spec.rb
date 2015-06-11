require 'spec_helper'

RSpec.describe Spree::Fairground::Slide, type: :model do
  
  describe "associations" do
    it { is_expected.to belong_to(:carousel) }
  end

  describe "validations" do

    context "slide_type=image" do
      
      it "missing attachment invalid" do
        slide = build(:slide, { attachment_file_name: nil, slide_type: 'image' })
        expect(slide.valid?).to eq(false)
      end

      it "with attachment valid" do
        slide = build(:slide, { slide_type: 'image' })
        expect(slide.valid?).to eq(true)
      end 

      it "missing link invalid" do
        slide = build(:slide, { link: nil, slide_type: 'image' })
        expect(slide.valid?).to eq(false)
      end

      it "with link valid" do
        slide = build(:slide, { slide_type: 'image' })
        expect(slide.valid?).to eq(true)
      end 
    
    end

    context "slide_type=html" do
      
      it "missing body invalid" do
        slide = build(:slide, { body: nil, slide_type: 'html' })
        expect(slide.valid?).to eq(false)
      end

      it "with body valid" do
        slide = build(:slide, { body: "Hello World!", slide_type: 'html' })
        expect(slide.valid?).to eq(true)
      end 
    
    end
  
  end

  describe "position" do

    it "increments if nil" do
      carousel = create(:carousel)
      slide1 = create(:slide, { carousel: carousel, position: 5 })
      slide2 = create(:slide, { carousel: carousel, position: nil })
      expect(slide2.position).to eq(6)
    end
  end

end
