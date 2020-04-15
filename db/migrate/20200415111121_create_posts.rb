class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :image_id
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :description

      t.timestamps
    end
  end
end
