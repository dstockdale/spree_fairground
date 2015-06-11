class AddSlideTypeToSpreeSlides < ActiveRecord::Migration
  def change
    add_column :spree_slides, :slide_type, :string, default: "image"
    add_index :spree_slides, :slide_type
  end
end
