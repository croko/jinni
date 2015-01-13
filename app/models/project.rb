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

require "babosa"

class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :foundation
  belongs_to :payment_system
  belongs_to :category, counter_cache: true
  has_many :photos
  has_many :payments
  has_many :reports

  include AdminProject
  include Shareable
  include TagExtend
  acts_as_taggable

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  accepts_nested_attributes_for :photos, allow_destroy: true
  accepts_nested_attributes_for :reports, allow_destroy: true

  enum status: [:opened, :close]

  validates_presence_of :category_id, :title, :goal, :date_start, :date_end, :amount, :about
  validates_numericality_of :amount, greater_than: 0
  validates_length_of :goal, maximum: 250
  validate :publish

  scope :published, -> { where(published: true) }
  scope :featured, -> { where(featured: true) }
  scope :exclude_featured, -> { where(featured: false) }
  scope :approved, -> { where(approved: true) }
  scope :sorted, -> { order('date_start DESC') }

  paginates_per 8

  after_create :notify_admin_created
  after_update :check_published

  def localized_end_date
    (I18n.t :abbr_month_names, scope: :date)[date_end.month].to_s #+ ' ' + date_end.year.to_s
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

  def image_full_size
    photos.try(:first).try(:main_image).try(:url)
  end

  def payment_ready
    foundation.try(:payment_ready) || payment_system_id.present?
  end

  def publish
    errors.add(:published, "#{I18n.t 'no_payment_system'}") unless payment_ready
  end

  protected

  def notify_admin_created
    if published?
      notify_admin_published
    else
      SystemMailer.new_project_registered(self).deliver_later
    end
  end

  def check_published
    if published_changed? && published
      notify_admin_published
    end
  end

  def notify_admin_published
    SystemMailer.new_project_published(self).deliver_later
  end

end
