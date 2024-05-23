# frozen_string_literal: true

require_relative "shopify_factories/version"

module ShopifyFactories
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/shopify_factories.rake"
    end
  end

  class Error < StandardError; end
end
