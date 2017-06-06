class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end
  

  # def after_sign_in_path_for(resource_or_scope)
  #   # binding.pry
  #   if resource_or_scope.has_role? :admin
  #     main_home_url
  #   else
  #     doctor_main_url
  #   end
  # end

  # def after_sign_in_path_for(resource_or_scope)
  #   # binding.pry
  #   if resource_or_scope.has_role? :admin
  #     new_patient_url
  #  end
  # end
  def after_sign_in_path_for(resource)
    if (current_user.email != "admin@gmail.com")
      doctor_main_path
    else
 	  stored_location_for(resource) || main_home_path
    end
  end

 def after_sign_out_path_for(resource_or_scope)
 	new_user_session_path
 end
  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
