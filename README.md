# Rails Helper Anywhere

_Rails Helper Anywhere_ allows you to access ALL Ruby On Rails helpers. All methods are placed on the class Helper as class methods.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_helper_anywhere'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install rails_helper_anywhere
```

## Usage

To use _Rails Helpers_ just place them as class methods on the class Helper.

```ruby
# Examples of helpers to use

Helper.link_to('Home', '/') #=> '<a href="/">home page</a>'
Helper.pins_path #=> '/pins'
Helper.method_from_custom_helpers #=> 'return from custom method in ApplicationHelper module'
```

The __Helper Class__ is most useful in custom classes or custom tests. Instead of including the helper modules that you need, just use the class methods.

```ruby
class MyCustomClass
  def my_method_root_path
    Helper.root_path
  end
end

RSpec.describe MyCustomClass do
  describe '#my_method_root_path' do
    it 'returns root path' do
      expect(Helper.root_path).to eq(MyCustomClass.new.my_method_root_path)
    end
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jwipeout/rails_helper_anywhere. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
