module Shareable
  extend ActiveSupport::Concern

  def post_to_socials
    unless shared
      if approved_changed? && approved
        token = user.authentications.facebook.first.try(:access_token)
        post_to_jinni_fb
        post_to_facebook(token) if token && share
      end
    end
  end

  def post_report_to_socials
    unless shared
      token = project.user.authentications.facebook.first.try(:access_token)
      post_to_jinni_fb
      post_to_facebook(token) if token
    end
  end

  def post_to_facebook(token)
    if token.present?
      PostSocial.perform_later(self, token, 'facebook')
      set_shared
    end
  end

  def post_to_jinni_fb
    PostJinni.perform_later(self, 'facebook')
    set_shared
  end

  def set_shared
    update_column('shared', true)
  end

end
