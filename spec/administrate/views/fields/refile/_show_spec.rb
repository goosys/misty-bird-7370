require "rails_helper"

describe "fields/refile/_show", type: :view do
  context "If field.data is blank" do
    pending "Nothing is displayed"
  end
  
  context "If field.data is an Array" do
    pending "Not yet tested"
  end

  context "If field.data is present" do
    context "When field.options[:type] is :image" do
      pending "Image preview is displayed"
    end

    context "When field.name ends with _image" do
      pending "Image preview is displayed"
    end

    context "When field.name is 'image'" do
      pending "Image preview is displayed"
    end

    context "If any of the above three conditions apply (image file)" do
      context "When _content_type column is svg" do
        pending "Display non-resized image"
      end

      context "When _content_type column is not svg" do
        pending "Display resized image"
      end
    end

    context "If none of the above conditions apply (non-image file)" do
      pending "The delete button is displayed"
      pending "Link to document file is displayed"
    end
  end
end
