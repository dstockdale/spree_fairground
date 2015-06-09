class CreateSpreeAdminParliaments < ActiveRecord::Migration
  def change
    create_table :spree_parliaments do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :spree_parliaments, :name, unique: true
  end
end
