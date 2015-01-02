class Photo < ActiveRecord::Base

  include AdminPhoto

  belongs_to :user
  belongs_to :project, inverse_of: :photos
  belongs_to :report, inverse_of: :photos
  belongs_to :user

  mount_uploader :main_image, ProjectImageUploader

end
