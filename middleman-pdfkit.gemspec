# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman-pdfkit/version'

Gem::Specification.new do |spec|
  spec.name          = "middleman-pdfkit"
  spec.version       = Middleman::PDFKit::VERSION
  spec.authors       = ["Matthias Döring", "Naadir Jeewa", "Bruno Medici"]
  spec.email         = ["matt@foryourcontent.de", "", "opensource@bmconseil.com"]
  spec.summary       = %q{PDFKit extension for middleman}
  spec.description   = %q{Generate PDFs from HTML/CSS with middleman}
  spec.homepage      = "https://github.com/matt-hh/middleman-pdfkit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "middleman-core",  ">= 4"
  spec.add_dependency "pdfkit",          "~> 0.8"
  spec.add_dependency "wkhtmltopdf_binary_provider"

  spec.add_development_dependency "bundler", "~> 2.2", ">= 2.2.10"
  spec.add_development_dependency "rake"
end
