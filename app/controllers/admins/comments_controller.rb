class Admins::CommentsController < BaseController
   skip_before_action :verify_authenticity_token

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

end