class MessagesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
		   @message = Message.new
	       @message.content = params[:message][:content]
	       @message.user = User.find(params[:user_id][:user_id])
	       @message.admin = Admin.first
	       @message.usersend = params[:user_send][:usersend]
	       @message.save
	       respond_to do |format|
	       	format.html 
	       	format.js
	       end
	       # debugger
	       # respond_to(:js)       
	end
	def show

	end
    def received

    end

    


end