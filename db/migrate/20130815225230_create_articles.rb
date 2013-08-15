class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :description
      t.money :price
      t.integer :total_in_shelf, default: 0, null: false
      t.integer :total_in_vault, default: 0, null: false
      t.integer :store_id, null: false

      t.timestamps
    end
  end
end
