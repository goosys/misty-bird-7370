require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('./example_app/config/environment', __dir__)
require 'rspec/rails'
require 'rspec/active_model/mocks'

require 'support/i18n'
require 'support/constant_helpers'

RSpec.configure do |config|
  config.before(:each, type: :view) do
    view.lookup_context.prepend_view_paths [File.expand_path("../app/views", __dir__)]
  end
end
