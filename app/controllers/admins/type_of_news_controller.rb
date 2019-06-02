class Admins::TypeOfNewsController < BaseController
  before_action :set_params, only: [:show,:edit,:update,:destroy]

  def index
    @list_type_of_news = NewsTypeForShoe.all
  end

  def new
    @type_of_news = NewsTypeForShoe.new
  end

  def create
    @type_of_new = NewsTypeForShoe.new(type_of_news_params)
    if @type_of_new.save
      redirect_to admins_type_of_news_index_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    debugger
    if @type_of_news.update(type_of_news_params)
      redirect_to admins_type_of_news_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @type_of_news.destroy
  end

  private
  def set_params
    @type_of_news = NewsTypeForShoe.find(params[:id])
  end
  def type_of_news_params
    params.require(:news_type_for_shoe).permit(:name)
  end

end
