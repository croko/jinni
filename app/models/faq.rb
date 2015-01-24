class Faq < ActiveRecord::Base
  include AdminFaq

  validates :title, presence: true, uniqueness: true

  scope :published, -> {where(published: true)}
end
