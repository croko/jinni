class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :foundation
  belongs_to :payment_system
  belongs_to :category
  has_many :photos

  include AdminProject

  accepts_nested_attributes_for :photos, allow_destroy: true

  enum status: [ :open, :close ]

  validates_presence_of :category_id, :title, :goal, :date_start, :date_end, :amount, :about
  validates_numericality_of :amount, greater_than: 0

  scope :published, -> {where(published: true)}
  scope :featured, -> {where(featured: true)}
  scope :exclude_featured, -> {where(featured: false)}
  scope :approved, -> {where(approved: true)}
  scope :sorted, -> {order('date_start DESC')}

  def localized_end_date
    (I18n.t :abbr_month_names, :scope => :date)[date_end.month].to_s + ' ' + date_end.year.to_s
  end
end
