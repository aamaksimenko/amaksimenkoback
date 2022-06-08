class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    private
  
    def respond_with(resource, _opts = {})
      if register_success && resource.persisted? 
        return resource.persisted?
      else
        return register_failed
      end
    end
  
    def register_success
      render json: {
          message: 'Signed up sucessfully.',
          user: current_user
        }, status: :ok
    end
  
    def register_failed
      render json: { message: "Something went wrong." }, status: :unprocessable_entity
    end
end