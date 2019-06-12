class PagesController < ApplicationController
    def home
      @count_carousel = 0
      @list_carousel = Carousel.all.where(display: true)
    end

    def contact
        #debugger
        @contact = Contact.new
    end

    def about

    end
end