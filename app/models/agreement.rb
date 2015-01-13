# == Schema Information
#
# Table name: agreements
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Agreement < ActiveRecord::Base
  include AdminAgreement

end
