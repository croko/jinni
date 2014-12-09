class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :foundation
  belongs_to :payment_system
  belongs_to :category

  mount_uploader :main_image, ProjectImageUploader

  validates_presence_of :category_id
end
