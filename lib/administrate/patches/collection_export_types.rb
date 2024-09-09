require "administrate/base_dashboard"

Administrate::BaseDashboard.prepend (
  Module.new {
    def collection_export_types
      self.class::COLLECTION_EXPORT_TYPES
    end
  }
)

Administrate::BaseDashboard.const_set(:COLLECTION_EXPORT_TYPES, {}.freeze)
