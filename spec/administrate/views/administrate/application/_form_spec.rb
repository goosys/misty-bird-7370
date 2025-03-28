require "rails_helper"

describe "administrate/application/_form", type: :view do
  context "when the controller does not have the custom_model_for_form_for method" do
    it "renders the form with the default model" do
      page = Struct.new(:page)
      allow(page).to receive(:resource).and_return(mock_model("Book").as_new_record)
      allow(page).to receive(:attributes).and_return([])

      allow(view).to receive(:respond_to).with(:custom_model_for_form_for).and_return(false)
      allow(view).to receive(:namespace).and_return(:admin)
      allow(view).to receive(:page).and_return(page)
      allow(view).to receive(:admin_books_path).and_return("/admin/books/new")

      render

      expect(rendered).to match('id="new_book')
      expect(rendered).to match('action="/admin/books/new"')
    ensure
      remove_constants :Book
    end
  end

  context "when the controller has the custom_model_for_form_for method" do
    # ex)
    # def custom_model_for_form_for
    #   nil
    # end
    context "and the method returns nil" do
      it "renders the form with the default model" do
        page = Struct.new(:page)
        allow(page).to receive(:resource).and_return(mock_model("Book").as_new_record)
        allow(page).to receive(:attributes).and_return([])
  
        allow(view).to receive(:respond_to).with(:custom_model_for_form_for).and_return(false)
        allow(view).to receive(:namespace).and_return(:admin)
        allow(view).to receive(:page).and_return(page)
        allow(view).to receive(:admin_books_path).and_return("/admin/books/new")
  
        render
  
        expect(rendered).to match('id="new_book')
        expect(rendered).to match('action="/admin/books/new"')
      ensure
        remove_constants :Book
      end
    end

    # ex)
    # def custom_model_for_form_for
    #   [namespace, Book.find(params[:book_id]), new_resource]
    # end
    context "and the method returns a array including the nested models" do
      it "renders the form with the nested models" do
        page = Struct.new(:page)
        allow(page).to receive(:resource).and_return(mock_model("Image").as_new_record)
        allow(page).to receive(:attributes).and_return([])

        models = [:admin, mock_model("Book", to_param: "1"), mock_model("Image").as_new_record]

        allow(view).to receive(:respond_to).with(:custom_model_for_form_for).and_return(true)
        allow(view).to receive(:custom_model_for_form_for).and_return(models)
        allow(view).to receive(:namespace).and_return(:admin)
        allow(view).to receive(:page).and_return(page)
        allow(view).to receive(:admin_book_images_path).and_return("/admin/books/1/images/new")

        render

        expect(rendered).to match('id="new_image')
        expect(rendered).to match('action="/admin/books/1/images/new"')
      ensure
        remove_constants :Book, :Image
      end
    end
  end
end
