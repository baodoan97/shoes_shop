class CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token
	def new
      
	end

	def create
		 @check = false
		 @comment = nil
		 if user_signed_in? == true
		 	 @check = true
	         @comment = Comment.new
		     @comment.content = params[:comment][:content]
		     @comment.user = current_user
		     @comment.product = Product.find(params[:product][:product_id])
		     @comment.save
		 end
		     # respond_to do |format|
		     #   	format.html 
		     #   	format.js
		     #   end
    end
    
    def watchedmore
      @comments = Comment.where(product_id: params[:info][:product_id].to_i).where(display: true).order('updated_at desc').limit(5).offset(params[:info][:offset].to_i)
    end


end
