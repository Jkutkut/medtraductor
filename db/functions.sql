DROP FUNCTION IF EXISTS create_question_content(QUESTION.ID%TYPE, CONTENT.DATA%TYPE);
CREATE FUNCTION create_question_content(
    question_id QUESTION.ID%TYPE,
    content_text CONTENT.DATA%TYPE
) RETURNS CONTENT.ID%TYPE
AS $$
DECLARE
    author_id MEDUSER.ID%TYPE;
    content_id CONTENT.ID%TYPE;
BEGIN
    author_id := (SELECT AUTHOR FROM QUESTION WHERE ID = question_id);
    INSERT INTO CONTENT (AUTHOR, DATA) VALUES (author_id, content_text) RETURNING ID INTO content_id;
    UPDATE QUESTION SET QUESTION_CONTENT_ID = content_id WHERE ID = question_id;
    RETURN content_id;
END $$ LANGUAGE plpgsql;