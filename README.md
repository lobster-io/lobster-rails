## Welcome to Lobster Rails

This gem helps streamline using Lobster Forms from Rails. It does this by leveraging Rails conventions to make calls terser.

## Key Features

- Utilities for using Lobster Forms from within a Ruby on Rails app

## Installation

```ruby
# install gem
$ gem install lobster-rails

# or add to your Gemfile:
gem 'lobster-rails'
```

## Lobster Rails 0.1.1 (September 2022)
Update errors format

## Lobster Rails 0.1.0 (August 2022)

## Quick Example

```erb
<%= javascript_include_tag 'https://lobster.io/js/lobster-forms.js' %>
<%= lob_form_with(
      model: @book, # this should be replaced with the model object variable 
      data: { lob: 'your-guid-from-lobster-here' }, 
      html: { style: 'min-height:400px' }
    ) {} %>
```

## Changelog

#### 0.1.0 (August 2022)

- Add `lob_form_for` method as a helper available to all templates

## License

This extension is [licensed under the MIT License](LICENSE).