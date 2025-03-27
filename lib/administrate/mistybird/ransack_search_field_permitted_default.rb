# frozen_string_literal: true

module Administrate
  module Mistybird
    model RansackSearchFieldPermittedDefault
      def ransack_search_field_permitted?(form: nil, model: nil, field: nil, label: nil, type: nil, input_type: nil, options: {})
        return if field == :id
        return if input_type == 'Administrate::Field::Refile'
        return if input_type == 'Administrate::Field::Enumerize' && (@ransack_results.klass.respond_to?("with_#{field}").blank? || @ransack_results.klass.ransackable_scopes.map(&:to_s).include?("with_#{field}").blank?)
        return if input_type == 'Administrate::Field::String' && !(form.search_field "#{field}_cont" rescue nil)
      end
    end
  end
end
