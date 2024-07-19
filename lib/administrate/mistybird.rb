# frozen_string_literal: true

require_relative "mistybird/version"
require_relative "field/refile"
require_relative "role_aware_resource_resolver"
require_relative "patches/administrate_datetime_default"
require_relative "patches/role_aware_resource_resolver"

module Administrate
  module Mistybird
    class Error < StandardError; end
    # Your code goes here...
  end
end
