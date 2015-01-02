require "babosa"

class Report < ActiveRecord::Base
  belongs_to :project, inverse_of: :reports
  has_many :photos

  include AdminProject
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  accepts_nested_attributes_for :photos, allow_destroy: true

  validates_presence_of :goal, :about
  validates_length_of :goal, maximum: 250

  def slug_candidates
    [:goal,
     [:goal, :id]
    ]
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

end
