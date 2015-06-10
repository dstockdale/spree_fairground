class AddBodyNLinkToSpreeOwls < ActiveRecord::Migration
  def change
    add_column :spree_owls, :link, :string
    add_column :spree_owls, :body, :text
  end
end
