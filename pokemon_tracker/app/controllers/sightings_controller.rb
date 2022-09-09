class SightingsController < ApplicationController
    def index
        sightings = Sighting.all.where(date: params[:start_date]..params[:end_date]) 
        render json: sightings, include: [:animal]
    end

    def show
        sighting = Sighting.find(params[:id])
        render json: sighting, include: [:animal]
    end

    def create
        sighting = Sighting.create(animal_params)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end

    def destroy
        sighting = Sighting.find(params[:id])
        if sighting.destroy
            render json: sighting
        else
            render json: sighting.errors
        end
    end

    def update
        sighting = Sighting.find(params[:id])
        sighting.update(sighting_params)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end

    private
    def sighting_params
        params.require(:sighting).permit(:latitude, :longitude, :date, :start_date, :end_date)
    end
end
