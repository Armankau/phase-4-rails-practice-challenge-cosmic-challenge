class ScientistsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


    def index
        render json: Scientist.all, status: :ok
    end

    def show
        scientist = Scientist.find(params[:id])
        render json: scientist, serializer: ScientistWithPlanetSerializer
    end

    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    def update
        scientist = Scientist.find(params[:id])
        scientist.update!(scientist_params)
        render json: scientist, status: :accepted
    end

    def destroy
        scientist = Scientist.find(params[:id])
        scientist.destroy
    end
    private 

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

    # def render_not_found_response
    #     render json: { error: "Scientist not found" }, status: :not_found
    # end

    # def render_unprocessable_entity_response(exception)
    #     render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    # end
end