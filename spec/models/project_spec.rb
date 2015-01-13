# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  goal              :string(255)
#  about             :text
#  user_id           :integer
#  foundation_id     :integer
#  payment_system_id :integer
#  status            :integer          default("0")
#  date_start        :date
#  date_end          :date
#  category_id       :integer
#  amount            :decimal(8, 2)    default("0.0")
#  created_at        :datetime
#  updated_at        :datetime
#  location          :string(255)
#  featured          :boolean          default("false")
#  published         :boolean          default("false")
#  approved          :boolean          default("false")
#  slug              :string(255)
#  collected         :decimal(8, 2)    default("0.0")
#  payments_count    :integer
#  share             :boolean          default("true")
#  shared            :boolean          default("false")
#

require 'rails_helper'

RSpec.describe Project, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
