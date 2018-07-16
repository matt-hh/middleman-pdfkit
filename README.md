Middleman-PDFKit
================

PDFKit extension for middleman

## Installation

Add this line to your application's Gemfile:

    gem 'middleman-pdfkit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install middleman-pdfkit

## Usage

* Activate pdfkit in your [config.rb]

```
configure :build do
  activate :relative_assets
  activate :pdfkit do |p|
    # p.filenames = ['test/test_page1', 'test/test_page2']
    # p.disable_smart_shrinking = true
    # p.quiet = false
    # p.page_size = 'A5'
    # p.margin_top = 10
    # p.margin_right = 10
    # p.margin_bottom = 10
    # p.margin_left = 10
    # p.print_media_type = true
    # p.encoding = 'UTF-8'
  end
end

```



* Execute `middleman build`

## Contributing

1. Fork it ( https://github.com/matt-hh/middleman-pdfkit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
