-----------------------------------------------

SELECT CONCAT(
    E'new_question(\n',
    '    ''', Q.TITLE, E''',\n',
    '    ''', C.DATA, E''',\n',
    '    ''', U.USERNAME, E'''\n',
    ')'
) FROM QUESTION Q, MEDUSER U, CONTENT C
WHERE Q.AUTHOR = U.ID AND Q.QUESTION_CONTENT_ID = C.ID;

-----------------------------------------------

SELECT Q.TITLE FROM QUESTION AS Q, QUESTION_TAG AS QT
WHERE QT.QUESTION_ID = Q.ID AND QT.TAG_ID = (
	SELECT ID FROM TAG WHERE NAME = 'NEPHROLOGY'
);

-----------------------------------------------

SELECT date_trunc('day', date) "day", COUNT(*) AS "questions"
FROM question GROUP BY 1 ORDER BY 1 ASC;

-----------------------------------------------