class Authentication < ActiveRecord::Base
  belongs_to :user

  before_create :process_avatar

  scope :facebook, -> {where(provider: 'facebook')}
  scope :google, -> {where(provider: 'google')}

  def process_avatar
    if provider == 'facebook'
      self.avatar_url = "https://graph.facebook.com/#{uid}/picture?type=large"
    end

  end
end
