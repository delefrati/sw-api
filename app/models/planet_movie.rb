class PlanetMovie < ApplicationRecord
  belongs_to :planet
  belongs_to :movie
end
