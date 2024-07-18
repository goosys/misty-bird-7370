require "administrate/field/date_time"

Administrate::Field::DateTime.prepend (
  Module.new {
    private

    # see https://github.com/thoughtbot/administrate/blob/master/lib/administrate/field/date_time.rb
    def format
      options.fetch(:format, :administrate_datetime_default)
    end
  }
)
