class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # after_filter :clear_sign_signout_flash, :only => [:create, :destroy]

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_welcome_path
    else
      new_search_path
    end
  end



protected

  # def clear_sign_signout_flash
  #   if flash.keys.include?(:notice)
  #     flash.delete(:notice)
  #   end
  # end

end
