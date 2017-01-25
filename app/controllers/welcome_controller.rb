class WelcomeController < ApplicationController

    def index
      if current_user
        redirect_to users_dashboard_url
      end
    end
    
end
