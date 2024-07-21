require "rails_helper"

describe "administrate/application/home", type: :view do
  it "infers the controller action" do
    expect(controller.request.path_parameters[:action]).to eq("home")
  end

  describe "#page-title" do
    context 'when translation is not changed' do
      it 'displays title with translation' do
        render
        expect(rendered).to match /Dashboard/
      end
    end
    context 'when translation is changed' do
      let(:formats) { { administrate: {application: { home: { title: "My Test Dashboard"} } } } }

      it 'displays title with translation' do
        with_translations(:en, formats) do
          render
          expect(rendered).to match /My Test Dashboard/
        end
      end
    end
  end
end
