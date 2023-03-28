-- Returns a book, given only it's identifier (IRL, this would be like dropping the book off).
-- This works because we have a constraint that books are unique when checked out, so we can use them like a key.
DELETE FROM CHECKS_OUT
WHERE call_num == ? AND b_lib_id == ?