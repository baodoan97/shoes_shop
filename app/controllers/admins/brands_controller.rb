class Admins::BrandsController < BaseController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  # GET /brands
  # GET /brands.json
  def index
    @brands = Brand.all
  end

  # GET /brands/1
  # GET /brands/1.json
  def show
  end

  # GET /brands/new
  def new
    @brand = Brand.new
  end

  # GET /brands/1/edit
  def edit
  end

  # POST /brands
  # POST /brands.json
  def create
    @brand = Brand.new(brand_params)
    respond_to do |format|
      if @brand.save
        format.html { redirect_to admins_brands_path, notice: 'Brand was successfully created.' }
        format.json { render :show, status: :created, location: @brand }
      else
        format.html { render :new }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brands/1
  # PATCH/PUT /brands/1.json
  def update
    respond_to do |format|
      @brand.image_main_brand.purge if params[:brand][:image_main_brand] != nil
      @brand.image_effect_brand.purge if params[:brand][:image_effect_brand] != nil
      if @brand.update(brand_params)
        format.html { redirect_to admins_brands_path, notice: 'Brand was successfully updated.' }
        format.json { render :show, status: :ok, location: @brand }
      else
        @brand.image_main_brand.purge if @brand.errors[:image_main_brand] != nil
        @brand.image_effect_brand.purge if @brand.errors[:image_effect_brand] != nil
        render 'edit'
        format.html { render :edit }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.json
  def destroy
    @brand.update_attribute(:status, params[:status])
    update_status_model(@brand.products,params[:status])
    respond_to do |format|
      format.html { redirect_to admins_brands_path, notice: 'Brand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_brand
    @brand = Brand.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def brand_params
    params[:brand][:image_main_brand] =  Brand.resize_image_brand(params[:brand][:image_main_brand])
    params[:brand][:image_effect_brand] =  Brand.resize_image_brand(params[:brand][:image_effect_brand])
    params.require(:brand).permit(:brand_name, :image_main_brand, :image_effect_brand, :category_id)
  end
end
