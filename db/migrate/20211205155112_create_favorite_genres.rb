class CreateFavoriteGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_genres do |t|
      t.string :genre_name,null:false
      t.integer :genre_id,null:false
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :favorite_genres, [:genre_name, :user_id], unique: true   
  end
end
