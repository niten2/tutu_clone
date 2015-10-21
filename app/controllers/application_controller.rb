class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_welcome_path
    else
      new_search_path
    end
  end


end
