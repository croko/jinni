class AgreementsController < ApplicationController
  skip_before_action :require_login, only: [:show]

  def show
    @agreement = Agreement.first
  end
end
