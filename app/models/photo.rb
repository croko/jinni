# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  project_id :integer
#  main_image :string(255)
#  created_at :datetime
#  updated_at :datetime
#  report_id  :integer
#

class Photo < ActiveRecord::Base

  include AdminPhoto

  belongs_to :user
  belongs_to :project, inverse_of: :photos
  belongs_to :report, inverse_of: :photos
  belongs_to :user

  mount_uploader :main_image, ProjectImageUploader

end
