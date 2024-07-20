require "administrate/field/nested_has_many"

Administrate::Field::NestedHasMany.prepend (
  Module.new {
    private

    # see https://github.com/thoughtbot/administrate/blob/v1.0.0.beta1/lib/administrate/field/associative.rb#L51
    def associated_dashboard
      (associated_dashboard_name || "#{associated_class_name}Dashboard").constantize.new
    end

    def associated_dashboard_name
      options.fetch(:dashboard_name, nil)
    end
  }
)
