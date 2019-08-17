class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    private
        def not_found
            @error = {
                title: "Sorry, this page isn't available (404).", 
                description: "The link you followed may be broken, or the page may have been removed."
            }
            render "layouts/http_status_error", status: 404
        end

end
