# == Schema Information
#
# Table name: foundations
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  active       :boolean
#  description  :text
#  featured     :boolean          default("false")
#  logo         :string
#  website_url  :string
#  twitter_url  :string
#  facebook_url :string
#  google_url   :string
#

require 'rails_helper'

RSpec.describe Foundation, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
