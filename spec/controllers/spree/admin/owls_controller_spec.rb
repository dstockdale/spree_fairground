require 'spec_helper'

RSpec.describe Spree::Admin::OwlsController, type: :controller do

  stub_authorization!

  describe "GET #index" do
    it "assigns all owls as @owls" do
      parliament = create(:parliament)
      owl = create(:owl, parliament: parliament)
      spree_get :index, parliament_id: parliament.id
      expect(assigns(:parliament)).to eq(parliament)
      expect(assigns(:owls)).to eq([owl])
    end
  end

  describe "GET #show" do
    it "assigns the requested owl as @owl" do
      parliament = create(:parliament)
      owl = create(:owl, parliament: parliament)
      spree_get :show, parliament_id: parliament.id, id: owl.id
      expect(assigns(:owl)).to eq(owl)
    end
  end

  describe "GET #new" do
    it "assigns a new owl as @owl" do
      parliament = create(:parliament)
      spree_get :new, parliament_id: parliament.id
      expect(assigns(:owl)).to be_a_new(Spree::Owl)
    end
  end

  describe "GET #edit" do
    it "assigns the requested owl as @owl" do
      parliament = create(:parliament)
      owl = create(:owl, parliament: parliament)
      spree_get :edit, parliament_id: parliament.id, id: owl.id
      expect(assigns(:owl)).to eq(owl)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Spree::Owl" do
        parliament = create(:parliament)
        expect {
          spree_post :create, parliament_id: parliament.id, owl: attributes_for(:owl)
        }.to change(Spree::Owl, :count).by(1)
      end

      it "assigns a newly created owl as @owl" do
        parliament = create(:parliament)
        spree_post :create, parliament_id: parliament.id, owl: attributes_for(:owl)
        expect(assigns(:owl)).to be_a(Spree::Owl)
        expect(assigns(:owl)).to be_persisted
      end

      it "redirects to the collection" do
        parliament = create(:parliament)
        spree_post :create, parliament_id: parliament.id, owl: attributes_for(:owl)
        expect(response).to redirect_to(admin_parliament_path(parliament))
      end
    end

    context "with invalid params" do

      let(:invalid_attributes) {
        attributes_for(:owl, { attachment_file_name: nil } )
      }

      it "assigns a newly created but unsaved owl as @owl" do
        parliament = create(:parliament)
        spree_post :create, parliament_id: parliament.id, owl: invalid_attributes
        expect(assigns(:owl)).to be_a_new(Spree::Owl)
      end

      it "re-renders the 'new' template" do
        parliament = create(:parliament)
        spree_post :create, parliament_id: parliament.id, owl: invalid_attributes
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      let(:new_attributes) {
        { alt: "new_alt" }
      }

      it "updates the requested owl" do
        parliament = create(:parliament)
        owl = create(:owl, parliament: parliament)
        spree_put :update, { parliament_id: parliament.id, id: owl.id, owl: new_attributes }
        owl.reload
        expect(owl.alt).to eq("new_alt")
      end

      it "assigns the requested owl as @owl" do
        parliament = create(:parliament)
        owl = create(:owl, parliament: parliament)
        spree_put :update, { parliament_id: parliament.id, id: owl.id, owl: new_attributes }
        expect(assigns(:owl)).to eq(owl)
      end

      it "redirects to the owl" do
        parliament = create(:parliament)
        owl = create(:owl, parliament: parliament)
        spree_put :update, { parliament_id: parliament.id, id: owl.id, owl: new_attributes }
        expect(response).to redirect_to(admin_parliament_owl_path(parliament, owl))
      end
    end

    context "with invalid params" do

      let(:invalid_attributes) {
        { attachment_file_name: nil }
      }

      it "assigns the owl as @owl" do
        parliament = create(:parliament)
        owl = create(:owl, parliament: parliament)
        spree_put :update, { parliament_id: parliament.id, id: owl.id, owl: invalid_attributes }
        expect(assigns(:owl)).to eq(owl)
      end

      it "re-renders the 'edit' template" do
        parliament = create(:parliament)
        owl = create(:owl, parliament: parliament)
        spree_put :update, { parliament_id: parliament.id, id: owl.id, owl: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested owl" do
      parliament = create(:parliament)
      owl = create(:owl, parliament: parliament)
      expect {
        spree_delete :destroy, { parliament_id: parliament.id, :id => owl.id }
      }.to change(Spree::Owl, :count).by(-1)
    end

    it "redirects to the owls list" do
      parliament = create(:parliament)
      owl = create(:owl, parliament: parliament)
      spree_delete :destroy, { parliament_id: parliament.id, :id => owl.id }
      expect(response).to redirect_to(admin_parliament_path(parliament))
    end
  end

end
