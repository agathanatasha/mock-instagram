class Users::RegistrationsController < Devise::RegistrationsController
    before_action :config_permitted_parameters
    
    private
        def config_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :website, :bio, :phone, :gender] )
        end
end