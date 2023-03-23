import sqlite3
from pathlib import Path

# Load queries
avail = Path('avail_lib_inv.sql').read_text()
chkd_p = Path('chkd_books_patron.sql').read_text()
late_fee = Path('late_fees.sql').read_text()
lib_inv = Path('lib_inv.sql').read_text()
s_author = Path('search_books_author.sql').read_text()
s_genre = Path('search_books_genre.sql').read_text()
s_title = Path('search_books_title.sql').read_text()

con = sqlite3.connect("identifier.sqlite")

menu_prompt = """
Welcome to the Alexandria demonstration program! Please select your operation. 
User facing:
1. View inventory at a library 
2. View available inventory at a library 
3. View a patron's checked out materials
4. Search all libraries for books
Admin facing: 
5. View all late fees unpaid
"""

search_prompt = """
How do you want to search for the book?
1. Author
2. Genre
3. Title
"""

# main input loop
while True:
    opt = input(menu_prompt)

    match opt:
        case '1':
            lib = input("which library?\n")
            res = con.execute(lib_inv, [lib])
            rows = res.fetchall()
            if rows is None or len(rows) == 0:
                print("Looks like that library doesn't exist...\n")
            else:
                print(rows)
        case '2':
            lib = input("which library?\n")
            res = con.execute(avail, [lib])
            rows = res.fetchall()
            if rows is None or len(rows) == 0:
                print("Looks like that library doesn't exist...\n")
            else:
                print(rows)
        case '3':
            pid = input("What is your individual id?\n")
            lib = input("What is your libraries id?\n")
            res = con.execute(chkd_p, [pid, lib])
            rows = res.fetchall()
            if rows is None or len(rows) == 0:
                print("Looks like those credentials are not valid...\n")
            else:
                print(rows)
        case '4':
            kind = input(search_prompt)
            match kind:
                case '1':
                    author = input("Which author?\n")
                    res = con.execute(s_author, [author])
                    rows = res.fetchall()
                    if rows is None or len(rows) == 0:
                        print("No results.\n")
                    else:
                        print(rows)
                case '2':
                    genre = input("Which genre?\n")
                    res = con.execute(s_genre, [genre])
                    rows = res.fetchall()
                    if rows is None or len(rows) == 0:
                        print("No results.\n")
                    else:
                        print(rows)
                case '3':
                    title = input("Which title?\n")
                    res = con.execute(s_title, [title])
                    rows = res.fetchall()
                    if rows is None or len(rows) == 0:
                        print("No results.\n")
                    else:
                        print(rows)
        case '5':
            lid = input("Which library id?\n")
            res = con.execute(late_fee, [lid])
            rows = res.fetchall()
            if rows is None or len(rows) == 0:
                print("No late books for the selected library.\n")
            else:
                print(rows)

    input("Press enter to continue...")
