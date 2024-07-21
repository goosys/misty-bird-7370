require "generators/administrate/views/index_generator"

Administrate::Generators::Views::IndexGenerator.prepend (
  Module.new {
    def copy_template
      copy_resource_template("index")
      copy_resource_template("_collection")
      copy_resource_template("_collection_header_actions")
      copy_resource_template("_collection_item_actions")
      copy_resource_template("_index_header")
      copy_resource_template("_pagination")
      copy_resource_template("_search")
    end
  }
)
