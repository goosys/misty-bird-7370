require "rails_helper"
require "administrate/field/number"

describe Administrate::Field::Number do
  describe "#to_s" do
    context "when the data is nil" do
      it "returns a dash" do
        field = Administrate::Field::Number.new(:price, nil, :show, suffix: "dallars")
        expect(field.to_s).to eq("-")
      end
    end

    context "when the data is not nil" do
      it "returns the number as a string" do
        field = Administrate::Field::Number.new(:price, 10_000, :show)
        expect(field.to_s).to eq("10000")
      end
    end
  end
end
