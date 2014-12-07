# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  phone_number     :string(255)
#  mobile_1         :string(255)
#  mobile_2         :string(255)
#  city_id          :integer
#  address_1        :string(255)
#  address_2        :string(255)
#  addressable_id   :integer
#  addressable_type :string(255)
#  email            :string(255)
#  website_url      :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

require 'rails_helper'

RSpec.describe Address, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
