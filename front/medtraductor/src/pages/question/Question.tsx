import {Link, useParams} from "react-router-dom";

interface Props {

};

const Question = ({}: Props) => {
  let {id, title} = useParams();
  return <>
    <Link to="../">Back</Link>
    <h3>{title}</h3>
    <p>id: {id}</p>
  </>;
};

export default Question;
