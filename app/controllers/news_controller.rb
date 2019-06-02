class NewsController < ApplicationController
  def index
  	if params[:news_page] == nil || params[:news_page].to_i == 1
  	   @news = New.all.order("created_at DESC").paginate(page: params[:news_page], per_page: 3)
  	   @news = @news.where.not(id: @news.first.id)
    else
      	@news = New.all.order("created_at DESC").paginate(page: params[:news_page], per_page: 3)
    end	

  end

  def show
  end
end
