require "babosa"

class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :foundation
  belongs_to :payment_system
  belongs_to :category, counter_cache: true
  has_many :photos
  has_many :payments

  include AdminProject
  include TagExtend
  acts_as_taggable

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  accepts_nested_attributes_for :photos, allow_destroy: true

  enum status: [:open, :close]

  validates_presence_of :category_id, :title, :goal, :date_start, :date_end, :amount, :about
  validates_numericality_of :amount, greater_than: 0

  scope :published, -> { where(published: true) }
  scope :featured, -> { where(featured: true) }
  scope :exclude_featured, -> { where(featured: false) }
  scope :approved, -> { where(approved: true) }
  scope :sorted, -> { order('date_start DESC') }

  def localized_end_date
    (I18n.t :abbr_month_names, scope: :date)[date_end.month].to_s + ' ' + date_end.year.to_s
  end

  def progress
    (collected / amount).round * 100
  end

  def slug_candidates
    [
        :title,
        [:title, :category_id],
        [:title, :category_id, :date_start],
        [:title, :category_id, :date_start, :date_end]
    ]
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def thumb
    photos.try(:first).try(:main_image).try(:thumb).try(:url)
  end
end
