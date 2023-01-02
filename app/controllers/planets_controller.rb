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
        Rails.logger.debug "Planet removed: ID = #{params[:id]} "
        render json: {"message": "Removed"}
    rescue StandardError => e
        Rails.logger.error "User tried to remove the planet #{params[:id]} but it yeld an error: #{e.inspect}"
    end
    
    private 
    def set_planet
        @planet = Planet.select('planets.*, GROUP_CONCAT(movies.title) AS movies').left_outer_joins(:movies).group("planets.id").find(params[:id])
        Rails.logger.debug "Single planet set: ID = #{@planet.id}"
    rescue StandardError => e
        Rails.logger.error "User tried to get the planet #{params[:id]} but it yeld an error: #{e.inspect}"
    end
    def set_planets
        if (params.include?(:search))
            @planets = Planet.select('planets.*, GROUP_CONCAT(movies.title) AS movies').left_outer_joins(:movies).group("planets.id").where("name like ?", "%" + params[:search] + "%")
        else
            @planets = Planet.select('planets.*, GROUP_CONCAT(movies.title) AS movies').left_outer_joins(:movies).group("planets.id").all
        end
        Rails.logger.debug "Multiple planets set: TOTAL = #{@planets.count}"
    rescue StandardError => e
        Rails.logger.error "User tried to get a list of planets but it yeld an error: #{e.inspect}"
    end
end
