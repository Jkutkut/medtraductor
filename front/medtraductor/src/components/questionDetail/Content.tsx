import {ContentModel} from "../../model/serverModels";
import ContentMetadata from "./ContentMetadata";
import ContentPoints from "./ContentPoints";

interface Props {
  content: ContentModel;
  isAnswer: boolean;
};

const Content = ({content, isAnswer}: Props) => {
  return <>
    <p>{content.data}</p>
    <ContentMetadata content={content} isAnswer={isAnswer}/>
    <ContentPoints content={content}/>
  </>;
};

export default Content;
