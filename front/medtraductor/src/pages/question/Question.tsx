import {Link, Navigate, useParams} from "react-router-dom";
import RestManager from "../../rest/RestManager";
import {restSingleContent} from "../../hooks/restContent";
import QuestionModel from "../../model/sql/QuestionModel";
import Loading from "../../components/loading/Loading";

interface Props {

};

const Question = ({}: Props) => {
  let {id, title} = useParams();

  let {data: question, isLoading,isError} = restSingleContent<QuestionModel>(
    RestManager.getInstance().getQuestion(id!)
  );
  if (isLoading) {
    return <Loading />;
  }
  if (!id || !title || isError) {
    //return <Navigate to="/404" />;
    return <>404: {id} is not a valid question</>;
  }

  return <>
    <Link to="../">Back</Link>
    <h3>{title}</h3>
    <p>id: {id}</p>
  </>;
};

export default Question;
