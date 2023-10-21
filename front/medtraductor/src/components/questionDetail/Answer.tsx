import {ContentModel} from "../../model/serverModels";
import Content from "./Content";

interface Props {
  content: ContentModel;
};

const Answer = ({content}: Props) => {
  return <>
    <div className="card mb-3">
      <div className="card-body">
        <Content content={content} isAnswer={true}/>
      </div>
    </div>
  </>;
};

export default Answer;
