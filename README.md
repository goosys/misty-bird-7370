# Administrate::Mistybird

## Features

- [x] Add context to Administrate::Page
- [x] Refine Field::Refine
- [x] Copy Field::Enumerize
- [x] RoleAwareResourceResolver
- [x] Refine Field::NestedHasMany & Field::HasMany
- [x] Enhance AdministrateRansack
- [x] CSV Download
- [ ] CSV Import
- [x] Add hooks before and after each section of each page

## Demo

Here is a sample application that uses this Gem.
https://github.com/goosys/cool-wave-4209

## Installation

| | |
| -- | -- |
| Ruby | 3.2.x |
| Rails | 7.1.x |
| Administrate | 1.0.0.beta3 and contextualize |

Install ImageMagick or GraphicsMagick.

```bash
# Ubuntu
$ sudo apt install graphicsmagick
# Mac OS
$ brew install graphicsmagick
```

Add the following to your Gemfile.

```ruby
gem "csb"
gem "enumerize"
gem 'rails-i18n'
gem "refile", require: "refile/rails", github: "vitalinfo/refile", branch: "latest_ruby_rails"
gem "refile-mini_magick"
gem "sassc-rails"

gem "administrate", github: "goosys/administrate", branch: "feature/contextualize-resource_instance_variable"
gem "administrate_ransack", github: "goosys/administrate_ransack", branch: "develop"
gem "administrate-mistybird", github: "goosys/misty-bird-7370"
```

## Development

Install ImageMagick or GraphicsMagick.

```bash
# Ubuntu
$ sudo apt install graphicsmagick
# Mac OS
$ brew install graphicsmagick
```

To install the dependencies, run `bundle install`.

```bash
$ bundle install
```

Run rspec.

```bash
$ bundle exec rspec
```

To start the sample application, run the following command:

```bash
$ cd spec/example_app
$ rails s
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/administrate-mistybird. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/administrate-mistybird/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the Administrate::Mistybird project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/administrate-mistybird/blob/main/CODE_OF_CONDUCT.md).
