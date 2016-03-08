class Admin::QuestionsController < BaseAdminController

  def index
    if params[:tech_id] && !params[:tech_id].blank?
      @questions = Question.where(technology_id: params[:tech_id]).paginate(:page => params[:page], :per_page => 10)
    else
      @questions = Question.paginate(:page => params[:page], :per_page => 10)
    end

  end

end
