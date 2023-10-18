import {useEffect, useState} from "react";
import RestManager from "../rest/RestManager";
import DBQueryResponse from "../rest/model/DBQueryResponse";
import QuestionModel from "../model/QuestionModel";

interface QuestionBrowserObject {
  questions: any[]; // TODO
  getMoreQuestions: (() => void) | null;
};

const questionBrowser = () => {
  const QUESTON_PAGE_SIZE = 10;
  const [questions, setQuestions] = useState<QuestionModel[]>([]);
  const [moreQuestionsAvailable, setMoreQuestionsAvailable] = useState<boolean>(true);

  // useEffect(() => {
  //   RestManager.getInstance().getQuestions().then((r: DBQueryResponse<QuestionModel>) => {
  //     console.log(r);
  //     setQuestions(r.data);
  //   });
  // }, []);

  const getMoreQuestions = () => {
    const page = Math.floor(questions.length / QUESTON_PAGE_SIZE);
    RestManager.getInstance()
      .getPagedQuestions(page, QUESTON_PAGE_SIZE)
      .then((r: DBQueryResponse<QuestionModel>) => {
        if (r.data.length < QUESTON_PAGE_SIZE) {
          setMoreQuestionsAvailable(false);
        }
        setQuestions([...questions, ...r.data]);
      });
  };

  useEffect(() => {
    getMoreQuestions();
  }, []);

  const obj: QuestionBrowserObject = {
    questions,
    getMoreQuestions: moreQuestionsAvailable ? getMoreQuestions : null
  };
  return obj;
};

export default questionBrowser;
