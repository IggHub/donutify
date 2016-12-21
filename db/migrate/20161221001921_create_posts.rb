class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :phone
      t.string :image_url
      t.boolean :open
      t.string :location
      t.string :name
      t.decimal :rating

      t.timestamps
    end
  end
end
