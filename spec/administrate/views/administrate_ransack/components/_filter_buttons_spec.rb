require "rails_helper"

describe "administrate_ransack/components/_filter_buttons", type: :view do
  context "when show_export_button is NOT defined in the Controller" do
    it "does NOT display a button with 'button button--export' class" do
      allow(view).to receive(:clear_filters_path).and_return("/")

      render
      expect(rendered).not_to include("button button--export")
    end
  end

  context "when show_export_button IS defined in the Controller" do
    it "displays a button with 'button button--export' class" do
      allow(view).to receive(:show_export_button?).and_return(true)
      allow(view).to receive(:clear_filters_path).and_return("/")

      render
      expect(rendered).to include("button button--export")
    end
  end
end
