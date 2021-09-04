# frozen_string_literal: true

require_relative "lib/stripe_payment/version"

Gem::Specification.new do |spec|
  spec.name          = "stripe_payment"
  spec.version       = StripePayment::VERSION
  spec.authors       = ["Ammad Fareed"]
  spec.email         = ["ammad.fareed786@gmail.com"]

  spec.summary       = "Use StripePayment for payments with stripe."
  spec.description   = "Use StripePayment for payments with stripe."
  spec.homepage      = "https://github.com/HeyRobotShop/stripe_payment"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
