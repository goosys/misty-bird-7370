require "administrate/field/base"

Administrate::Field::Base.singleton_class.prepend (
  Module.new {
    # attr_writer :partial_prefixes

    # def inherited(subclass)
    #   super
    #   subclass.partial_prefixes = {}
    # end

    def partial_prefixes(look: :default)
      @partial_prefixes ||= {}
      @partial_prefixes[look] ||=
        if superclass.respond_to?(:partial_prefixes)
          local_partial_prefixes(look: look) + superclass.partial_prefixes(look: look)
        else
          local_partial_prefixes(look: look)
        end
    end

    def local_partial_prefixes(look: :default)
      fallback = ["fields/#{field_type}/looks/default", "fields/#{field_type}"]
      if look == :default
        fallback
      else
        ["fields/#{field_type}/looks/#{look}"] + fallback
      end
    end
  }
)

Administrate::Field::Base.prepend (
  Module.new {
    # @partial_prefixes = {}

    def partial_prefixes
      self.class.partial_prefixes(look: look)
    end

    def look
      (options.fetch(:look, :default).presence || :default).to_sym
    end
  }
)
