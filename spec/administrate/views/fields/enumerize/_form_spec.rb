require "rails_helper"

describe "fields/enumerize/_form", type: :view do
  before do
    ActiveRecord::Schema.define do
      create_table :books, force: true do |t|
        t.integer :status, default: 0, null: false
      end
    end
    class Book < ApplicationRecord
      extend Enumerize
      enumerize :status, in: { disabled: 0, enabled: 1 }, default: :enabled, predicates: true, scope: true
    end
  end

  after do
    remove_constants :Book
  end

  it "renders a select field" do
    book = Book.new
    field = Administrate::Field::Enumerize.new(
      :status,
      book.status,
      :form,
      resource: book
    )

    fields model: book do |f|
      render(
        partial: "fields/enumerize/form",
        locals: {field: field, f: f}
      )
    end

    expect(rendered).to include("name=\"book[status]\"")
    expect(rendered).to include("value=\"disabled\"")
    expect(rendered).to include("value=\"enabled\"")
    expect(rendered).to include("data-controller=\"select\"")
  end

  context "when given a blank option" do
    it "renders a blank option" do
      book = Book.new
      field = Administrate::Field::Enumerize.new(
        :status,
        book.status,
        :form,
        resource: book,
        include_blank: true
      )

      fields model: book do |f|
        render(
          partial: "fields/enumerize/form",
          locals: {field: field, f: f}
        )
      end

      expect(rendered).to include("value=\"\"")
    end
  end
end
