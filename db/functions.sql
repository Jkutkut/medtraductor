/* DEBUG functions */
CREATE OR REPLACE FUNCTION random_date()
RETURNS timestamp AS $$
BEGIN
    RETURN (SELECT TIMESTAMP '2023-10-05 00:00:00' + random() * (TIMESTAMP '2023-10-11 00:00:00' - TIMESTAMP '2023-10-05 00:00:00'));
END $$ LANGUAGE plpgsql;

/* QUESTION */
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

-- get_question_from_author
DROP FUNCTION IF EXISTS get_question_from_author(MEDUSER.ID%TYPE);
CREATE FUNCTION get_question_from_author(
    author_id MEDUSER.ID%TYPE
) RETURNS SETOF QUESTION
AS $$
BEGIN
    RETURN QUERY SELECT * FROM QUESTION WHERE AUTHOR = author_id;
END $$ LANGUAGE plpgsql;

/* USER */
-- get_user_id
DROP FUNCTION IF EXISTS get_user_id(MEDUSER.USERNAME%TYPE);
CREATE FUNCTION get_user_id(
    user_name MEDUSER.USERNAME%TYPE
) RETURNS MEDUSER.ID%TYPE
AS $$
BEGIN
    RETURN (SELECT ID FROM MEDUSER WHERE USERNAME = user_name);
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

/* VOTE */
-- vote_content
DROP FUNCTION IF EXISTS vote_content(CONTENT.ID%TYPE, MEDUSER.ID%TYPE, BOOLEAN, BOOLEAN);
CREATE FUNCTION vote_content(
    content CONTENT.ID%TYPE,
    user_name MEDUSER.ID%TYPE,
    vote BOOLEAN,
    up_vote BOOLEAN
) RETURNS VOID
AS $$
BEGIN
    IF vote THEN
        IF EXISTS (SELECT * FROM VOTE WHERE CONTENT_ID = content AND USER_ID = user_name) THEN
            UPDATE VOTE SET UPVOTE = up_vote WHERE CONTENT_ID = content AND USER_ID = user_name;
        ELSE
            INSERT INTO VOTE (CONTENT_ID, USER_ID, UPVOTE) VALUES (content, user_name, up_vote);
        END IF;
    ELSE
        DELETE FROM VOTE WHERE CONTENT_ID = content AND USER_ID = user_name;
    END IF;
END $$ LANGUAGE plpgsql;

-- vote_question
DROP FUNCTION IF EXISTS vote_question(QUESTION.ID%TYPE, MEDUSER.ID%TYPE, BOOLEAN, BOOLEAN);
CREATE FUNCTION vote_question(
    question_id QUESTION.ID%TYPE,
    user_id MEDUSER.ID%TYPE,
    vote BOOLEAN,
    upvote BOOLEAN
) RETURNS VOID
AS $$
DECLARE
    content_id CONTENT.ID%TYPE;
BEGIN
    content_id := (SELECT QUESTION_CONTENT_ID FROM QUESTION WHERE ID = question_id);
    PERFORM vote_content(content_id, user_id, vote, upvote);
END $$ LANGUAGE plpgsql;

-- todo update_question
-- todo new_answer
-- todo update_answer
-- todo tag_question

-- todo validate_question
-- todo validate_answer
-- ? medpoints?
