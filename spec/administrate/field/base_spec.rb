require "rails_helper"
require "administrate/field/base"

describe Administrate::Field::Base do
  let(:field_class) { Class.new(Administrate::Field::Base) }

  describe "@partial_prefixes" do
    it "returns empty hash by default" do
      pending("This test is expected to fail because @partial_prefixes currently returns nil")
      expect(field_class.instance_variable_get(:@partial_prefixes)).to eq({})
    end
  end

  describe "#partial_prefixes" do
    it "returns the partial prefixes based on the field class" do
      field = field_class.new(:attribute, nil, :show)
      allow(field_class).to receive(:to_s).and_return("Administrate::Field::String")

      prefixes = field.partial_prefixes

      expect(prefixes).to eq([
        "fields/string/looks/default", "fields/string",
        "fields/base/looks/default", "fields/base"
      ])
    end

    context "when given the look option" do
      context "when the look option is a symbol" do
        it "returns the partial prefixes based on the look option" do
          field = field_class.new(:attribute, nil, :show, look: :custom)
          allow(field_class).to receive(:to_s).and_return("Administrate::Field::String")

          prefixes = field.partial_prefixes

          expect(prefixes).to eq([
            "fields/string/looks/custom", "fields/string/looks/default", "fields/string",
            "fields/base/looks/custom", "fields/base/looks/default", "fields/base"
          ])
        end
      end

      context "when the look option is a string" do
        it "returns the partial prefixes based on the look option" do
          field = field_class.new(:attribute, nil, :show, look: "custom")
          allow(field_class).to receive(:to_s).and_return("Administrate::Field::String")

          prefixes = field.partial_prefixes

          expect(prefixes).to eq([
            "fields/string/looks/custom", "fields/string/looks/default", "fields/string",
            "fields/base/looks/custom", "fields/base/looks/default", "fields/base"
          ])
        end
      end

      context "when the look option is explicitly default" do
        it "returns the partial prefixes based on the field class" do
          field = field_class.new(:attribute, nil, :show, look: :default)
          allow(field_class).to receive(:to_s).and_return("Administrate::Field::String")

          prefixes = field.partial_prefixes

          expect(prefixes).to eq([
            "fields/string/looks/default", "fields/string",
            "fields/base/looks/default", "fields/base"
          ])
        end
      end

      context "when the look option is explicitly nil" do
        it "returns the partial prefixes based on the field class" do
          field = field_class.new(:attribute, nil, :show, look: nil)
          allow(field_class).to receive(:to_s).and_return("Administrate::Field::String")

          prefixes = field.partial_prefixes

          expect(prefixes).to eq([
            "fields/string/looks/default", "fields/string",
            "fields/base/looks/default", "fields/base"
          ])
        end
      end

      context "when the field class is multiply inherited" do
        it "returns the partial prefixes based on the field class" do
          second_level_field_class = Class.new(field_class)
          allow(field_class).to receive(:to_s).and_return("Administrate::Field::String")

          field = second_level_field_class.new(:attribute, nil, :show, look: :custom)
          allow(second_level_field_class).to receive(:to_s).and_return("Administrate::Field::CustomString")

          prefixes = field.partial_prefixes

          expect(prefixes).to eq([
            "fields/custom_string/looks/custom", "fields/custom_string/looks/default", "fields/custom_string",
            "fields/string/looks/custom", "fields/string/looks/default", "fields/string",
            "fields/base/looks/custom", "fields/base/looks/default", "fields/base"
          ])
        end
      end
    end
  end
end
