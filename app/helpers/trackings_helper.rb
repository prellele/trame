module TrackingsHelper
  def options_for_project_select(tracking, projects)
    options_from_collection_for_select(projects, :id, :name, ->(project) {
      tracking.project_id == project.id
    })
  end
end
