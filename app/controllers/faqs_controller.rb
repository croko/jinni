class FaqsController < ApplicationController
  skip_before_action :require_login

  def index
     @faqs = Faq.published
  end
end
