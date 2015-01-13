# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  projects_count :integer
#  slug           :string(255)
#

class Category < ActiveRecord::Base
  include AdminCategory
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :projects
  scope :sorted, -> {order('name')}

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

end
