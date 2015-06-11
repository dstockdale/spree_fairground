require 'spec_helper'

RSpec.describe Spree::Admin::SlidesController, type: :controller do

  stub_authorization!

  describe "GET #index" do
    it "assigns all slides as @slides" do
      carousel = create(:carousel)
      slide = create(:slide, carousel: carousel)
      spree_get :index, carousel_id: carousel.id
      expect(assigns(:carousel)).to eq(carousel)
      expect(assigns(:slides)).to eq([slide])
    end
  end

  describe "GET #show" do
    it "assigns the requested slide as @slide" do
      carousel = create(:carousel)
      slide = create(:slide, carousel: carousel)
      spree_get :show, carousel_id: carousel.id, id: slide.id
      expect(assigns(:slide)).to eq(slide)
    end
  end

  describe "GET #new" do
    it "assigns a new slide as @slide" do
      carousel = create(:carousel)
      spree_get :new, carousel_id: carousel.id
      expect(assigns(:slide)).to be_a_new(Spree::Slide)
    end
  end

  describe "GET #edit" do
    it "assigns the requested slide as @slide" do
      carousel = create(:carousel)
      slide = create(:slide, carousel: carousel)
      spree_get :edit, carousel_id: carousel.id, id: slide.id
      expect(assigns(:slide)).to eq(slide)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Spree::Slide" do
        carousel = create(:carousel)
        expect {
          spree_post :create, carousel_id: carousel.id, slide: attributes_for(:slide)
        }.to change(Spree::Slide, :count).by(1)
      end

      it "assigns a newly created slide as @slide" do
        carousel = create(:carousel)
        spree_post :create, carousel_id: carousel.id, slide: attributes_for(:slide)
        expect(assigns(:slide)).to be_a(Spree::Slide)
        expect(assigns(:slide)).to be_persisted
      end

      it "redirects to the collection" do
        carousel = create(:carousel)
        spree_post :create, carousel_id: carousel.id, slide: attributes_for(:slide)
        expect(response).to redirect_to(admin_carousel_path(carousel))
      end
    end

    context "with invalid params" do

      let(:invalid_attributes) {
        attributes_for(:slide, { attachment_file_name: nil } )
      }

      it "assigns a newly created but unsaved slide as @slide" do
        carousel = create(:carousel)
        spree_post :create, carousel_id: carousel.id, slide: invalid_attributes
        expect(assigns(:slide)).to be_a_new(Spree::Slide)
      end

      it "re-renders the 'new' template" do
        carousel = create(:carousel)
        spree_post :create, carousel_id: carousel.id, slide: invalid_attributes
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      let(:new_attributes) {
        { alt: "new_alt" }
      }

      it "updates the requested slide" do
        carousel = create(:carousel)
        slide = create(:slide, carousel: carousel)
        spree_put :update, { carousel_id: carousel.id, id: slide.id, slide: new_attributes }
        slide.reload
        expect(slide.alt).to eq("new_alt")
      end

      it "assigns the requested slide as @slide" do
        carousel = create(:carousel)
        slide = create(:slide, carousel: carousel)
        spree_put :update, { carousel_id: carousel.id, id: slide.id, slide: new_attributes }
        expect(assigns(:slide)).to eq(slide)
      end

      it "redirects to the slide" do
        carousel = create(:carousel)
        slide = create(:slide, carousel: carousel)
        spree_put :update, { carousel_id: carousel.id, id: slide.id, slide: new_attributes }
        expect(response).to redirect_to(admin_carousel_slide_path(carousel, slide))
      end
    end

    context "with invalid params" do

      let(:invalid_attributes) {
        { attachment_file_name: nil }
      }

      it "assigns the slide as @slide" do
        carousel = create(:carousel)
        slide = create(:slide, carousel: carousel)
        spree_put :update, { carousel_id: carousel.id, id: slide.id, slide: invalid_attributes }
        expect(assigns(:slide)).to eq(slide)
      end

      it "re-renders the 'edit' template" do
        carousel = create(:carousel)
        slide = create(:slide, carousel: carousel)
        spree_put :update, { carousel_id: carousel.id, id: slide.id, slide: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested slide" do
      carousel = create(:carousel)
      slide = create(:slide, carousel: carousel)
      expect {
        spree_delete :destroy, { carousel_id: carousel.id, :id => slide.id }
      }.to change(Spree::Slide, :count).by(-1)
    end

    it "redirects to the slides list" do
      carousel = create(:carousel)
      slide = create(:slide, carousel: carousel)
      spree_delete :destroy, { carousel_id: carousel.id, :id => slide.id }
      expect(response).to redirect_to(admin_carousel_path(carousel))
    end
  end

end
