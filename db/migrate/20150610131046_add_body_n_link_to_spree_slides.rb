class AddBodyNLinkToSpreeSlides < ActiveRecord::Migration
  def change
    add_column :spree_slides, :link, :string
    add_column :spree_slides, :body, :text
  end
end
