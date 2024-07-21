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

  describe "#display_resource" do
    context "when the resource has a name attribute" do
      it "returns the id and name of the resource" do
        class CustomerDashboard < Administrate::BaseDashboard; end
        customer = double(id: 1, name: "Example Customer")
        dashboard = CustomerDashboard.new

        rendered_resource = dashboard.display_resource(customer)
        expect(rendered_resource).to eq("#1 Example Customer")
      ensure
        remove_constants :CustomerDashboard
      end
    end

    context "when the resource has a title attribute" do
      it "returns the id and title of the resource" do
        class BookDashboard < Administrate::BaseDashboard; end
        book = double(id: 1, title: "Example Title")
        dashboard = BookDashboard.new

        rendered_resource = dashboard.display_resource(book)
        expect(rendered_resource).to eq("#1 Example Title")
      ensure
        remove_constants :BookDashboard
      end
    end

    context "when the resource has not a name or title attribute" do
      it "returns the id of the resource" do
        class LogDashboard < Administrate::BaseDashboard; end
        log = double(id: 1)
        dashboard = LogDashboard.new

        rendered_resource = dashboard.display_resource(log)
        expect(rendered_resource).to eq("#1")
      ensure
        remove_constants :LogDashboard
      end
    end
  end
end
