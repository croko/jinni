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

FactoryGirl.define do
  factory :photo do
    project nil
    main_image nil
  end

end
