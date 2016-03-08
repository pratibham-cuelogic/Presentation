class Users::ConfirmationsController < Devise::ConfirmationsController

  layout 'admin/login'

  def show
    super do |resource|
      sign_in(resource)
    end
  end

  def after_confirmation_path_for(resource_name, resource)
    user_dashboard_path
  end


end