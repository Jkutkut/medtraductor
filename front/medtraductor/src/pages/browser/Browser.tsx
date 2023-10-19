import {useState} from "react";
import questionBrowser from "../../hooks/questionBrowser";
import {Link} from "react-router-dom";

interface Props {

};

const Browser = ({}: Props) => {
  const { questions, getMoreQuestions } = questionBrowser();
  const [ reverse, setReverse ] = useState(false);
  const parseDate = (date: string) => {
    const d = new Date(date);
    return `${d.getHours()}:${d.getMinutes()} ${d.getDate()}/${d.getMonth()}/${d.getFullYear()}`;
  };

  const sortedQuestions = reverse ? [...questions].reverse() : questions;
  const loadMore = <>
    {getMoreQuestions &&
      <button
        className="btn btn-outline-primary"
        onClick={getMoreQuestions}
      >Load more</button>
    }
  </>;
  return <>
    <h3>Latest questions</h3>
    <div className="mb-4">
      <p>
        questions by date: {questions.length}
        ({reverse ? "oldest first" : "newest first"})
      </p>
      <button className="btn btn-outline-primary" onClick={() => setReverse(!reverse)}>
        reverse
      </button>
    </div>
    <div className="mb-4">
      {reverse && loadMore}
    </div>
    <ul>
      {sortedQuestions.map((q, i) => (
        <li key={i}>
          <div>
            <h4>{q.title}</h4>
            <p>{parseDate(q.date)}</p>
            <Link to={`/questions/${q.id}/${q.title}`}>view</Link>
          </div>
        </li>
      ))}
    </ul>
    {!reverse && loadMore}
  </>;
};

export default Browser;
