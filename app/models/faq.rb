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

class Faq < ActiveRecord::Base
  include AdminFaq

  validates :title, presence: true, uniqueness: true

  scope :published, -> {where(published: true)}
end
