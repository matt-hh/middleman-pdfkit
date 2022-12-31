module Middleman
  module PDFKit
    class Extension < ::Middleman::Extension
      option :filenames, [], 'array of html files without .ext or leave it empty for all html files in build directory'

      # https://github.com/pdfkit/pdfkit/blob/v0.6.2/lib/pdfkit/configuration.rb#L10-L17
      option :disable_smart_shrinking,  false,    'Disable smart shrinking'
      option :quiet,                    true,     'Be quiet'
      option :page_size,                'A4',     'Page size: A4'
      option :margin_top,               '0',      'Margin top: 0'
      option :margin_right,             '0',      'Margin right: 0'
      option :margin_bottom,            '0',      'Margin bottom: 0'
      option :margin_left,              '0',      'Margin left: 0'
      option :print_media_type,         true,     'Print media type'
      option :encoding,                 'UTF-8',  'Encoding'

      def initialize(klass, options_hash={}, &block)
        @prefix = "build/"

        super
        setup_filenames
      end

      def manipulate_resource_list(resources)
        # Add my @filenames to Sitemap
        @filenames.each do |input, output|
          resources << Middleman::Sitemap::Extensions::EndpointResource.new(app.sitemap, output, "/")
        end

        # Return the new list
        resources
      end

      def after_build(builder)
        @filenames.each do |pdfkit_filename|
          html_filename = "build/#{pdfkit_filename}.html"
          pdf_filename  = "build/#{pdfkit_filename}.pdf"
          if File.exist?(html_filename)
            generate_pdf(html_filename, pdf_filename)
            puts "create", pdf_filename
          else
            puts "error", "#{pdf_filename} (HTML-File not found )", :red
          end
        end
      end

    private

      def build_pdf_for input, output
        # Output file should be prefixed only here
        input1 = "#{@prefix}#{input}"
        input2 = "#{@prefix}#{input}.html"
        outfile = "#{@prefix}#{output}"

        # Test input flies presence
        if File.exist?(input1)
          puts "create", outfile
          generate_pdf(input1, outfile)

        elsif File.exist?(input2)
          puts "create", outfile
          generate_pdf(input2, outfile)

        else
          puts "error", "PDFKit: none of source HTML files [#{file1}, #{file2}] been found", :red
        end

      end

      def setup_filenames
        # Init hash of file vectors
        @filenames = {}

        # If no filenames provided let's assume all detected files
        if !options.filenames || options.filenames.empty?
          all_html_files.filenames.each do |file|
            @filenames[file] = "#{file}.pdf"
          end

        # If it's a legacy array, let's build the destination filename
        elsif options.filenames.is_a?(Array)
          options.filenames.each do |file|
            @filenames[file] = "#{file}.pdf"
          end

        # If it's a new hash, the destination filename is provided
        elsif options.filenames.is_a?(Hash)
          options.filenames.each do |file, output|
            @filenames[file] = "#{output}"
          end

        end

        @filenames
      end

      def all_html_files
        # TODO: find a better way?!
        Dir.glob(File.join(@prefix, '**', '*.html')).map do |d|
          File.join(File.dirname(d).sub(@prefix, ''), File.basename(d, '.html'))[1..-1]
        end
      end

      def generate_pdf(html_filename, pdf_filename)
        kit = ::PDFKit.new(File.new(html_filename),
          disable_smart_shrinking:  options.disable_smart_shrinking,
          quiet:                    options.quiet,
          page_size:                options.page_size,
          margin_top:               options.margin_top,
          margin_right:             options.margin_right,
          margin_bottom:            options.margin_bottom,
          margin_left:              options.margin_left,
          print_media_type:         options.print_media_type,
          encoding:                 options.encoding)
        file = kit.to_file(pdf_filename)
        # puts "pdfkit: #{kit.command}"
      end

    end
  end
end
