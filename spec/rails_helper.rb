require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('./example_app/config/environment', __dir__)
require 'rspec/rails'
require 'rspec/active_model/mocks'

require 'support/i18n'
require 'support/constant_helpers'
