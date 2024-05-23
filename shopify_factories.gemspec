# frozen_string_literal: true

require_relative "lib/shopify_factories/version"

Gem::Specification.new do |spec|
  spec.name = "shopify_factories"
  spec.version = ShopifyFactories::VERSION
  spec.authors = ["Vitaly Lyapunov"]
  spec.email = ["vitaly@eshop-guide.de"]
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"
  spec.description   = "A gem to add factories for Shopify API objects."
  spec.summary       = "Your FactoryBot factories for Shopify API objects."
  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"
  # spec.metadata["source_code_uri"] = "https://github.com/eshopguide/shopify_factories"
  spec.metadata["changelog_uri"] = "https://github.com/eshopguide/shopify_factories/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.files  = Dir["lib/**/*.rb"] + Dir["lib/tasks/**/*.rb"]
  spec.files = Dir['**/*'].reject { |file| file == 'shopify_factories-0.1.0.gem' }

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "octokit", '~> 8.1.0'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
