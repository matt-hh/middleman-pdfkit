require 'pdfkit'
require "middleman-pdfkit/version"

::Middleman::Extensions.register(:pdfkit) do
  require 'middleman-pdfkit/extension'
  ::Middleman::PDFKit::Extension
end
