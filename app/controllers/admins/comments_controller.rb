class Admins::CommentsController < BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_comment, only: [:show]
  before_action :set_comment_destroy, only: [:destroy]
  def index
    @product = Product.all
  end

  def show
    if @listcomment.count == 0
      redirect_to admins_comments_path
    end
  end

  def new
    @listcomments = Comment.all.where(display: false)
  end
  def newcomment
    @comment = Comment.where(product_id: params[:data][:comment][:comment][:product_id].to_i).last
  end

  def returncomment

    @comment = nil
    @notification = nil
    @check = false
    if params[:comment][:request] == 'delete'
      @comment =  Comment.find(params[:comment][:id].to_i).destroy
      @notification = Notification.new
      @notification.user = @comment.user
      @notification.content = "violation of regulations comment on product #{@comment.product.name}"
      @notification.save
    else
      @comment = Comment.find(params[:comment][:id].to_i)
      @comment.display = true
      @comment.save

      @notification = Notification.new
      @notification.user = @comment.user
      @notification.content = "comment on product #{@comment.product.name} was browse"
      @notification.save
      @check = true
    end


  end

  def destroy
    @comment.destroy
    respond_to do |format|
                flash[:notice] = "Comments successfully destroyed"

          format.js {render inline: "location.reload();" }
    end

  end

  private

  def set_comment_destroy
    @comment = Comment.find(params[:id])
  end
  def set_comment
    @listcomment = Product.find(params[:id]).comments.order('updated_at desc')
  end

end
