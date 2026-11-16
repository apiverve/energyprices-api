declare module '@apiverve/energyprices' {
  export interface energypricesOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface energypricesResponse {
    status: string;
    error: string | null;
    data: EnergyPricesData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface EnergyPricesData {
      count:  number | null;
      date:   Date | null;
      prices: Price[];
  }
  
  interface Price {
      benchmark:       null | string;
      name:            null | string;
      product:         null | string;
      location:        null | string;
      currency:        null | string;
      unit:            null | string;
      nativeUnit:      null | string;
      price:           number | null;
      date:            Date | null;
      previousClose:   number | null;
      previousDate:    Date | null;
      change:          number | null;
      changePercent:   number | null;
      changeDirection: null | string;
      high52W:         number | null;
      high52WDate:     Date | null;
      low52W:          number | null;
      low52WDate:      Date | null;
  }

  export default class energypricesWrapper {
    constructor(options: energypricesOptions);

    execute(callback: (error: any, data: energypricesResponse | null) => void): Promise<energypricesResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: energypricesResponse | null) => void): Promise<energypricesResponse>;
    execute(query?: Record<string, any>): Promise<energypricesResponse>;
  }
}
