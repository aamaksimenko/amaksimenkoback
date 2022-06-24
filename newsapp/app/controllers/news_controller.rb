class NewsController < ApplicationController    
  
  def index
        news = News.all.order(created_at: :asc)
        render json: news
    end

    def create
        news = News.new(news_params.merge(:user_id => current_user.id, :author => current_user.name))    
        if news.save
          render json: news, status: :created, location: news
        else
          render json: news.errors, status: :unprocessable_entity
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

    private

    # Only allow a list of trusted parameters through.
    def news_params
      params.permit(:title, :article, :tag, :image)
    end

    def serialize(news)
      news.attributes.merge(author: news.user.name)
    end

end
