module Accessible
    extend ActiveSupport::Concern
    included do
      before_action :check_user
    end
  
    protected
    def check_user
      if current_admin
        flash.clear
        # if you have rails_admin. You can redirect anywhere really
        redirect_to(rails_admin_path) 
      elsif current_user
        flash.clear
        # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
        redirect_to(categories_path) 
      end
    end
  end