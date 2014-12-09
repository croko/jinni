class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :foundation
  belongs_to :payment_system
  belongs_to :category

  # mount_uploader :main_image, ProjectImageUploader
  mount_uploaders :main_images, ProjectImageUploader

  validates_presence_of :category_id
end
