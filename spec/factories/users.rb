# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  email                           :string(255)      not null
#  crypted_password                :string(255)
#  salt                            :string(255)
#  first_name                      :string(255)
#  last_name                       :string(255)
#  created_at                      :datetime
#  updated_at                      :datetime
#  remember_me_token               :string(255)
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string(255)
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  with_foundation                 :boolean          default("false")
#  admin                           :boolean          default("false")
#  about                           :text
#  image                           :string(255)
#  twitter_url                     :string(255)
#  facebook_url                    :string(255)
#  google_url                      :string(255)
#

FactoryGirl.define do
  factory :user do
    
  end

end
