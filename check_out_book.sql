-- Query to check out a book, due dates are calculated as two weeks from initial check out day
INSERT INTO
    CHECKS_OUT(p_id, p_lib_id, call_num, b_lib_id, day_checked, due_date)
        VALUES(?, ?, ?, ?, date(), date('now', '+14 day'))