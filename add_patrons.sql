-- query used to add a patron to a specific library
INSERT INTO
    PATRONS(p_id, lib_id, name, email)
        VALUES(?,?,?,?)