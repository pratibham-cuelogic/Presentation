class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token
  include Concerns::ExceptionHandler
  before_action :authenticate_user!
  before_action :check_website_access, if: proc { user_signed_in? && params[:action]!= 'thank_you'}
  before_action :set_last_seen_at, if: proc { user_signed_in? && (session[:last_seen_at] == nil || session[:last_seen_at] < 5.minutes.ago) }

  # Check site access for user
  def check_website_access
    return redirect_to thank_you_path if current_user.status == NO_ACCESS
  end

  private
  # Update last seen for online users
  def set_last_seen_at
    current_user.update_attribute(:last_seen_at, Time.now)
    session[:last_seen_at] = Time.now
  end

end
