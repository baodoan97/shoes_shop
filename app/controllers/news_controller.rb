class NewsController < ApplicationController
  before_action :set_params, only: [:show]
  before_action :set_params_category, only: [:news_category]
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

  def news_category
      
  end

  private

  def set_params_category
     redirect_to news_index_path if params[:type] == " " || NewsTypeForShoe.find_by_name(params[:type]) == nil
     @news_category = NewsTypeForShoe.all.find_by_name(params[:type]).new.order("created_at DESC").paginate(page: params[:news_category], per_page: 10)
  end

  def set_params
    @news =  params[:type] == " " ? New.all : NewsTypeForShoe.find_by_name(params[:type]).new
    @item = nil
    @news.each{ |item|
        if item[:title].gsub(%r{</?[^>]+?>|[^A-Za-z0-9 ]}, '') == params[:title]
            @item = New.find(item[:id])
            break
        end  
    }
     redirect_to news_index_path if @item == nil

  end

end
