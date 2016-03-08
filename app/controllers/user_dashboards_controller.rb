class UserDashboardsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:thank_you]

  def index
    return redirect_to user_dashboard_path
  end

  # Current user set for online test
  def user_set
    return redirect_to :back if current_user.current_set.blank?
    current_user.current_set.update_attributes(start_time: Time.now)
    @question_sets = current_user.current_set.question_sets
  end

  # Submit answer on next
  def submit_answer
    QuestionSet.submit_question_answer(params)
    if params[:question_number].to_i ==  MAXIMUM_QUESTION_LIMIT
      current_user.submit_answers
      return render js: "window.location = '#{thank_you_path}'"
    end
    render nothing: true
  end

  # Test time is over
  def timeis_up
    current_user.submit_answers
    render text: true
  end

end
