class SignupsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity


    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created

    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
    def render_not_found(error)
        render json: {error: "Activity not found"}, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
