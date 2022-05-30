class NewsController < ApplicationController
    def index
        @news = News.all.order(created_at: :asc)
        render json: @news
    end

    def create
        @news = News.create(news_params)    
        if @news.save
          render json: @news, status: :created, location: @news
        else
          render json: @news.errors, status: :unprocessable_entity
        end
      end    

    def update    
        if @news.update(news_params)      
          @news.save
          render json: @news
        else
          render json: @news.errors, status: :unprocessable_entity
        end
    end

      
end
