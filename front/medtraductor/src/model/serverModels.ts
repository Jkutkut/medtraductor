import {Uuid} from "./sql/sqlTypes";

interface QuestionModel {
  id: Uuid;
  title: string;
  question_content: Uuid | ContentModel;
  author: Uuid | AuthorModel;
  date: string;
  tags: TagModel[] | null;
  answers: ContentModel[] | null;
};

interface ContentModel {
  id: Uuid;
  author: Uuid | AuthorModel;
  data: string;
  good_content: boolean;
  created: string;
  last_modified: string;
};

interface AuthorModel {
  id: Uuid;
  username: string;
  created: string;
};

interface TagModel {
  id: number;
  name: string;
  description: string;
  related_tags: TagModel[] | null;
};

export type {QuestionModel, ContentModel, AuthorModel, TagModel};
