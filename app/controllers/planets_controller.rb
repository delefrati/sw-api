class PlanetsController < ApplicationController
    def index
        render json: Planet.select('planets.*, GROUP_CONCAT(movies.title) AS movies').left_outer_joins(:movies).group("planets.id").all
    end
    def movie
        render json: Movie.all
    end
end
