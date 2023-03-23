-- Views the libraries and locations that have books available on a given book title
SELECT L.lib_id, name, location, title, author, BOOKS.call_num
FROM BOOKS
    JOIN LIBRARIES L on L.lib_ID = BOOKS.lib_id
WHERE genre == {} AND NOT EXISTS(SELECT * FROM CHECKS_OUT AS CO WHERE CO.b_lib_id == L.lib_id AND CO.call_num = BOOKS.call_num)