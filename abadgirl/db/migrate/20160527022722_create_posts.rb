class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :photo_url
      t.string :title
      t.string :body
      t.string :category
      t.string :item_1
      t.string :item_2
      t.string :item_3
      t.boolean :beauty_post
      t.boolean :fashion_post

      t.timestamps null: false
    end
  end
end
