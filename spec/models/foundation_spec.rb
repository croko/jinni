# == Schema Information
#
# Table name: foundations
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  active      :boolean
#  description :string(255)
#

require 'rails_helper'

RSpec.describe Foundation, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
