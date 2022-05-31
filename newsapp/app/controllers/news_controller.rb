class NewsController < ApplicationController
  before_action :set_news, only: %i[ update ]    
  
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

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:author_id])
    end

    # Only allow a list of trusted parameters through.
    def news_params
      params.require(:news).permit(:title, :image, :article, :tag, :author, :user_id)
    end
end
