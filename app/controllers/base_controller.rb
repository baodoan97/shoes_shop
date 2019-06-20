class BaseController < ActionController::Base
    layout "layouts/admin"
    helper_method :update_status_model

      def update_status_model(model,status)
     model.map do |item|
       item.update_attribute(:status, status)
     end
  end
end