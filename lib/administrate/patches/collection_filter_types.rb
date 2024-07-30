require "administrate/base_dashboard"
require "administrate/page/collection"

Administrate::Page::Collection.prepend (
  Module.new {
    def collection_filter_types
      dashboard.collection_filter_types
    end
  }
)

Administrate::BaseDashboard.prepend (
  Module.new {
    def collection_filter_types
      self.class::COLLECTION_FILTER_TYPES
    end
  }
)

Administrate::BaseDashboard.const_set(:COLLECTION_FILTER_TYPES, {}.freeze)
