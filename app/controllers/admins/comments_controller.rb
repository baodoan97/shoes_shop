class Admins::CommentsController < BaseController
   skip_before_action :verify_authenticity_token

    def new
          @listcomments = Comment.all.where(display: false)
    end
    def newcomment
        @comment = { "product_id" => params[:data][:comment][:comment][:product_id], 
        "user_id" => params[:data][:comment][:comment][:user_id],
        "content" =>params[:data][:comment][:comment][:content]}
	  end
     
     def returncomment
         
         @comment = nil
         @notification = nil
         if params[:comment][:request] == 'delete'
            Comment.find(params[:comment][:id].to_i).destroy
         else
            @comment = Comment.find(params[:comment][:id].to_i)
            @comment.display = true 
            @comment.save

            @notification = Notification.new
            @notification.user = @comment.user
            @notification.content = "comment on product #{@comment.product.name} was browse"
            @notification.save
         end

     
     end

end