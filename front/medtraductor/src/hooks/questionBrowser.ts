import {useEffect, useState} from "react";
import RestManager from "../rest/RestManager";
import DBQueryResponse from "../rest/model/DBQueryResponse";
import QuestionModel from "../model/QuestionModel";

interface QuestionBrowserObject {
  questions: any[]; // TODO
};

const questionBrowser = () => {
  const [questions, setQuestions] = useState<QuestionModel[]>([]);

  useEffect(() => {
    RestManager.getInstance().getQuestions().then((r: DBQueryResponse<QuestionModel>) => {
      console.log(r);
      setQuestions(r.data);
    });
  }, []);

  const obj: QuestionBrowserObject = {
    questions,
  };
  return obj;
};

export default questionBrowser;
