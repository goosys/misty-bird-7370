require "rails_helper"

describe Administrate::BaseDashboard do
  describe "#model" do
    it "handles global-namepsace models in namespaced controller" do
      module Provider; class UserDashboard < Administrate::BaseDashboard; end; end
      class User; end

      expect(Provider::UserDashboard.model).to eq(User)
    ensure
      remove_constants :Provider
      remove_constants :User
    end

    it "handles namespaced models in namespaced controller", pending: "TODO" do
      module Provider; module Library; class BookDashboard < Administrate::BaseDashboard; end; end; end
      module Library; module Book; end; end

      expect(Provider::Library::BookDashboard.model).to eq(Library::Book)
    ensure
      remove_constants :Provider
      remove_constants :Library
    end
  end
end
