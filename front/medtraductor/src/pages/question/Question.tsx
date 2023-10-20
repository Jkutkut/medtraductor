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
    {/* TODO */}
    {/* TODO i18n */}
    <div className="container mt-4">
      <div className="row">
        <div className="col-md-8">
          {/* TODO refactor */}
          <div
            id="url-copy"
            onClick={() => {
              const url = window.location.href;
              navigator.clipboard.writeText(url);
              alert("Copied to clipboard!");
            }}
          >
            <h1>{question.title}</h1>
          </div>
          <p className="text-muted">
            Category: <span className="font-weight-bold">
               XXXXXXXXXXXXXXXXXXX
              {/* TODO category */}
              {/* TODO link to category */}
            </span>
          </p>
          <p>
            This is a sample question description. Lorem ipsum dolor sit amet,
            consectetur adipiscing elit.
            Nulla facilisi. Cras sed magna in mi convallis convallis.
            <b>{question.question_content_id}</b>
            {/* TODO */}
          </p>
          <p className="text-muted">
            Asked on: <span className="font-weight-bold">
              {question.date}
              {/* TODO format date */}
            </span> by <span className="font-weight-bold">
              John Doe {question.author.substring(0, 10) + "..."}
              {/* TODO link to user */}
            </span>
          </p>
          <h2>Answers</h2>
          <div className="card mb-3">
            <div className="card-body">
              <p>Sed gravida quam nec velit euismod, et lacinia nulla euismod.</p>
              <p className="text-muted">
                Answered on: <span className="font-weight-bold">
                  2021-01-01
                  {/* TODO format date */}
                </span> by <span className="font-weight-bold">
                  John Doe
                  {/* TODO link to user */}
                </span>
              </p>
              <div className="d-flex align-items-center text-muted">
                {/* TODO */}
                <button className="btn btn-outline-success mr-2">Upvote</button>
                {/* TODO */}
                <div className="mx-3">0</div>
                {/* TODO */}
                <button className="btn btn-outline-danger ml-2">Downvote</button>
              </div>
            </div>
          </div>

          <h2>Post Your Answer</h2>
          <form>
            <div className="form-group">
              <label htmlFor="answer">Your Answer</label>
              <textarea className="form-control" id="answer" rows={4} placeholder="Enter your answer here..."/>
            </div>
            {/* TODO */}
            <button type="submit" className="btn btn-primary mt-3">Post Answer</button>
          </form>
        </div>
      </div>
    </div>
  </>;
};

export default Question;
