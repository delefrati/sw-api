class Planet < ApplicationRecord
    has_many :planet_movies, dependent: :destroy
    has_many :movies, through: :planet_movies
end
