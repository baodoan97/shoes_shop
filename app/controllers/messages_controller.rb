class MessagesController < ApplicationController
	before_action :set_user_message , only: [:show]
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

    def createmsgadmin
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
	def index
        @list = []
        User.all.each {|v|
           if v.messages != nil
                 @list.push(v);
           end
        }
	end
	private
	def set_user_message
        @messages = Message.all.where(user_id: params[:id])
	end


end