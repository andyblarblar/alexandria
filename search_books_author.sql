-- Views the libraries and locations that have books available on a given book author
SELECT L.lib_id, name, location, title, genre, BOOKS.call_num
FROM BOOKS
    JOIN LIBRARIES L on L.lib_ID = BOOKS.lib_id
WHERE author == {} AND NOT EXISTS(SELECT * FROM CHECKS_OUT AS CO WHERE CO.b_lib_id == L.lib_id AND CO.call_num = BOOKS.call_num)
