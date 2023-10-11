/* DEBUG functions */
CREATE OR REPLACE FUNCTION random_date()
RETURNS timestamp AS $$
BEGIN
    RETURN (SELECT TIMESTAMP '2023-10-05 00:00:00' + random() * (TIMESTAMP '2023-10-11 00:00:00' - TIMESTAMP '2023-10-05 00:00:00'));
END $$ LANGUAGE plpgsql;

/* FUNCTIONS */
-- new_question
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
    random_date timestamp;
BEGIN
    -- TODO remove random date
    random_date := random_date();
    author_id := (SELECT ID FROM MEDUSER WHERE USERNAME = author_username);
    category_id := (SELECT ID FROM TAG WHERE NAME = category_name);
    -- INSERT INTO CONTENT (AUTHOR, DATA) VALUES (author_id, content_text) RETURNING ID INTO content_id;
    INSERT INTO CONTENT (AUTHOR, DATA, CREATED) VALUES (author_id, content_text, random_date) RETURNING ID INTO content_id;
    -- INSERT INTO QUESTION (TITLE, QUESTION_CONTENT_ID, AUTHOR) VALUES (title, content_id, author_id) RETURNING ID INTO question_id;
    INSERT INTO QUESTION (TITLE, QUESTION_CONTENT_ID, AUTHOR, DATE) VALUES (title, content_id, author_id, random_date) RETURNING ID INTO question_id;
    INSERT INTO QUESTION_TAG (QUESTION_ID, TAG_ID) VALUES (question_id, category_id);
    RETURN question_id;
END $$ LANGUAGE plpgsql;

-- new_user
DROP FUNCTION IF EXISTS new_user(MEDUSER.USERNAME%TYPE);
CREATE FUNCTION new_user(
    username MEDUSER.USERNAME%TYPE
) RETURNS MEDUSER.ID%TYPE
AS $$
DECLARE
    user_id MEDUSER.ID%TYPE;
BEGIN
    -- TODO remove random date
    -- INSERT INTO MEDUSER (USERNAME) VALUES (username) RETURNING ID INTO user_id;
    INSERT INTO MEDUSER (USERNAME, CREATED) VALUES (username, random_date()) RETURNING ID INTO user_id;
    RETURN user_id;
END $$ LANGUAGE plpgsql;

-- todo update_question
-- todo new_answer
-- todo update_answer
-- todo tag_question

-- todo validate_question
-- todo validate_answer
-- ? medpoints?
