import {QuestionModel} from "../model/serverModels";
import QuestionSqlModel from "../model/sql/QuestionSqlModel";
import {Uuid} from "../model/sql/sqlTypes";
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

  protected sqlRequest<T>(query: string): Promise<DBQueryResponse<T>> {
    return this.api.fetch(this.host, "/api/v1/dbquery", ApiMethod.Post,
      (response: Response) => {
        return response.json();
      },
      {query}
    )
    .catch((_: Error) => {
      // console.error(typeof e);
      return new Promise<DBQueryResponse<T>>((resolve) => {
        resolve({size: 0, data: []} as DBQueryResponse<T>);
      });
    });
  }
  public async getQuestions(): Promise<DBQueryResponse<QuestionSqlModel>> {
    return this.sqlRequest<QuestionSqlModel>("SELECT * FROM QUESTION ORDER BY DATE DESC");
  }

  public async getPagedQuestions(
    page: number,
    pageSize: number
  ): Promise<DBQueryResponse<QuestionSqlModel>> {
    const offset = page * pageSize;
    return this.sqlRequest<QuestionSqlModel>(
      `SELECT * FROM QUESTION ORDER BY DATE DESC LIMIT ${pageSize} OFFSET ${offset}`
    );
  }

  // public async getQuestion(id: Uuid): Promise<DBQueryResponse<QuestionModel>> {
  //   return this.sqlRequest<QuestionModel>(`SELECT * FROM QUESTION WHERE ID = '${id}'`);
  // }

  public async getQuestionDetail(id: Uuid): Promise<QuestionModel> {
    return this.api.fetch(this.host, `/api/v1/question_detail/${id}`, ApiMethod.Get,
      (response: Response) => {
        return response.json();
      }
    )
    .then(json => {
      console.debug(json);
      return json;
    }) // TODO DEBUG
    .catch((e: Error) => {
      throw e;
    });
  }
};

export default RestManager;
