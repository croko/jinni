# == Schema Information
#
# Table name: faqs
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  published  :boolean
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Faq, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
