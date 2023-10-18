import questionBrowser from "../../hooks/questionBrowser";

interface Props {

};

const Browser = ({}: Props) => {
  const { questions } = questionBrowser();
  const parseDate = (date: string) => {
    const d = new Date(date);
    // format: HH:MM DD/MM/YYYY
    return `${d.getHours()}:${d.getMinutes()} ${d.getDate()}/${d.getMonth()}/${d.getFullYear()}`;
  };

  return <>
    <h3>Latest questions</h3>
    <ul>
      {questions.map((q, i) => (
        <li key={i}>
          <div>
            <h4>{q.title}</h4>
            <p>{parseDate(q.date)}</p>
          </div>
        </li>
      ))}
    </ul>
  </>;
};

export default Browser;
