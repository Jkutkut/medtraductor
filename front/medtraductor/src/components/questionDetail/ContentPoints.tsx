import {AuthorModel, ContentModel} from "../../model/serverModels";

interface Props {
  content: ContentModel;
};

const ContentPoints = ({content}: Props) => {
  // TODO
  const upvote = () => {
    console.log("upvoted content made by " + (content.author as AuthorModel).username);
  };
  // TODO
  const downvote = () => {
    console.log("downvoted content made by " + (content.author as AuthorModel).username);
  };
  return <>
    <div className="d-flex align-items-center text-muted">
      <button
        className="btn btn-outline-success mr-2"
        onClick={upvote}
      >
        Upvote
      </button>
      {/* TODO */}
      <div className="mx-3">0</div>
      <button
        className="btn btn-outline-danger ml-2"
        onClick={downvote}
      >
        Downvote
      </button>
    </div>
  </>;
};

export default ContentPoints;
