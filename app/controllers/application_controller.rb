class ApplicationController < ActionController::Base

    def homepage
        puts "\n\n\nwe have hit the homepage controller\n\n\n"
        render :homepage
    end
end
