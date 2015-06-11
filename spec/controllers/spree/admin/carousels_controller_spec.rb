require 'spec_helper'

RSpec.describe Spree::Admin::CarouselsController, type: :controller do

  stub_authorization!

  describe "GET #index" do
    it "assigns all carousels as @carousels" do
      carousel = create(:carousel)
      spree_get :index
      expect(assigns(:carousels)).to eq([carousel])
    end
  end

  describe "GET #show" do
    it "assigns the requested spree_admin as @spree_admin" do
      carousel = create(:carousel)
      spree_get :show, id: carousel.id
      expect(assigns(:carousel)).to eq(carousel)
    end
  end

  describe "GET #new" do
    it "assigns a new spree_admin as @spree_admin" do
      spree_get :new
      expect(assigns(:carousel)).to be_a_new(Spree::Fairground::Carousel)
    end
  end

  describe "GET #edit" do
    it "assigns the requested spree_admin as @spree_admin" do
      carousel = create(:carousel)
      spree_get :edit, id: carousel.id
      expect(assigns(:carousel)).to eq(carousel)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Spree::Fairground::Carousel" do
        expect {
          spree_post :create, carousel: attributes_for(:carousel)
        }.to change(Spree::Fairground::Carousel, :count).by(1)
      end

      it "assigns a newly created spree_admin as @spree_admin" do
        spree_post :create, carousel: attributes_for(:carousel)
        expect(assigns(:carousel)).to be_a(Spree::Fairground::Carousel)
        expect(assigns(:carousel)).to be_persisted
      end

      it "redirects to the created spree_admin" do
        spree_post :create, carousel: attributes_for(:carousel)
        expect(response).to redirect_to([:admin, Spree::Fairground::Carousel.last])
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved spree_admin as @carousel" do
        spree_post :create, carousel: attributes_for(:carousel, name: nil)
        expect(assigns(:carousel)).to be_a_new(Spree::Fairground::Carousel)
      end

      it "re-renders the 'new' template" do
        spree_post :create, carousel: attributes_for(:carousel, name: nil)
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      
      let(:new_attributes) {
        { name: "new_name" }
      }

      it "updates the requested spree_admin" do
        carousel = create(:carousel)
        spree_put :update, { id: carousel.id, carousel: new_attributes }
        carousel.reload
        expect(carousel.name).to eq("new_name")
      end

      it "assigns the requested spree_admin as @spree_admin" do
        carousel = create(:carousel)
        spree_put :update, { id: carousel.id, carousel: new_attributes }
        expect(assigns(:carousel)).to eq(carousel)
      end

      it "redirects to the spree_admin" do
        carousel = create(:carousel)
        spree_put :update, { id: carousel.id, carousel: new_attributes }
        expect(response).to redirect_to([:admin, carousel])
      end
    end

    context "with invalid params" do

      let(:invalid_attributes) {
        { name: nil }
      }

      it "assigns the spree_admin as @spree_admin" do
        carousel = create(:carousel)
        spree_put :update, id: carousel.id, carousel: invalid_attributes
        expect(assigns(:carousel)).to eq(carousel)
      end

      it "re-renders the 'edit' template" do
        carousel = create(:carousel)
        spree_put :update, id: carousel.id, carousel: invalid_attributes
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested spree_admin" do
      carousel = create(:carousel)
      expect {
        spree_delete :destroy, id: carousel.id
      }.to change(Spree::Fairground::Carousel, :count).by(-1)
    end

    it "redirects to the carousels list" do
      carousel = create(:carousel)
      spree_delete :destroy, id: carousel.id
      expect(response).to redirect_to(admin_carousels_url)
    end
  end

end
