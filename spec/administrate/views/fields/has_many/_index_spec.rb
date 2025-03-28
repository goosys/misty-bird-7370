require "rails_helper"

describe "fields/has_many/_index", type: :view do
  let(:field_default_formats_en) do
    YAML.safe_load(%(
      administrate:
        fields:
          has_many:
            pluralize:
              zero: "%{pluralize}"
              one: "%{pluralize}"
              other: "%{pluralize}"
    ))
  end

  context "If locale is :en (plural keys is [:zero, :one, :other])" do
    around(:each) do |example|
      I18n.backend = I18n::Backend::Simple.new
      I18n.backend.store_translations(:en, formats)
      I18n.with_locale(:en) do
        example.run
      end
    end

    before do
      class Book < ApplicationRecord; self.abstract_class = true; end
      class BookImage < ApplicationRecord; self.abstract_class = true; end

      allow(view).to receive_message_chain("field.resource.class").and_return(Book)
      allow(view).to receive_message_chain("field.attribute").and_return("book_images")
      allow(view).to receive_message_chain("field.associated_class").and_return(BookImage)
    end

    after do
      remove_constants :Book, :BookImage
    end

    context "If there is no translation for pluralize and no translation for the Model" do
      let(:formats) { field_default_formats_en }

      context "If the target model has no namespace" do
        it "displays the pluralized and titleized model name" do
          allow(view).to receive_message_chain("field.data.size").and_return(2)

          render
          expect(rendered.chomp).to eq("2 Book Images")
        end
      end

      context "If the target model has a namespace" do
        it "displays the pluralized and titleized model name" do
          module Library
            class Book < ApplicationRecord; self.abstract_class = true; end
            class BookImage < ApplicationRecord; self.abstract_class = true; end
          end

          allow(view).to receive_message_chain("field.resource.class").and_return(Library::Book)
          allow(view).to receive_message_chain("field.attribute").and_return("book_images")
          allow(view).to receive_message_chain("field.associated_class").and_return(Library::BookImage)
          allow(view).to receive_message_chain("field.data.size").and_return(2)

          render
          expect(rendered.chomp).to eq("2 Book Images")
        ensure
          remove_constants :Library
        end
      end
    end

    context "If there are translations for the Model" do
      let(:formats) do
        YAML.safe_load(%(
          activerecord:
            models:
              book: "Special Book"
              book_image: "Special Book Image"
        )).deep_merge(field_default_formats_en)
      end

      context "If the target model has no namespace" do
        it "displays the pluralized and titleized model name with translation" do
          allow(view).to receive_message_chain("field.data.size").and_return(2)

          render
          expect(rendered.chomp).to eq("2 Special Book Images")
        end
      end
    end

    context "If there are translations for the Model" do
      let(:formats) do
        YAML.safe_load(%(
          activerecord:
            models:
              book: "Special Book"
              book_image: "Special Book Image"
          administrate:
            fields:
              has_many:
                pluralize:
                  zero: "%{pluralize}"
                  one: "%{pluralize}"
                  other: "%{pluralize}"
                  attributes:
                    "book/book_images":
                      zero: "%{pluralize}"
                      one: "%{pluralize}"
                      other: "Current %{pluralize}"
        ))
      end

      context "If the target model has no namespace" do
        it "displays the pluralized and titleized model name with translation from administrate.fields.has_many.pluralize.attributes.PARENT_CLASS_NAME.ATTRIBUTE_NAME" do
          allow(view).to receive_message_chain("field.data.size").and_return(2)

          render
          expect(rendered.chomp).to eq("Current 2 Special Book Images")
        end
      end
    end
  end

  context "If locale is :ja (plural keys only is [:other])" do
    around(:each) do |example|
      I18n.backend = I18n::Backend::Simple.new
      I18n.backend.store_translations(:ja, formats)
      I18n.with_locale(:ja) do
        example.run
      end
    end

    before do
      class Book < ApplicationRecord; self.abstract_class = true; end
      class BookImage < ApplicationRecord; self.abstract_class = true; end

      allow(view).to receive_message_chain("field.resource.class").and_return(Book)
      allow(view).to receive_message_chain("field.attribute").and_return("book_images")
      allow(view).to receive_message_chain("field.associated_class").and_return(BookImage)
    end

    after do
      remove_constants :Book, :BookImage
    end

    context "When using a common unit regardless of the model name" do
      let(:formats) do
        YAML.safe_load(%(
          activerecord:
            models:
              book: "書籍"
              book_image: "書籍画像"
          administrate:
            fields:
              has_many:
                pluralize:
                  zero: ""
                  other: "%{count} 件"
        ))
      end
    
      it "displays item counts" do
        allow(view).to receive_message_chain("field.data.size").and_return(2)

        render
        expect(rendered.chomp).to eq("2 件")
      end

      context "When translating with specific attributes" do
        let(:formats) do
          YAML.safe_load(%(
            activerecord:
              models:
                book: "書籍"
                book_image: "書籍画像"
            administrate:
              fields:
                has_many:
                  pluralize:
                    zero: ""
                    other: "%{count} 件"
                    attributes:
                      book/book_images:
                        zero: ""
                        other: "%{count} 枚"
          ))
        end
    
        it "displays item counts with specific translation" do
          allow(view).to receive_message_chain("field.data.size").and_return(2)
  
          render
          expect(rendered.chomp).to eq("2 枚")
        end
      end
    end

    context "If the model_name option is used" do
      let(:formats) do
        YAML.safe_load(%(
          activerecord:
            models:
              book: "書籍"
              book_image: "書籍画像"
          administrate:
            fields:
              has_many:
                pluralize:
                  zero: ""
                  other: "%{count} %{model_name}"
        ))
      end
    
      it "displays item counts with model_name (since it's in Japanese, no pluralization)" do
        allow(view).to receive_message_chain("field.data.size").and_return(2)

        render
        expect(rendered.chomp).to eq("2 書籍画像")
      end
    end
  end

  context "If locale is :ru (plural keys is [:one, :few, :many, :other])" do
    around(:each) do |example|
      I18n.backend = I18n::Backend::Simple.new
      I18n.backend.store_translations(:ru, formats)
      I18n.with_locale(:ru) do
        example.run
      end
    end

    before do
      class Book < ApplicationRecord; self.abstract_class = true; end
      class BookImage < ApplicationRecord; self.abstract_class = true; end

      allow(view).to receive_message_chain("field.resource.class").and_return(Book)
      allow(view).to receive_message_chain("field.attribute").and_return("book_images")
      allow(view).to receive_message_chain("field.associated_class").and_return(BookImage)
    end

    after do
      remove_constants :Book, :BookImage
    end

    let(:formats) do
      YAML.safe_load(%(
        activerecord:
          models:
            book: "книга"
            book_image: "изображение книги"
        administrate:
          fields:
            has_many:
              pluralize:
                zero: "no items"
                one: "one item"
                few: "few items"
                many: "many items"
                other: "other items"
      ))
    end

    it "uses the translation matching 'few'" do
      allow(view).to receive_message_chain("field.data.size").and_return(3)

      render
      expect(rendered.chomp).to eq("few items")
    end

    it "uses the translation matching 'many'" do
      allow(view).to receive_message_chain("field.data.size").and_return(11)

      render
      expect(rendered.chomp).to eq("many items")
    end
  end
end
