# frozen_string_literal: true

require "administrate/page/base"
require "administrate/base_dashboard"

Administrate::Page::Base.prepend (
  Module.new {
    # see https://github.com/thoughtbot/administrate/blob/35a21cfdc0d64b098a3f16543deb4739f80c1dbd/lib/administrate/page/base.rb#L9
    #     https://github.com/thoughtbot/administrate/blob/7cddab1b0c71beb8c78a294ad3d9659963efb859/lib/administrate/base_dashboard.rb#L24
    def resource_name
      @resource_name ||=
        ActiveSupport::Inflector.demodulize(dashboard.class.to_s).chomp(self.class.const_get(:DASHBOARD_SUFFIX)).underscore
    end
  }
)

Administrate::BaseDashboard.singleton_class.prepend (
  Module.new {
    DASHBOARD_SUFFIX = "Dashboard".freeze

    # see https://github.com/thoughtbot/administrate/blob/v1.0.0.beta1/lib/administrate/base_dashboard.rb#L24
    def model
      ActiveSupport::Inflector.demodulize(to_s).chomp(self.class.const_get(:DASHBOARD_SUFFIX)).classify.constantize
    end
  }
)
