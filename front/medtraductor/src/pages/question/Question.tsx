import {Link, useParams} from "react-router-dom";
import RestManager from "../../rest/RestManager";
import {restSingleContent} from "../../hooks/restContent";
import QuestionModel from "../../model/sql/QuestionModel";
import Loading from "../../components/loading/Loading";
import Error404 from "../error/error404";

interface Props {

};

const Question = ({}: Props) => {
  let {id} = useParams();
  let {data: question, isLoading,isError} = restSingleContent<QuestionModel>(
    () => RestManager.getInstance().getQuestion(id!)
  );
  if (isLoading) {
    return <Loading />;
  }
  if (isError) {
    return <Error404 wanted="question">
      <Link to="../" className="btn btn-primary">Go back to questions</Link>
    </Error404>;
  }
  question = question!;
  return <>
    <h3>{question.title}</h3>
    <p>id: {question.id}</p>
    <p>author: {question.author}</p>
    <p>date: {question.date}</p>
    <p>content: {question.question_content_id}</p>
  </>;
};

export default Question;
