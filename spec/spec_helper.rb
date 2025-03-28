# frozen_string_literal: true

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  # config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

# Remove verbose and confusing "Pending: (Failures listed here ...)" section at the end.
# For more information, see: https://github.com/rspec/rspec-core/issues/2377#issuecomment-275131981
module RSpecNoPendingOutput
  def dump_pending(_)
  end
end
RSpec::Core::Formatters::DocumentationFormatter.prepend RSpecNoPendingOutput
