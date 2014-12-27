module SocialUrl
  extend ActiveSupport::Concern

  included do
    before_save :set_social_links
  end

  def set_social_links
    unless twitter_url.blank?
      self.twitter_url = URI.parse(twitter_url).scheme.nil? ? "https://#{twitter_url}" : twitter_url
    end
    unless facebook_url.blank?
      self.facebook_url = URI.parse(facebook_url).scheme.nil? ? "https://#{facebook_url}" : facebook_url
    end
    unless google_url.blank?
      self.google_url = URI.parse(google_url).scheme.nil? ? "https://#{google_url}" : google_url
    end
  rescue
    nil
  end
end