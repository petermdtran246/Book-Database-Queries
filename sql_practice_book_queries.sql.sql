-- Exercise 1: Evaluate Basic Logical Expressions
-- Check simple comparisons and logical operators that return TRUE/FALSE
SELECT 10 != 10; -- Result: 0 (false)

SELECT 15 > 14 AND 99 - 5 <= 94; -- Result: 1 (true)

SELECT 1 IN (5,3) OR 9 BETWEEN 8 AND 10; -- Result: 1 (true)

------------------------------------------------------------

-- Exercise 2: Select All Books Written Before 1980
-- Retrieve all books published before the year 1980 (non-inclusive)
SELECT title, released_year
FROM books
WHERE released_year < 1980;

-- Or select all columns for books published before 1980
SELECT * FROM books WHERE released_year < 1980;

------------------------------------------------------------

-- Exercise 3: Select Books by Specific Authors Using OR
-- Select books where author's last name is either 'Eggers' or 'Chabon'
SELECT title, author_lname
FROM books
WHERE author_lname = 'Eggers' OR author_lname = 'Chabon';

------------------------------------------------------------

-- Exercise 4: Select Books by Author and Published After Year Using AND
-- Select books by author 'Lahiri' published after the year 2000
SELECT title, author_lname, released_year
FROM books
WHERE author_lname = 'Lahiri' AND released_year > 2000;

------------------------------------------------------------

-- Exercise 5: Select Books Within a Page Range and Count Them
-- Select books with page counts between 100 and 200 and count how many books share the same page count
SELECT title, pages, COUNT(*) AS count_books
FROM books
WHERE pages BETWEEN 100 AND 200
GROUP BY title, pages
ORDER BY pages;

-- Or select all books with page counts between 100 and 200
SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

------------------------------------------------------------

-- Exercise 6: Select Books Where Author’s Last Name Starts with Specific Letters
-- Select books where the author's last name starts with 'C' or 'S' using LIKE
SELECT title, author_lname
FROM books
WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%'
ORDER BY author_lname;

-- Or use SUBSTR (or equivalent) to check the first letter
SELECT title, author_lname
FROM books
WHERE SUBSTR(author_lname, 1, 1) IN ('C', 'S');

------------------------------------------------------------

-- Exercise 7: Categorize Books Based on Title Using CASE
-- Categorize books by title: titles containing 'stories' as 'Short stories',  
-- titles 'Just Kids' or 'A Heartbreaking Work' as 'Memoir', else 'Novel'
SELECT title, author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short stories'
        WHEN title = 'Just Kids' OR title = 'A Heartbreaking Work' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books;

------------------------------------------------------------

-- Bonus Exercise: Count Number of Books by Author with Proper Singular/Plural Labels
-- Count number of books per author and display "1 book" or "X books" accordingly
SELECT author_fname, author_lname,
    CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books
WHERE author_fname IS NOT NULL AND author_lname IS NOT NULL
GROUP BY author_fname, author_lname;
