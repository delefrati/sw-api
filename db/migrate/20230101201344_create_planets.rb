class CreatePlanets < ActiveRecord::Migration[7.0]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :climate
      t.string :terrain

      t.timestamps
    end
  end
end
