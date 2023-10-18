import ApiHeaders from "./ApiHeaders";
import ApiMethod from "./ApiMethod";
import { FutureParser } from "./futures/FutureParser";

class ApiManager {
  private static _instance: ApiManager;

  private constructor() {
  }

  public static getInstance(): ApiManager {
    if (!ApiManager._instance) {
      ApiManager._instance = new ApiManager();
    }
    return ApiManager._instance;
  }

  private makeUrl(host: string, endpoint: string): string {
    return `${host}${endpoint}`;
  }

  private handleBadResponse<T>(response: Response): Promise<T> {
    return new Promise((_resolve, reject) => {
      reject(`Bad response: http ${response.status}\n${response.statusText}`);
    });
  }

  protected async justFetch(
    host: string,
    endpoint: string,
    method: ApiMethod,
    body?: any,
  ): Promise<Response> {
    let headers: any | undefined = undefined;
    if (body) {
      headers = ApiHeaders.json;
      body = JSON.stringify(body);
    }
    return fetch(this.makeUrl(host, endpoint), {
      method,
      headers,
      body
    });
  }

  public async fetch<T>(
    host: string,
    endpoint: string,
    method: ApiMethod,
    parser: FutureParser<Response, T>,
    body: any | undefined,
  ): Promise<T> {
    return this.justFetch(host, endpoint, method, body).then((response: Response) => {
      if (response.ok) {
        return parser(response);
      }
      return this.handleBadResponse(response);
    });
  }
};

export default ApiManager;
