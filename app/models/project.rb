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
#  status            :integer
#  date_start        :date
#  date_end          :date
#  category_id       :integer
#  amount            :decimal(8, 2)    default(0.0)
#  created_at        :datetime
#  updated_at        :datetime
#

class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :foundation
  belongs_to :payment_system
  belongs_to :category

  acts_as_taggable
end
