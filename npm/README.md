# Energy Prices API

Energy Prices returns the latest daily closing spot price for WTI and Brent crude, Henry Hub natural gas and US gasoline, diesel, heating oil, propane and jet fuel benchmarks, with the previous close, the daily change and the 52-week high and low. Convert to barrels, gallons, liters, MMBtu, therms or MWh, ask for several benchmarks at once, or pull a daily or weekly history.

[![npm version](https://img.shields.io/npm/v/@apiverve/energyprices.svg)](https://www.npmjs.com/package/@apiverve/energyprices)

This is a JavaScript wrapper for the [Energy Prices API](https://apiverve.com/marketplace/energyprices?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/energyprices
```

Using yarn:
```shell
yarn add @apiverve/energyprices
```

---

## Configuration

Before using the Energy Prices API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The Energy Prices API documentation is found here: [https://docs.apiverve.com/ref/energyprices](https://docs.apiverve.com/ref/energyprices?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const energypricesAPI = require('@apiverve/energyprices');
const api = new energypricesAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  benchmark: "wti",
  unit: "gallon",
  date: "2025-06-13",
  history: "daily",
  days: 30
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  benchmark: "wti",
  unit: "gallon",
  date: "2025-06-13",
  history: "daily",
  days: 30
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  benchmark: "wti",
  unit: "gallon",
  date: "2025-06-13",
  history: "daily",
  days: 30
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
