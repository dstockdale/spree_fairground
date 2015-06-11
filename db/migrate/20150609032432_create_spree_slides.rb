class CreateSpreeSlides < ActiveRecord::Migration
  def change
    create_table :spree_slides do |t|
      t.integer :attachment_width
      t.integer :attachment_height
      t.integer :attachment_file_size
      t.integer :position
      t.string :attachment_content_type
      t.string :attachment_file_name
      t.datetime :attachment_updated_at
      t.string :alt
      t.integer :carousel_id
      t.integer :featurable_id
      t.string :featurable_type

      t.timestamps null: false
    end
    add_index :spree_slides, :featurable_id
  end
end
