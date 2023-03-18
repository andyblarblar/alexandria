CREATE TABLE LIBRARIES
(
    lib_id   INTEGER  NOT NULL,
    name     CHAR(30),
    location CHAR(40) NOT NULL,
    fine     REAL     NOT NULL,
    PRIMARY KEY (lib_id)
);

CREATE TABLE BOOKS
(
    call_num INTEGER  NOT NULL,
    -- Owning library
    lib_id   INTEGER  NOT NULL,
    genre    CHAR(20),
    ISBN     CHAR(13) NOT NULL,
    title    CHAR(50) NOT NULL,
    author   CHAR(50) NOT NULL,
    PRIMARY KEY (call_num, lib_id),
    FOREIGN KEY (lib_id) REFERENCES LIBRARIES (lib_id)
);

CREATE TABLE PATRONS
(
    p_id   INTEGER   NOT NULL,
    -- Registered home library
    lib_id INTEGER   NOT NULL,
    name   CHAR(50),
    email  CHAR(320) NOT NULL,
    PRIMARY KEY (p_id, lib_id),
    FOREIGN KEY (lib_id) REFERENCES LIBRARIES (lib_id)
);

CREATE TABLE CHECKS_OUT
(
    -- Patron id
    p_id        INTEGER NOT NULL,
    p_lib_id    INTEGER NOT NULL,
    -- Book id
    call_num    INTEGER NOT NULL,
    b_lib_id    INTEGER NOT NULL,

    day_checked DATE    NOT NULL,
    due_date    DATE    NOT NULL,
    PRIMARY KEY (p_id, p_lib_id, call_num, b_lib_id),
    FOREIGN KEY (p_id, p_lib_id) REFERENCES PATRONS (p_id, lib_id),
    FOREIGN KEY (b_lib_id) REFERENCES LIBRARIES (lib_id),
    FOREIGN KEY (call_num, b_lib_id) REFERENCES BOOKS (call_num, lib_id)
);

-- Create fake data

INSERT INTO LIBRARIES(lib_id, name, location, fine)
VALUES (0, 'Dearborn public Library', 'Dearborn, MI', 0.50);

INSERT INTO LIBRARIES(lib_id, name, location, fine)
VALUES (1, 'Lansing public Library', 'Lansing, MI', 0.40);

-- Books

INSERT INTO BOOKS(call_num, lib_id, genre, ISBN, title, author)
VALUES (0, 0, 'sci-fi', 9780090898305, '2001: a space odyssey', 'Clarke');

INSERT INTO BOOKS(call_num, lib_id, genre, ISBN, title, author)
VALUES (0, 1, 'sci-fi', 9780090898305, '2001: a space odyssey', 'Clarke');

INSERT INTO BOOKS(call_num, lib_id, genre, ISBN, title, author)
VALUES (1, 0, 'fantasy', 9780747532743, 'Harry Potter and the Philosophers Stone', 'JK Rowling');

INSERT INTO BOOKS(call_num, lib_id, genre, ISBN, title, author)
VALUES (2, 0, 'reference', 9781718500440, 'The Rust Programming Language', 'Steve Klabnik');

INSERT INTO BOOKS(call_num, lib_id, genre, ISBN, title, author)
VALUES (3, 0, 'reference', 9781718500440, 'The Rust Programming Language', 'Steve Klabnik');

INSERT INTO BOOKS(call_num, lib_id, genre, ISBN, title, author)
VALUES (4, 0, 'reference', 9781718500440, 'The Rust Programming Language', 'Steve Klabnik');

INSERT INTO BOOKS(call_num, lib_id, genre, ISBN, title, author)
VALUES (1, 1, 'reference', 9781119578888, 'The Linux Bible', 'Negus');

-- Patrons

INSERT INTO PATRONS (p_id, lib_id, name, email)
VALUES (0, 0, 'Andrew Ealovega', 'avealov@umich.edu');

INSERT INTO PATRONS (p_id, lib_id, name, email)
VALUES (0, 1, 'Linus Torvalds', 'torvalds@linux.org');

-- Check out

INSERT INTO CHECKS_OUT (p_id, p_lib_id, call_num, b_lib_id, day_checked, due_date)
VALUES (0, 0, 2, 0, '2023-03-16', '2023-03-30');

INSERT INTO CHECKS_OUT (p_id, p_lib_id, call_num, b_lib_id, day_checked, due_date)
VALUES (0, 0, 4, 0, '2023-03-17', '2023-03-30');

INSERT INTO CHECKS_OUT (p_id, p_lib_id, call_num, b_lib_id, day_checked, due_date)
VALUES (0, 1, 1, 1, '1970-01-01', '1970-02-01');