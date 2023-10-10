DROP FUNCTION IF EXISTS new_question(QUESTION.TITLE%TYPE, CONTENT.DATA%TYPE, MEDUSER.USERNAME%TYPE, TAG.NAME%TYPE);
CREATE FUNCTION new_question(
    title QUESTION.TITLE%TYPE,
    content_text CONTENT.DATA%TYPE,
    author_username MEDUSER.USERNAME%TYPE,
    category_name TAG.NAME%TYPE
) RETURNS QUESTION.ID%TYPE
AS $$
DECLARE
    author_id MEDUSER.ID%TYPE;
    question_id QUESTION.ID%TYPE;
    content_id CONTENT.ID%TYPE;
    category_id TAG.ID%TYPE;
BEGIN
    author_id := (SELECT ID FROM MEDUSER WHERE USERNAME = author_username);
    category_id := (SELECT ID FROM TAG WHERE NAME = category_name);
    INSERT INTO CONTENT (AUTHOR, DATA) VALUES (author_id, content_text) RETURNING ID INTO content_id;
    INSERT INTO QUESTION (TITLE, QUESTION_CONTENT_ID, AUTHOR) VALUES (title, content_id, author_id) RETURNING ID INTO question_id;
    INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES (question_id, category_id);
    RETURN question_id;
END $$ LANGUAGE plpgsql;

-- todo update_question
-- todo vote_question
-- todo unvote_question
-- todo new_answer
-- todo update_answer
-- todo tag_question

-- todo validate_question
-- todo validate_answer
-- ? medpoints?
