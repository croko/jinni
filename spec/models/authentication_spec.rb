# == Schema Information
#
# Table name: authentications
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  provider     :string(255)      not null
#  uid          :string(255)      not null
#  created_at   :datetime
#  updated_at   :datetime
#  avatar_url   :string(255)
#  access_token :string
#

require 'rails_helper'

RSpec.describe Authentication, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
