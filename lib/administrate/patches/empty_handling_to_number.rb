require "administrate/field/number"

Administrate::Field::Number.prepend (
  Module.new {
    # see https://github.com/thoughtbot/administrate/blob/13cf8fb4c588f8748108ca097723f98879a47227/lib/administrate/field/number.rb#L8
    def to_s
      return "-" if data.nil?
      result = format_string % value
      result = format(result) if options[:format]
      prefix + result + suffix
    end
  }
)
