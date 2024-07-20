require "administrate/field/nested_has_many"
require "administrate/page/nested_collection"

Administrate::Field::NestedHasMany.prepend (
  Module.new {
    def nested_attributes
      options[:collection_attributes] ||
        associated_dashboard.collection_attributes.reject do |nested_attribute|
          skipped_fields.include?(nested_attribute)
        end
    end

    def associated_collection(order = self.order)
      Administrate::Page::NestedCollection.new(associated_dashboard, order: order, collection_attributes: nested_attributes)
    end
  }
)
