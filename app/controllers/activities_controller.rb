class ActivitiesController < ApplicationController

    
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index 
        render json: Activity.all, status: :ok
    end

    def destroy
        Activity.find(params[:id]).destroy
        head :no_content
    end
    
    private



    def render_not_found(error)
        render json: {error: "Activity not found"}, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end
end
