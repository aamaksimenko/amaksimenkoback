class UsersController < ApplicationController
  before_action :set_user, only: %i[ update ] 

  def index
        users = User.all.order(created_at: :asc)
        render json: users
  end

  def update    
      if @users.update(user_params)      
        @users.save
        render json: @users
      else
        render json: @users.errors, status: :unprocessable_entity
      end
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation,
        personal_info_attributes: [:id, :name, :login, :avatar])
      # params.require(:user).permit(:name, :login, :email, :password, :avatar)
    end
end
