class PagesController < ApplicationController
    def home
      
    end

    def contact
        #debugger
        @contact = Contact.new
    end
end