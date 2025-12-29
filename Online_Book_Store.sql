DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
Book_ID	serial primary key,
Title	varchar (100),	
Author	varchar (100),	
Genre	varchar (100),	
Published_Year INT,	
Price NUMERIC(10,2),
Stock int	
);

DROP TABLE IF EXISTS customers;
CREATE TABLE Customers(
Customer_ID	serial 	primary key,
Name	varchar(100),	
Email	varchar(100),	
Phone	varchar(15),
City	varchar(50),
Country	varchar(150)	
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE ORDERS(
Order_ID	serial 	primary key,	
Customer_ID	int	references	Customers(Customer_id),
Book_ID	int references	Books(Book_id),
Order_Date	date,		
Quantity int,		
Total_Amount numeric(10,2)	
);

select * from Books;
select * from Customers;
select * from Orders;

--Import data into Books table
COPY Books(Book_ID,Title,Author,Genre,Published_Year,Price,Stock)
FROM 'C:\Users\sahus\Downloads\ST - SQL ALL PRACTICE FILES\All Excel Practice Files\Books.csv'
CSV HEADER;

--Import data into Customers table
COPY Customers(Customer_ID,Name,Email,Phone,City,Country)
FROM 'C:\Users\sahus\OneDrive\Desktop\Sql Project\Customers.csv'
CSV HEADER;

--Import data into Orders table
COPY Orders(Order_ID,Customer_ID,Book_ID,Order_Date,Quantity,Total_Amount)
FROM 'C:\Users\sahus\OneDrive\Desktop\Sql Project\Orders.csv'
CSV HEADER;

-- 1) Retrieve all books in the "Fiction" genre:

select * from Books
where genre= 'Fiction';

-- 2) Find books published after the year 1950:
select * from books 
where published_year>1950;

-- 3) List all customers from the Canada:
select * from Customers
where country= 'Canada';

-- 4) Show orders placed in November 2023:
select * from Orders;

select * from Orders
where order_date between '2023-11-01' and '2023-11-30';

-- 5) Retrieve the total stock of books available:
select * from Books;

select sum(stock) as total_stocks
from Books;

-- 6) Find the details of the most expensive book:
select max(price) as expensive_books
from Books;

select * from Books
order by price desc
limit 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
select * from Orders
where quantity >1;

-- 8) Retrieve all orders where the total amount exceeds $20:
select * from Orders
where total_amount>20;

-- 9) List all genres available in the Books table:
select distinct genre
from Books;

-- 10) Find the book with the lowest stock:
select min(stock) as lowest_stock
from Books;

select * from Books
order by stock asc
limit 1;

-- 11) Calculate the total revenue generated from all orders:
select * from Orders;

select sum(total_amount) as total_revenue
from Orders;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:
select * from orders;

select b.genre, sum(o.quantity) as total_books_sold
from orders o
join books b on o.book_id= b.book_id
group by b.genre;

-- 2) Find the average price of books in the "Fantasy" genre:
select avg(price) as avg_price
from Books
where genre= 'Fantasy';

-- 3) List customers who have placed at least 2 orders:
select c.customer_id,c.name, count(o.order_id) as order_count
from orders o
join customers c on o.customer_id=c.customer_id
group by c.customer_id,c.name
having count(o.order_id)>=2;

-- 4) Find the most frequently ordered book:
select o.book_id,b.title, count(o.order_id) as order_count
from orders o
join books b on o.book_id=b.book_id
group by o.book_id, b.title
order by order_count desc limit 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
select *from books
where genre= 'Fantasy'
order by price desc limit 3;


-- 6) Retrieve the total quantity of books sold by each author:
select b.author ,sum(o.quantity) as total_book_sold
from orders o
join books b on o.book_id=b.book_id
group by b.author;

-- 7) List the cities where customers who spent over $30 are located:
select distinct c.city,c.name,o.total_amount
from orders o
join customers c on o.customer_id= c.customer_id
where o.total_amount>30;

-- 8) Find the customer who spent the most on orders:
select c.customer_id,c.name, sum(o.total_amount) as total_spent
from orders o
join customers c on o.customer_id= c.customer_id
group by c.customer_id ,c.name
order by total_spent desc limit 1;

--9) Calculate the stock remaining after fulfilling all orders:

SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;


