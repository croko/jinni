module TagExtend
  extend ActiveSupport::Concern

  included do
    scope :project_tag_names, -> (q) { Project.all_tag_counts.where('name ilike ?', "%#{q}%").map { |t| {id: t.name, name: t.name} }}
  end

  def tag_list_json
    tag_list.map { |t| {id: t, name: t} }
  end

end