class AddSlideTypeToSpreeOwls < ActiveRecord::Migration
  def change
    add_column :spree_owls, :slide_type, :string, default: "image"
    add_index :spree_owls, :slide_type
  end
end
