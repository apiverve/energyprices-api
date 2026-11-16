/**
 * Energy Prices API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the Energy Prices API.
 * API Documentation: https://docs.apiverve.com/ref/energyprices
 */

const API_KEY = process.env.APIVERVE_API_KEY || 'YOUR_API_KEY_HERE';
const API_URL = 'https://api.apiverve.com/v1/energyprices';

/**
 * Make a GET request to the Energy Prices API
 */
async function callEnergyPricesAPI() {
  try {
    // Query parameters
    const params &#x3D; new URLSearchParams({
            benchmark: &#x27;wti&#x27;,
            unit: &#x27;gallon&#x27;
        });

    const response = await fetch(`${API_URL}?${params}`, {
      method: 'GET',
      headers: {
        'x-api-key': API_KEY
      }
    });

    // Check if response is successful
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    // Check API response status
    if (data.status === 'ok') {
      console.log('✓ Success!');
      console.log('Response data:', data.data);
      return data.data;
    } else {
      console.error('✗ API Error:', data.error || 'Unknown error');
      return null;
    }

  } catch (error) {
    console.error('✗ Request failed:', error.message);
    return null;
  }
}

// Run the example
callEnergyPricesAPI()
  .then(result => {
    if (result) {
      console.log('\n📊 Final Result:');
      console.log(JSON.stringify(result, null, 2));
    }
  });
