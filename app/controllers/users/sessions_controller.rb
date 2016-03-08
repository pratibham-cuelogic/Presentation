class Users::SessionsController < Devise::SessionsController

  layout 'admin/login'

  def after_sign_in_path_for(resource)
    admin_dashboard_path
  end

end