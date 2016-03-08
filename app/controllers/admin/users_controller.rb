class Admin::UsersController < BaseAdminController

  # Send invitation to user
  def send_invitation_to_candidate
    if params[:user_type] == 'new'
      User.send_invitation(params, current_user)
    else
      user = User.where(email: params[:email]).last
      User.resend_invitation_to_user(user, current_user, params) if user.present?
    end
    redirect_to :back
  end

  def online_candidates
    @online_candidate = User.online_users
  end

  def candidates
    @candidates = User.of_type("candidate")
    @online_user_ids = User.online_users.collect(&:email)
  end

  def check_user
    if params[:user_type] == 'exist'
      @emails = User.of_type("candidate").collect(&:email)
    end
    render partial: 'admin/reports/email_field'
  end

end
