class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.references :user 
      t.references :category
      t.boolean :active

      t.timestamps
    end
  end
end
