# Energy Prices API - Ruby Gem

Energy Prices returns the latest daily closing spot price for WTI and Brent crude, Henry Hub natural gas and US gasoline, diesel, heating oil, propane and jet fuel benchmarks, with the previous close, the daily change and the 52-week high and low. Convert to barrels, gallons, liters, MMBtu, therms or MWh, ask for several benchmarks at once, or pull a daily or weekly history.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_energyprices'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_energyprices
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_energyprices'

# Initialize the client
client = APIVerve::Energyprices::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  benchmark: "wti",
  unit: "gallon",
  date: "2025-06-13",
  history: "daily",
  days: 30
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ benchmark: "wti", unit: "gallon", date: "2025-06-13", history: "daily", days: 30 })
  puts response["data"]
rescue APIVerve::Energyprices::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Energyprices::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Energyprices::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "count": 1,
    "date": "2026-11-11",
    "prices": [
      {
        "benchmark": "wti",
        "name": "WTI Crude Oil",
        "product": "crude oil",
        "location": "Cushing, OK",
        "currency": "USD",
        "unit": "barrel",
        "nativeUnit": "barrel",
        "price": 89.62,
        "date": "2026-11-11",
        "previousClose": 89.62,
        "previousDate": "2026-11-10",
        "change": 0,
        "changePercent": 0,
        "changeDirection": "unchanged",
        "high52w": 114.58,
        "high52wDate": "2026-04-07",
        "low52w": 55.44,
        "low52wDate": "2025-12-16"
      }
    ]
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/energyprices?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/energyprices?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/energyprices?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
