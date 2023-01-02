class PlanetsController < ApplicationController
    before_action :set_planets, only: [:index]
    before_action :set_planet, only: [:show]

    def index
        render json: @planets
    end
    
    def show
        render json: @planet
    end

    def destroy
        Planet.destroy(params[:id])
        render json: {"message": "Removed"}
    end
    
    private 
    def set_planet
        @planet = Planet.select('planets.*, GROUP_CONCAT(movies.title) AS movies').left_outer_joins(:movies).group("planets.id").find(params[:id])
    end
    def set_planets
        if (params.include?(:search))
            @planets = Planet.select('planets.*, GROUP_CONCAT(movies.title) AS movies').left_outer_joins(:movies).group("planets.id").where("name like ?", "%" + params[:search] + "%")
        else
            @planets = Planet.select('planets.*, GROUP_CONCAT(movies.title) AS movies').left_outer_joins(:movies).group("planets.id").all
        end
    end
end
