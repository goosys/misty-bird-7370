require "administrate/field/nested_has_many"

Administrate::Field::NestedHasMany.prepend (
  Module.new {
    private

    # see https://github.com/nickcharlton/administrate-field-nested_has_many/blob/main/lib/administrate/field/nested_has_many.rb#L101
    def new_resource
      if options[:parent]
        @new_resource ||= associated_class_name.constantize.new("#{options[:parent]}": @resource)
      else
        @new_resource ||= @resource.send(association_name).build
      end
    end
  }
)
