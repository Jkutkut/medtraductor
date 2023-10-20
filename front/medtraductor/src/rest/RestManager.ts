import QuestionModel from "../model/sql/QuestionModel";
import ApiManager from "./APIManager";
import ApiMethod from "./ApiMethod";
import DBQueryResponse from "./model/DBQueryResponse";

class RestManager {
  protected static instance: RestManager;
  protected static host: string = "http://localhost:2000"; // TODO handle

  protected constructor() {}

  public static getInstance(): RestManager {
    if (!RestManager.instance) {
      RestManager.instance = new RestManager();
    }
    return RestManager.instance;
  }

  protected get host(): string {
    return RestManager.host;
  }

  protected get api(): ApiManager {
    return ApiManager.getInstance();
  }

  public async getQuestions(): Promise<DBQueryResponse<QuestionModel>> {
    return this.api.fetch(this.host, "/api/v1/dbquery", ApiMethod.Post,
      (response: Response) => {
        return response.json();
      },
      {
        query: "SELECT * FROM QUESTION ORDER BY DATE DESC"
      }
    );
  }

  public async getPagedQuestions(
    page: number,
    pageSize: number
  ): Promise<DBQueryResponse<QuestionModel>> {
    const offset = page * pageSize;
    return this.api.fetch(this.host, "/api/v1/dbquery", ApiMethod.Post,
      (response: Response) => {
        return response.json();
      },
      {
        query: `SELECT * FROM QUESTION ORDER BY DATE DESC LIMIT ${pageSize} OFFSET ${offset}`
      }
    );
  }
};

export default RestManager;
