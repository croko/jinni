# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  project_id :integer
#  main_image :string(255)
#  created_at :datetime
#  updated_at :datetime
#  report_id  :integer
#

require 'rails_helper'

RSpec.describe Photo, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
