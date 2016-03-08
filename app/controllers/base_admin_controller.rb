class BaseAdminController < ApplicationController

  layout 'admin/dashboard'
  before_action :check_admin
  before_action :set_resource, only: [:delete,:update,:edit]

  # Check if user is admin
  def check_admin
    return redirect_to user_dashboard_path unless current_user.is_admin?
  end

  # This method is common for each controller and will dispatch response base upon resource
  def new
    @entity = resource_class.new
  end

  # Create new record
  def create
    entity = resource_class.new_record(resource_params,current_user)
    redirect_with(entity,resource_name,'create',params)
  end

  # Edit record
  def edit
    @entity = set_resource
  end

  # Update record
  def update
    update_entity = set_resource.update_record(resource_params)
    if update_entity
      redirect_to :back
    else
      render :edit
    end
  end

  # Get the list of records
  def index
    if params[:search_string].present?
      @list = resource_class.search(current_user,params[:search_string]).paginate(page: params[:page], per_page: DEFAULT_PER_PAGE)
    else
      @list = resource_class.get_list(current_user,params).paginate(page: params[:page], per_page: DEFAULT_PER_PAGE)
    end
    @count = @list.count
    @per_page = DEFAULT_PER_PAGE
  end

  # This method will inactive a record rather than deleting it
  def destroy
    if params[:entity]=='LeadStage' || params[:entity]=='EmailSequence' || resource_class.name == 'Note'
      set_resource.delete_record(current_user) if set_resource.present?
    else
      set_resource.archive_record(current_user) if set_resource.present?
    end

    if params[:request_type].present?
      if params[:delete_lead] == "true"
        render text: 'Delete Lead'
      else
        render nothing: true
      end
    else
      redirect_to :back
    end
  end


end
