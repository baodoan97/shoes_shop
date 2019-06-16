class Admins::CarouselsController < BaseController
  before_action :set_carousel , only: [:edit,:update, :show,:destroy]
  def new
    @carousel = Carousel.new
  end

  def create
    @carousel = Carousel.new(carousel_params)
    case @carousel.save
    when true
      redirect_to admins_carousels_path
    when false
      render 'new'
    end
  end

  def edit

  end

  def update
    @carousel.image.purge if params[:carousel][:avatar] != nil
    case @carousel.update(carousel_params)
    when true
      redirect_to admins_carousels_path
    when false
      @carousel.image.purge if @carousel.errors[:image] != nil
      render 'edit'
    end
  end

  def index
    @carousels = Carousel.all.order("created_at DESC")
  end

  def show

  end

  def destroy
    @carousel.destroy
    redirect_to admins_carousels_path
  end

  private
  def carousel_params
    params[:carousel][:new_id] = nil if params[:carousel][:new_id] == 0
    params.require(:carousel).permit(:new_id, :image,:display,:main)
  end
  def set_carousel
    @carousel = Carousel.find(params[:id])
  end
end
