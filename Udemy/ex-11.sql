select title,name,rating from reviews join books on reviews.book_id=books.id 
join authors on reviews.reviewer_id=authors.id and books.author_id=authors.id;