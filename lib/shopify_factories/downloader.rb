# frozen_string_literal: true

module ShopifyFactories
  class Downloader
    def initialize
      @client = ::Octokit::Client.new
      @version = ShopifyApp.configuration.api_version.gsub("-", "_")
    end

    def download_basic
      download('basic')
    end

    def download_all
      download('all')
    end

    def download(type)
      puts "Downloading Shopify factories for Shopify API version #{@version}..."
      response = @client.contents('eshopguide/shopify_factories_ai_assistant', path: "lib/output/spec/factories/shopify/#{@version}/")

      response.each do |file| 
        save_file(file[:download_url], file[:name])
      end
    end

    private 

    def save_file(url, filename)
      URI.open(url) do |file|
        puts "Downloading #{filename}..."
        File.open("spec/factories/shopify/#{filename}", 'wb') do |output|
          output.write(file.read)
        end
      end
    end
  end
end
