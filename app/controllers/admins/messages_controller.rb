class Admins::MessagesController < BaseController
    skip_before_action :verify_authenticity_token

	before_action :set_user_message , only: [:show]

    def watchedmore
        @messages = Message.where(user_id: params[:info][:user_id].to_i).order('created_at desc').limit(10).offset(params[:info][:offset].to_i) 
    end

    def create
    	# debugger
		   @message = Message.new
	       @message.content = params[:post][:content].gsub(/[\r\n]/, '<br />')
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
    
     def received
            @content = Message.where(user_id: params[:data][:message][:message][:user_id].to_i).last.content
    end

	private
	def set_user_message
        @messages = Message.all.where(user_id: params[:id]).order('created_at desc').limit(10).reverse
        @message = Message.new
	end


end