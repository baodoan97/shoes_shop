class Admins::MessagesController < BaseController

	before_action :set_user_message , only: [:show]

    
    def create
    	# debugger
		   @message = Message.new
	       @message.content = params[:post][:content]
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
        @messages = Message.order("created_at DESC").all.uniq{|e| e[:user_id] }
        # @messages.select(:user_id).uniq
        # Client.select(:name).uniq
        @messages.each {|v|
            
                 @list.push(User.find(v.user.id)) 
        }
        # .order("created_at DESC").all
	end
	private
	def set_user_message
        @messages = Message.all.where(user_id: params[:id])
        @message = Message.new
	end


end