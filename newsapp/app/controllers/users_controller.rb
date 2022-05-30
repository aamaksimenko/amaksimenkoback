class UsersController < ApplicationController
    def index
        @users = User.all.order(created_at: :asc)
        render json: @users
    end
end
