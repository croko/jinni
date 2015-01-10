module Shareable
  extend ActiveSupport::Concern

  included do
    after_save :post_to_socials
  end

  def post_to_socials
    unless shared
      if user.authentications.facebook.any? && share
        post_to_facebook
      end
    end
  end

  def post_to_facebook
    token = user.authentications.facebook.first.access_token
    if token.present?
      PostSocial.perform_later(self, token, 'facebook')
      update_column('shared', true)
    end
  end
end
