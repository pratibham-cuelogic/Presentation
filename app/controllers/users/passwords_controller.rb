class Users::PasswordsController < Devise::PasswordsController

  layout 'admin/login'


  # POST /resource/password
  def create
    user = User.where(email: params[:user][:email]).last
    if user.present? && !user.is_admin?
      return redirect_to thank_you_path
    end
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    new_session_path(resource_name,password_reset_link: 'sent') if is_navigational_format?
  end

end