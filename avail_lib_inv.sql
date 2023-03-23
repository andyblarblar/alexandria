-- Selects all available books from a library, given that libraries name
SELECT BOOKS.call_num, BOOKS.lib_id, genre, ISBN, title, author
FROM BOOKS
         JOIN LIBRARIES L on L.lib_id = BOOKS.lib_id
WHERE name == ?
  AND NOT EXISTS(SELECT * FROM CHECKS_OUT as CO where L.lib_id = CO.b_lib_id AND CO.call_num = BOOKS.call_num)
