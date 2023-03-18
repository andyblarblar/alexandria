-- Gets all books checked out for a given patron
SELECT B.call_num, b_lib_id, day_checked, due_date, genre, ISBN, title, author
FROM PATRONS
         JOIN CHECKS_OUT CO on PATRONS.p_id = CO.p_id and PATRONS.lib_id = CO.p_lib_id
         JOIN BOOKS B on B.call_num = CO.call_num and B.lib_id = CO.b_lib_id
WHERE PATRONS.p_id = {} AND PATRONS.lib_id = {}
