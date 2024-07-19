require "rails_helper"
require "administrate/base_dashboard"
require "administrate/page/base"

describe Administrate::Page::Base do

  describe "#resource_name" do
    it "returns a resource name from the dashboard" do
      class OrderDashboard < Administrate::BaseDashboard; end
      dashboard = OrderDashboard.new
      dashboard_page = Administrate::Page::Base.new(dashboard)

      expect(dashboard_page.resource_name).to eq "order"
    ensure
      remove_constants :OrderDashboard
    end

    it "returns a string for a resource path without namespace" do
      class OrderDashboard < Administrate::BaseDashboard; end
      dashboard = OrderDashboard.new
      dashboard_page = Administrate::Page::Base.new(dashboard)

      expect(dashboard_page.resource_path).to eq "order"
    ensure
      remove_constants :OrderDashboard
    end

    context "when provided a namespaced dashboard" do
      it "returns a namespaced resource name from the dashboard" do
        module Provider; class OrderDashboard < Administrate::BaseDashboard; end; end
        dashboard = Provider::OrderDashboard.new
        dashboard_page = Administrate::Page::Base.new(dashboard)

        expect(dashboard_page.resource_name).to eq "order"
      ensure
        remove_constants :Provider
      end

      it "returns a string for a namespaced resource path" do
        module Provider; class OrderDashboard < Administrate::BaseDashboard; end; end
        dashboard = Provider::OrderDashboard.new
        dashboard_page = Administrate::Page::Base.new(dashboard)

        expect(dashboard_page.resource_path).to eq "order"
      ensure
        remove_constants :Provider
      end
    end

    context "when provided a nested namespace dashboard" do
      it "returns a namespaced resource name from the dashboard", pending: 'TODO' do
        module Provider; module Logged; class OrderDashboard < Administrate::BaseDashboard; end; end; end
        dashboard = Provider::Logged::OrderDashboard.new
        dashboard_page = Administrate::Page::Base.new(dashboard)

        expect(dashboard_page.resource_name).to eq "logged/order"
      ensure
        remove_constants :Provider
      end

      it "returns a string for a namespaced resource path", pending: 'TODO' do
        module Provider; module Logged; class OrderDashboard < Administrate::BaseDashboard; end; end; end
        dashboard = Provider::Logged::OrderDashboard.new
        dashboard_page = Administrate::Page::Base.new(dashboard)

        expect(dashboard_page.resource_path).to eq "logged_order"
      ensure
        remove_constants :Provider
      end
    end
  end
end
