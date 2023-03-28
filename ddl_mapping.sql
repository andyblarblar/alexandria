PRAGMA foreign_keys = 1;

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
    name   CHAR(50) CHECK (length(name) > 0),
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
    due_date    DATE    NOT NULL CHECK (julianday(due_date) > julianday(day_checked)),
    PRIMARY KEY (p_id, p_lib_id, call_num, b_lib_id),
    FOREIGN KEY (p_id, p_lib_id) REFERENCES PATRONS (p_id, lib_id),
    FOREIGN KEY (b_lib_id) REFERENCES LIBRARIES (lib_id),
    FOREIGN KEY (call_num, b_lib_id) REFERENCES BOOKS (call_num, lib_id),
    -- Books can only be checked out by one person at a time
    UNIQUE (call_num, b_lib_id)
);
