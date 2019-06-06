class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @message = Message.new
    @message.content = params[:message][:content].gsub(/[\r\n]/, '<br />')
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
    @content = Message.where(user_id: params[:data][:message][:message][:user_id].to_i).last.content
  end
  def watchedmore
    @messages = Message.where(user_id: params[:info][:user_id].to_i).order('created_at desc').limit(10).offset(params[:info][:offset].to_i)
  end
end
