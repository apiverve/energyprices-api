# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_energyprices"
  spec.version       = "1.2.6"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "Energy Prices API - Ruby Client"
  spec.description   = "Energy Prices returns the latest daily closing spot price for WTI and Brent crude, Henry Hub natural gas and US gasoline, diesel, heating oil, propane and jet fuel benchmarks, with the previous close, the daily change and the 52-week high and low. Convert to barrels, gallons, liters, MMBtu, therms or MWh, ask for several benchmarks at once, or pull a daily or weekly history."
  spec.homepage      = "https://apiverve.com/marketplace/energyprices?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/energyprices-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/energyprices"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
