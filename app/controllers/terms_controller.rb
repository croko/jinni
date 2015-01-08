class TermsController < ApplicationController
  skip_before_action :require_login, only: [:show]

  def show
    @terms = Term.first
  end
end
