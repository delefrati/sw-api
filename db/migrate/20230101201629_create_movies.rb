class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :release_date
      t.string :original_url

      t.timestamps
    end
  end
end
