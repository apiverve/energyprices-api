Energy Prices API
============

Energy Prices returns the latest daily closing spot price for WTI and Brent crude, Henry Hub natural gas and US gasoline, diesel, heating oil, propane and jet fuel benchmarks, with the previous close, the daily change and the 52-week high and low. Convert to barrels, gallons, liters, MMBtu, therms or MWh, ask for several benchmarks at once, or pull a daily or weekly history.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-energyprices.svg)](https://pypi.org/project/apiverve-energyprices/)

This is a Python wrapper for the [Energy Prices API](https://apiverve.com/marketplace/energyprices?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-energyprices
```

Using `pip3`:

```bash
pip3 install apiverve-energyprices
```

---

## Configuration

Before using the Energy Prices API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_energyprices.apiClient import EnergypricesAPIClient

# Initialize the client with your APIVerve API key
api = EnergypricesAPIClient("[YOUR_API_KEY]")

query = {
    "benchmark": "wti",
    "unit": "gallon",
    "date": "2025-06-13",
    "history": "daily",
    "days": 30
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Energy Prices API documentation is found here: [https://docs.apiverve.com/ref/energyprices](https://docs.apiverve.com/ref/energyprices?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_energyprices.apiClient import EnergypricesAPIClient

# Initialize the client with your APIVerve API key
api = EnergypricesAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "benchmark": "wti",
    "unit": "gallon",
    "date": "2025-06-13",
    "history": "daily",
    "days": 30
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `EnergypricesAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_energyprices.apiClient import EnergypricesAPIClient, EnergypricesAPIClientError

api = EnergypricesAPIClient("[YOUR_API_KEY]")

query = {
    "benchmark": "wti",
    "unit": "gallon",
    "date": "2025-06-13",
    "history": "daily",
    "days": 30
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except EnergypricesAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_energyprices.apiClient import EnergypricesAPIClient, EnergypricesAPIClientError

api = EnergypricesAPIClient("[YOUR_API_KEY]")

query = {
    "benchmark": "wti",
    "unit": "gallon",
    "date": "2025-06-13",
    "history": "daily",
    "days": 30
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except EnergypricesAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_energyprices.apiClient import EnergypricesAPIClient, EnergypricesAPIClientError

query = {
    "benchmark": "wti",
    "unit": "gallon",
    "date": "2025-06-13",
    "history": "daily",
    "days": 30
}

# Using context manager ensures proper cleanup
with EnergypricesAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except EnergypricesAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_energyprices.apiClient import EnergypricesAPIClient

# Enable debug mode
api = EnergypricesAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "benchmark": "wti",
    "unit": "gallon",
    "date": "2025-06-13",
    "history": "daily",
    "days": 30
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_energyprices.apiClient import EnergypricesAPIClient

api = EnergypricesAPIClient("[YOUR_API_KEY]")

query = {
    "benchmark": "wti",
    "unit": "gallon",
    "date": "2025-06-13",
    "history": "daily",
    "days": 30
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
