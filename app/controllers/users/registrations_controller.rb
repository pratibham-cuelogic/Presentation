class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  def new
    return redirect_to user_session_path
  end

end