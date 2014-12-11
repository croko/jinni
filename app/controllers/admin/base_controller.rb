class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter :verify_admin

	private

	  def verify_admin
      require_login
	    redirect_to root_url unless logged_in? && current_user.admin?
	  end

end