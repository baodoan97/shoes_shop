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

    @list_new_message = reload_new_messages.flatten

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show

    @list_new_message = []
    @list_new_message = reload_new_messages.flatten


  end

  def index
    @list = []
    @messages = Message.order("created_at DESC").all.uniq{|e| e[:user_id] }
    @messages.each {|v|

      @list.push(User.find(v.user.id))
    }
  end

  def received
    @content = Message.where(user_id: params[:data][:message][:message][:user_id].to_i).last.content
    @list_new_message = reload_new_messages.flatten

  end

  private

  def set_user_message
    @messages = Message.all.where(user_id: params[:id]).order('created_at desc').limit(10).reverse
    @message = Message.new
  end

  def reload_new_messages
    @list_new_message = []
    @list_messages = Message.order("created_at DESC").all.uniq{|e| e[:user_id] }
    @list_messages.each {|v|
      if v.user.messages.last.usersend == true
        @list_new_message.push(User.find(v.user.id))
      end
    }
    @list_new_message
  end


end
