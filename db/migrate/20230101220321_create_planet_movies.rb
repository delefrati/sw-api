class CreatePlanetMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :planet_movies do |t|
      t.references :planet, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
