module Administrate
  module CustomModelForFormFor
    extend ActiveSupport::Concern

    included do
      helper_method :custom_model_for_form_for
    end

    def custom_model_for_form_for
      nil
    end
  end
end

