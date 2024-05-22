# frozen_string_literal: true

require_relative "../shopify_factories/downloader"

namespace :shopify_factories do
  desc "A set of tasks to manage Shopify factories."

  namespace :clean do
    desc "Delete all Shopify factories."
    task all: :environment do
      puts "Deleting all Shopify factories..."
      Dir.glob("spec/factories/shopify/*").each do |file|
        File.delete(file)
      end
    end
  end

  namespace :download do
    desc "Only for basic Shopify REST resources."
    task basic: :environment do
      ShopifyFactories::Downloader.new.download_basic
    end

    desc "For all Shopify REST resources"
    task all: :environment do
      ShopifyFactories::Downloader.new.download_all
    end
  end
end
