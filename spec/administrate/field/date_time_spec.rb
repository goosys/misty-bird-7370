require "rails_helper"
require "administrate/field/date_time"

describe Administrate::Field::DateTime do
  let(:start_date) { DateTime.parse("2015-12-25 10:15:45") }
  let(:formats) do
    {
      date: {
        formats: {default: "%m/%d/%Y", short: "%b %d", administrate_datetime_default: "%m/%d, %Y"},
        abbr_month_names: Array.new(13) { |i| "Dec" if i == 12 },
        abbr_day_names: Array.new(7) { |i| "Fri" if i == 5 }
      },
      time: {
        formats: {default: "%a, %b %-d, %Y at %r", short: "%d %b %H:%M", administrate_datetime_default: "%a, %b %-d, %Y, %r"}
      }
    }
  end

  describe "#date" do
    context "without `format` option" do
      it "displays the date in the default format" do
        field = Administrate::Field::DateTime.new(:start_date, start_date, :show)
        with_translations(:en, formats) do
          expect(field.date).to eq("12/25, 2015")
        end
      end
    end
  end

  describe "#datetime" do
    context "without `format` option" do
      it "displays the datetime in the default format" do
        field = Administrate::Field::DateTime.new(:start_date, start_date, :show)
        with_translations(:en, formats) do
          expect(field.datetime).to eq("Fri, Dec 25, 2015, 10:15:45 AM")
        end
      end
    end
  end
end
