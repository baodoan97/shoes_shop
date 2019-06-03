class NewsController < ApplicationController
  before_action :set_params, only: [:show]
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

  private
  def set_params
    @news =  NewsTypeForShoe.find_by_name(params[:type]).new
    @item = nil
    @news.each{ |item|
        if item[:title].gsub(%r{</?[^>]+?>|[^A-Za-z0-9 ]}, '') == params[:title]
            @item = New.find(item[:id])
            break
        end  
    }

  end

end
