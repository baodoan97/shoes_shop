class Admins::NewsController < BaseController
  before_action :set_new, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /new
  # GET /new.json
  def index
    @news = New.all
  end

  # GET /new/1
  # GET /new/1.json
  def show
  end

  # GET /new/new
  def new

    @new = New.new

  end

  # GET /new/1/edit
  def edit
  end

  # POST /new
  # POST /new.json
  def create
    @new = New.new(new_params)
    respond_to do |format|
      if @new.save
        format.html { redirect_to admins_news_path(@new), notice: 'New was successfully created.' }
        format.json { render :show, status: :created, location: admins_news_path(@new) }
      else
        format.html { render :new }
        format.json { render json: @new.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new/1
  # PATCH/PUT /new/1.json
  def update
    respond_to do |format|
      if @new.update(new_params)
        format.html { redirect_to admins_news_path(@new), notice: 'New was successfully updated.' }
        format.json { render :show, status: :ok, location: @new }
      else
        format.html { render :edit }
        format.json { render json: @new.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new/1
  # DELETE /new/1.json
  def destroy
    @new.update_attribute(:status, params[:status])
    respond_to do |format|
      format.html { redirect_to admins_news_index_path, notice: 'News was change status.' }
      format.json { head :no_content }
    end
  end

  def search_products_for_news
      @products = Product.where('name LIKE ?', "%#{params[:info][:name]}%").limit(5)


  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_new
    @new = New.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def new_params
    if params[:new][:product_ids] != nil
    params[:new][:product_ids].uniq!
    params[:new][:product_ids].join.to_i


  end
    params.require(:new).permit(:title, :body,:news_type_for_shoe_id,product_ids: [])
  end
end
