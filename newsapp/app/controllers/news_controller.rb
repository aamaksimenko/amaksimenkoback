class NewsController < ApplicationController
    def index
        @news = News.all.order(created_at: :asc)
        render json: @news
    end
end
