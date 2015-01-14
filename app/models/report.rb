# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  project_id :integer
#  goal       :string(255)
#  about      :text
#  slug       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require "babosa"

class Report < ActiveRecord::Base
  belongs_to :project, inverse_of: :reports
  has_many :photos

  include AdminReport
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  accepts_nested_attributes_for :photos, allow_destroy: true

  validates_presence_of :goal, :about
  validates_length_of :goal, maximum: 250

  alias_attribute :name, :goal

  after_create :close_project

  def slug_candidates
    [:goal,
     [:goal, :id]
    ]
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def localized_end_date
    (I18n.t :abbr_month_names, scope: :date)[created_at.month].to_s #+ ' ' + date_end.year.to_s
  end

  protected

  def close_project
     project.close! if project.opened?
  end
end
