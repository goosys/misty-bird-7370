#
# This file defines the `Refile` field for Administrate gem.
# It is responsible for handling file uploads using the Refile gem.
#
# For more information, please refer to the source file:
#   - [GitHub Source](https://github.com/valiot/administrate-field-refile/blob/23c2c0532b324fbb5d6c7dd19b932abd1c18ad8f/lib/administrate/field/refile.rb)
#
require 'administrate/field/base'
require 'rails'

module Administrate
  module Field
    class Refile < Administrate::Field::Base
      class Engine < ::Rails::Engine
      end
      
      # Returns the permitted attributes for the field.
      #
      # @param attr [Symbol] The attribute name.
      # @param _options [Hash] Additional options (not used).
      # @return [Array<Symbol>] The permitted attributes.
      def self.permitted_attribute(attr, _options = {})
        [ attr, :"remove_#{attr}" ]
      end

      # Returns the string representation of the field's data.
      #
      # @return [String] The string representation of the data.
      def to_s
        data
      end

      # Returns whether the field allows direct file uploads.
      #
      # @return [Boolean] `true` if direct file uploads are allowed, `false` otherwise.
      def direct
        options.fetch(:direct, false)
      end

      # Returns whether the field uses presigned URLs for file uploads.
      #
      # @return [Boolean] `true` if presigned URLs are used, `false` otherwise.
      def presigned
        options.fetch(:presigned, false)
      end

      # Returns whether the field allows multiple file uploads.
      #
      # @return [Boolean] `true` if multiple file uploads are allowed, `false` otherwise.
      def multiple
        options.fetch(:multiple, false)
      end
    end
  end
end
