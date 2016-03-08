class StaticPagesController < ApplicationController

  skip_before_action :authenticate_user!, :check_website_access

end
