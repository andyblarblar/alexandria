-- Given a library id, returns all late books, their patron, how overdue it is, and the associated fee
SELECT P.name,
       email,
       title,
       B.call_num,
       B.lib_id,
       day_checked,
       due_date,
       abs(julianday(CO.due_date) - julianday(date()))          AS days_late,
       round(abs(fine * (julianday(CO.due_date) - julianday(date()))),2) AS fee
FROM LIBRARIES
         JOIN CHECKS_OUT CO on LIBRARIES.lib_id = CO.b_lib_id
         JOIN BOOKS B on B.call_num = CO.call_num and B.lib_id = CO.b_lib_id
         JOIN PATRONS P on P.p_id = CO.p_id and P.lib_id = CO.p_lib_id
WHERE julianday(CO.due_date) < julianday(date())
  AND LIBRARIES.lib_id = {}