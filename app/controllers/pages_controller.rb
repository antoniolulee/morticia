class PagesController < ApplicationController
    before_action :authenticate_user!, only: %i[ my_operations ]

    def about
        
    end
    
   

end