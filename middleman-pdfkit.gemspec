# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman-pdfkit/version'

Gem::Specification.new do |spec|
  spec.name          = "middleman-pdfkit"
  spec.version       = Middleman::PDFKit::VERSION
  spec.authors       = ["Matthias Döring"]
  spec.email         = ["matt@foryourcontent.de"]
  spec.summary       = %q{PDFKit extension for middleman}
  spec.description   = %q{Generate PDFs from HTML/CSS with middleman}
  spec.homepage      = "https://github.com/matt-hh/middleman-pdfkit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "middleman-core",  ">= 3.0.0"
  spec.add_dependency "pdfkit",          "~> 0.6.2"
  spec.add_dependency "wkhtmltopdf_binary_provider"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
