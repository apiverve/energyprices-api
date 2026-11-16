using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.EnergyPrices
{
    /// <summary>
    /// Query options for the Energy Prices API
    /// </summary>
    public class EnergyPricesQueryOptions
    {
        /// <summary>
        /// Benchmark to price, or a comma-separated list (paid plans), or all. Defaults to wti.
        /// </summary>
        [JsonProperty("benchmark")]
        public string Benchmark { get; set; }

        /// <summary>
        /// Unit to price per: barrel, gallon or liter for crude and refined products; mmbtu, therm or mwh for natural gas. Defaults to each benchmark's published unit.
        /// </summary>
        [JsonProperty("unit")]
        public string Unit { get; set; }

        /// <summary>
        /// Date to look up (YYYY-MM-DD). Returns the close on that day, or the latest trading day before it. Omit for the latest close.
        /// </summary>
        [JsonProperty("date")]
        public string Date { get; set; }

        /// <summary>
        /// Include a price series ending at the returned date: daily closes or the last close of each week.
        /// </summary>
        [JsonProperty("history")]
        public string History { get; set; }

        /// <summary>
        /// Calendar days of history to include (1-3650). Daily history allows up to 366. Defaults to 30.
        /// </summary>
        [JsonProperty("days")]
        public int? Days { get; set; }
    }
}
