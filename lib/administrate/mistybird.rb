# frozen_string_literal: true

require_relative "mistybird/engine"
require_relative "mistybird/version"
require_relative "mistybird/ransack_search_field_permitted_default"
require_relative "field/enumerize"
require_relative "field/refile"
require_relative "custom_model_for_form_for"
require_relative "role_aware_resource_resolver"
require_relative "patches/administrate_datetime_default"
require_relative "patches/collection_export_types"
require_relative "patches/collection_filter_types"
require_relative "patches/dashboard_name_option_to_nested_has_many"
require_relative "patches/default_display_resource_in_dashboard"
require_relative "patches/empty_handling_to_number"
require_relative "patches/enable_skip_option_in_nested_has_many"
require_relative "patches/look_option_to_field_base"
require_relative "patches/pass_parent_resource_to_nested_has_many"
require_relative "patches/role_aware_resource_resolver"
require_relative "patches/scope_option_to_has_many"

module Administrate
  module Mistybird
    class Error < StandardError; end
    # Your code goes here...
  end
end
