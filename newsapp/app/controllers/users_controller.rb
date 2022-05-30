class UsersController < ApplicationController
    def index
        @users = User.all.order(created_at: :asc)
        render json: @users
    end

    def create
        @users = User.create(users_params)    
        if @users.save
          render json: @users, status: :created, location: @users
        else
          render json: @users.errors, status: :unprocessable_entity
        end
      end    

    def update    
        if @users.update(users_params)      
          @users.save
          render json: @users
        else
          render json: @users.errors, status: :unprocessable_entity
        end
    end
end
