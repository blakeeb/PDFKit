class PDFKit
  class Configuration
    attr_accessor :meta_tag_prefix, :default_options, :root_url
    attr_writer :wkhtmltopdf

    def initialize
      @meta_tag_prefix = 'pdfkit-'
      @default_options = {
        :encoding => "UTF-8"
      }
    end

    def wkhtmltopdf
      @wkhtmltopdf ||= (defined?(Bundler::GemfileError) ? `bundle exec which wkhtmltoimage` : `which wkhtmltoimage`).chomp
    end
  end

  class << self
    attr_accessor :configuration
  end

  # Configure PDFKit someplace sensible,
  # like config/initializers/pdfkit.rb
  #
  # @example
  #   PDFKit.configure do |config|
  #     config.wkhtmltopdf = '/usr/bin/wkhtmltopdf'
  #   end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
