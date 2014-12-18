class Photo < ActiveRecord::Base

  include AdminPhoto

  belongs_to :user

  mount_uploader :main_image, ProjectImageUploader

end
