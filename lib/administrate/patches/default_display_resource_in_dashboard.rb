require "administrate/base_dashboard"

Administrate::BaseDashboard.prepend (
  Module.new {
    def display_resource(resource)
      ["##{resource.id}", resource.try(:name) || resource.try(:title)].compact.join(' ')
    end
  }
)
