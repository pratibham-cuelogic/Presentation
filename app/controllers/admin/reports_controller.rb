class Admin::ReportsController < BaseAdminController

  def candidate_reports
    if params[:technology_id] && !params[:technology_id].blank?
      @candidate_reports = UserSet.where(technology_id: params[:technology_id]).paginate(:page => params[:page], :per_page => 10)
    else
      @candidate_reports = UserSet.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def index
    #render :nothing => true
    redirect_to :back
  end

end
