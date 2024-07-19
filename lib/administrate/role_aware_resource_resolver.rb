# frozen_string_literal: true

module Administrate
  class RoleAwareResourceResolver
    def initialize(controller_path, role_depth: 1, dashboard_class_name_with_role: true)
      @controller_path = controller_path
      @role_depth = role_depth
      @dashboard_class_name_with_role = dashboard_class_name_with_role
    end

    def dashboard_class
      ActiveSupport::Inflector.constantize(dashboard_class_name)
    end

    def namespace
      controller_path.split("/")[0..(role_depth - 1)].join("/").to_sym
    end

    def resource_class
      ActiveSupport::Inflector.constantize(resource_class_name)
    end

    def resource_name
      model_path_parts.map(&:underscore).join("__").to_sym
    end

    def resource_title
      resource_class.model_name.human
    end

    private

    def dashboard_class_name
      if dashboard_class_name_with_role && role_depth > 0
        "#{namespace.to_s.classify}::#{resource_class_name}Dashboard"
      else
        "#{resource_class_name}Dashboard"
      end
    end

    def resource_class_name
      model_path_parts.join("::")
    end

    def model_path_parts
      controller_path_parts.map(&:camelize)
    end

    def controller_path_parts
      path_parts = controller_path.split("/")[role_depth..]
      path_parts << path_parts.pop.singularize
    end

    attr_reader :controller_path, :role_depth, :dashboard_class_name_with_role
  end
end
