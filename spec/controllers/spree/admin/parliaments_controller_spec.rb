require 'spec_helper'

RSpec.describe Spree::Admin::ParliamentsController, type: :controller do

  stub_authorization!

  describe "GET #index" do
    it "assigns all parliaments as @parliaments" do
      parliament = create(:parliament)
      spree_get :index
      expect(assigns(:parliaments)).to eq([parliament])
    end
  end

  describe "GET #show" do
    it "assigns the requested spree_admin as @spree_admin" do
      parliament = create(:parliament)
      spree_get :show, id: parliament.id
      expect(assigns(:parliament)).to eq(parliament)
    end
  end

  describe "GET #new" do
    it "assigns a new spree_admin as @spree_admin" do
      spree_get :new
      expect(assigns(:parliament)).to be_a_new(Spree::Parliament)
    end
  end

  describe "GET #edit" do
    it "assigns the requested spree_admin as @spree_admin" do
      parliament = create(:parliament)
      spree_get :edit, id: parliament.id
      expect(assigns(:parliament)).to eq(parliament)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Spree::Parliament" do
        expect {
          spree_post :create, parliament: attributes_for(:parliament)
        }.to change(Spree::Parliament, :count).by(1)
      end

      it "assigns a newly created spree_admin as @spree_admin" do
        spree_post :create, parliament: attributes_for(:parliament)
        expect(assigns(:parliament)).to be_a(Spree::Parliament)
        expect(assigns(:parliament)).to be_persisted
      end

      it "redirects to the created spree_admin" do
        spree_post :create, parliament: attributes_for(:parliament)
        expect(response).to redirect_to([:admin, Spree::Parliament.last])
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved spree_admin as @parliament" do
        spree_post :create, parliament: attributes_for(:parliament, name: nil)
        expect(assigns(:parliament)).to be_a_new(Spree::Parliament)
      end

      it "re-renders the 'new' template" do
        spree_post :create, parliament: attributes_for(:parliament, name: nil)
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
        parliament = create(:parliament)
        spree_put :update, { id: parliament.id, parliament: new_attributes }
        parliament.reload
        expect(parliament.name).to eq("new_name")
      end

      it "assigns the requested spree_admin as @spree_admin" do
        parliament = create(:parliament)
        spree_put :update, { id: parliament.id, parliament: new_attributes }
        expect(assigns(:parliament)).to eq(parliament)
      end

      it "redirects to the spree_admin" do
        parliament = create(:parliament)
        spree_put :update, { id: parliament.id, parliament: new_attributes }
        expect(response).to redirect_to([:admin, parliament])
      end
    end

    context "with invalid params" do

      let(:invalid_attributes) {
        { name: nil }
      }

      it "assigns the spree_admin as @spree_admin" do
        parliament = create(:parliament)
        spree_put :update, id: parliament.id, parliament: invalid_attributes
        expect(assigns(:parliament)).to eq(parliament)
      end

      it "re-renders the 'edit' template" do
        parliament = create(:parliament)
        spree_put :update, id: parliament.id, parliament: invalid_attributes
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested spree_admin" do
      parliament = create(:parliament)
      expect {
        spree_delete :destroy, id: parliament.id
      }.to change(Spree::Parliament, :count).by(-1)
    end

    it "redirects to the parliaments list" do
      parliament = create(:parliament)
      spree_delete :destroy, id: parliament.id
      expect(response).to redirect_to(admin_parliaments_url)
    end
  end

end
