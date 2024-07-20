require "administrate/field/has_many"

Administrate::Field::HasMany.prepend (
  Module.new {
    private

    # see https://github.com/thoughtbot/administrate/blob/main/lib/administrate/field/has_many.rb#L99
    def candidate_resources
      scope = options[:scope] ? options[:scope].call(self) : associated_class.all
      scope = scope.includes(*options.fetch(:includes)) if options.key?(:includes)
  
      order = options.delete(:order)
      order ? scope.reorder(order) : scope
    end
  }
)
