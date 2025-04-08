require "rails_helper"

describe "administrate/application/_index_header", type: :view do
  context "when the controller is not ransack searchable" do
    it "does not render the ransack search form" do
      allow(view).to receive(:content_for).and_return(nil)
      allow(view).to receive(:show_search_bar).and_return(false)
      allow(view).to receive(:page).and_return(nil)
      allow(view).to receive(:new_resource).and_return(nil)
      allow(view).to receive(:accessible_action?).and_return(false)
      stub_template "administrate_ransack/filters" => "<div class='ransack-filters-container'></div>"
      stub_template "import_buttons" => ""

      assign(:ransack_results, nil)
      render

      expect(rendered).not_to match("ransack-filters-container")
    end
  end
end
