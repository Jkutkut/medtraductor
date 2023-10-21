import {AuthorModel, ContentModel} from "../../model/serverModels";

interface Props {
  content: ContentModel;
  isAnswer: boolean;
};

const ContentMetadata = ({content, isAnswer}: Props) => {
  const text = (isAnswer) ? "Answered" : "Asked";
  return <>
    <p className="text-muted">
      {text} on: <span className="font-weight-bold">
        {content.created}
        {/* TODO format date */}
      </span> by <span className="font-weight-bold">
        {(content.author as AuthorModel).username}
        {/* TODO link to user */}
      </span>
    </p>
  </>;
};

export default ContentMetadata;
