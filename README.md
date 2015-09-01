# Lpad

Ruby library to manipulate Novation Launchpad.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lpad'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lpad

## Usage

```ruby
require 'unimidi'
require 'lpad'

dev = UniMIDI::Output.gets.open

lp = Lpad::Device::Base.new dev

# indexes are 1-origin (1 to 8)
# color velocities are 0 to 3
lp.set x: 3, y: 4, red: 2, green: 2
lp.set button: :user_1, red: 3
lp.set button: :stop, green: 1

lp.reset!
```

[See demo movie of example/random.rb in YouTube](https://youtu.be/-pYzOw5pUVg)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lpad. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
