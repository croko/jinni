class Photo < ActiveRecord::Base
  belongs_to :user

  mount_uploader :main_image, ProjectImageUploader

end
