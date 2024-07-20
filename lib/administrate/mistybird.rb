# frozen_string_literal: true

require_relative "mistybird/version"
require_relative "field/refile"
require_relative "role_aware_resource_resolver"
require_relative "patches/administrate_datetime_default"
require_relative "patches/dashboard_name_option_to_nested_has_many"
require_relative "patches/pass_parent_resource_to_nested_has_many"
require_relative "patches/role_aware_resource_resolver"

module Administrate
  module Mistybird
    class Error < StandardError; end
    # Your code goes here...
  end
end
