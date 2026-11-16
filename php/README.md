# Energy Prices API - PHP Package

Energy Prices returns the latest daily closing spot price for WTI and Brent crude, Henry Hub natural gas and US gasoline, diesel, heating oil, propane and jet fuel benchmarks, with the previous close, the daily change and the 52-week high and low. Convert to barrels, gallons, liters, MMBtu, therms or MWh, ask for several benchmarks at once, or pull a daily or weekly history.

## Installation

Install via Composer:

```bash
composer require apiverve/energyprices
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Energyprices\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'benchmark' => 'wti',
    'unit' => 'gallon',
    'date' => '2025-06-13',
    'history' => 'daily',
    'days' => 30
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Energyprices\Client;
use APIVerve\Energyprices\Exceptions\APIException;
use APIVerve\Energyprices\Exceptions\ValidationException;

try {
    $response = $client->execute(['benchmark' => 'wti', 'unit' => 'gallon', 'date' => '2025-06-13', 'history' => 'daily', 'days' => 30]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/energyprices?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/energyprices?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/energyprices?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
