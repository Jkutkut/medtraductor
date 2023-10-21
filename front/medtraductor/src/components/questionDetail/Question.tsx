import {ContentModel, QuestionModel} from "../../model/serverModels";
import ShareCurrentPage from "../shareables/ShareCurrentPage";
import Content from "./Content";

interface Props {
  question: QuestionModel;
};

const Question= ({question}: Props) => {
  return <>
    <ShareCurrentPage>
      <h1>{question.title}</h1>
    </ShareCurrentPage>
    {question.tags && question.tags.length > 0 && <>
      <p className="text-muted">
        {question.tags.length === 1 ? 'Tag' : 'Tags'}: <span className="font-weight-bold">
          {question.tags.map((tag: any) => tag.name).join(", ")}
          {/* TODO link to tags */}
        </span>
      </p>
    </>}
    <Content content={question.question_content as ContentModel} isAnswer={false}/>
  </>;
};

export default Question;
