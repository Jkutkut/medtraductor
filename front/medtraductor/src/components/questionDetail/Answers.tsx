import {ContentModel} from "../../model/serverModels";
import Answer from "./Answer";

interface Props {
  answers: ContentModel[];
};

const Answers = ({answers}: Props) => {
  return <>
    <h2 className="mt-4">Answers</h2>
    {(answers as ContentModel[]).map((answer: ContentModel) => (
      <Answer content={answer} key={answer.id}/>
    ))}
  </>;
};

export default Answers;
