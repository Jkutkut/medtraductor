import {Link, useParams} from "react-router-dom";
import RestManager from "../../rest/RestManager";
import {restContent} from "../../hooks/restContent";
import Loading from "../../components/loading/Loading";
import Error404 from "../error/error404";
import {ContentModel, QuestionModel} from "../../model/serverModels";
import ContentMetadata from "../../components/questionDetail/ContentMetadata";
import Answer from "../../components/questionDetail/Answer";
import ContentPoints from "../../components/questionDetail/ContentPoints";
import Answers from "../../components/questionDetail/Answers";
import Content from "../../components/questionDetail/Content";
import ShareCurrentPage from "../../components/shareables/ShareCurrentPage";
import Question from "../../components/questionDetail/Question";

interface Props {

};

const QuestionDetail = ({}: Props) => {
  let {id} = useParams();
  let {data: question, isLoading,isError} = restContent<QuestionModel>(
    () => RestManager.getInstance().getQuestionDetail(id!)
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

  const debug_answer: ContentModel = {
    author: question.author,
    created: question.date,
    data: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed gravida quam nec velit euismod, et lacinia nulla euismod.",
    good_content: false,
    id: (question.question_content as ContentModel).id,
    last_modified: (question.question_content as ContentModel).last_modified
  };
  return <>
    {/* TODO */}
    {/* TODO i18n */}
    <div className="container mt-4">
      <div className="row">
        <div className="col-md-8">
          <Question question={question}/>

          <Answers answers={question.answers as ContentModel[]}/>
          <Answer content={debug_answer}/> {/* TODO remove */}

          <h2>Post Your Answer</h2>
          <div className="form-group">
            <label htmlFor="answer">Your Answer</label>
            <textarea className="form-control" id="answer" rows={4} placeholder="Enter your answer here..."/>
          </div>
          {/* TODO */}
          <button
            className="btn btn-primary mt-3"
            onClick={() => {
              alert("Not implemented!");
            }}
          >
            Post Answer
          </button>
        </div>
      </div>
    </div>
  </>;
};

export default QuestionDetail;
