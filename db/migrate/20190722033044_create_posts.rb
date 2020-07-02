class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :content
      t.integer :view
      t.references :user, foreign_key: true
      t.references :travel_place, foreign_key: true

      t.timestamps
    end
     add_index :posts, [:user_id, :created_at]
  end
end