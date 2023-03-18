-- Views all of a libraries inventory, given a name
SELECT call_num, BOOKS.lib_id, genre, ISBN, title, author
FROM BOOKS
         JOIN LIBRARIES L on L.lib_id = BOOKS.lib_id
WHERE name == {}
