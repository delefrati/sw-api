class Movie < ApplicationRecord
    has_many :planet_movies, dependent: :destroy
    has_many :planets, through: :planet_movies
end
