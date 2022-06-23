class UsersController < ApplicationController
  before_action :set_user, only: %i[ update ] 

  def index
        users = User.all.order(created_at: :asc)
        render json: users
  end

  def show_current_user
        user = current_user
        news = current_user.news
        render json: {
          user: user,
          news: news
        }
  end

  def update    
      if @user.update(user_params)      
        @user.save
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
