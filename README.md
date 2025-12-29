# 📚 Online Book Store: Database Design and SQL Analysis (PostgresSQL)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-003B57?style=for-the-badge&logo=sqlite&logoColor=white)

![](https://raw.githubusercontent.com/Swati-s-Sahu/online-bookstore-postgresql/refs/heads/main/bannerb.png)
## 📌 Project Overview

This project is not just about writing SQL queries; it's a full **Product Dissection** of an Online Bookstore. I chose this platform to understand how big e-commerce sites manage their data. Using **PostgreSQL**, I built a system that handles everything from tracking book stock to managing customer orders and generating business reports.


## 🌍 Real-World Problems & Solutions

 This Online bookstore project solves three big challenges for shop owners:

* **Problem 1: Stock Mess:**
    > Books going out of stock without warning is a real problem.
So the database keeps track of stock levels and helps identify books that need restocking.
 
* **Solution:**
   > I added a `Stock` count in the database that updates so the owner always knows what's available.

* **Problem 2: Scattered Customer Info:**
    > Customer information is stored in one place, making it easy to analyze:
    
    > 1. which city or country orders the most
    > 2. where good customers come from
    
* **Solution:**
    > I created a structured **Customers** table to track where people are buying from (City/Country) for better marketing.

* **Problem 3:**
   > No Clear View of Revenue
   
* **Solution:**
  > By linking books to orders, the system automatically calculates the `Total_Amount` for every sale.


## 🏗️ The Database Design (Schema)

I identified the core "entities" that make a bookstore work along with followed normalization rules to avoid duplicate data and confusion later.

### Main Tables
  1. **Customers (The People):** Stores customer name, email, city, and country.
  2. **Books (The Products):** Stores book details like title, author, genre, price, and stock.
  3. **Orders :** Acts as the transaction table that connects customers and books.


## 🎨  ER Diagram

The ER Diagram is the "map" of our database. It shows how these tables talk to each other.

![](https://raw.githubusercontent.com/Swati-s-Sahu/online-bookstore-postgresql/refs/heads/main/ER%20DIAGRAM/Online%20BookStore%20Postgres%20(ER).png)


**The Logic:**

* One Customer can place many Orders ().
* One Book can be sold in many different Orders ().



## 🔬 Rationale 

I didn't just dump all data into one table. I separated them (Normalization) because:

* If a customer changes their email, I only have to update it in **one** place.
* It keeps the data clean and makes the database run much faster.



## 🛠️ Technical Implementation

#### Table Creation

1. **👤 Customer Table**
```sql
Table Customers {
  Customer_ID integer [primary key, increment, note: 'Unique ID for each user']
  Name varchar(100) [not null]
  Email varchar(100) [unique, not null]
  Phone varchar(20)
  City varchar(50)
  Country varchar(50)
  
  Note: 'Captures demographic data to solve Problem: Fragmented Customer Data'
}
```
2. **📚 Books Table**
```sql
Table Books {
  Book_ID integer [primary key, increment]
  Title varchar(255) [not null]
  Author varchar(100)
  Genre varchar(50) [note: 'Used for content categorization and discovery']
  Published_Year integer
  Price decimal(10,2) [not null]
  Stock integer [default: 0, note: 'Solves Problem: Inventory Management ']
  
  Note: 'The product INFO'
}
```
3. **🛒 Order Table**
```sql
Table Orders {
  Order_ID integer [primary key, increment]
  Customer_ID integer [ref: > Customers.Customer_ID]
  Book_ID integer [ref: > Books.Book_ID]
  Order_Date timestamp [default: `now()`]
  Quantity integer [note: 'Must be > 0']
  Total_Amount decimal(10,2)
  
  Note: 'The transactional bridge connecting users to content'
}
```

### 📥 Data Loading

there were total 3 CSV files namely.
  1. [Books.csv](https://github.com/Swati-s-Sahu/online-bookstore-postgresql/blob/main/DATA/Books.csv)
  2. [Customers.csv](https://github.com/Swati-s-Sahu/online-bookstore-postgresql/blob/main/DATA/Customers.csv)
  3. [Orders.csv](https://github.com/Swati-s-Sahu/online-bookstore-postgresql/blob/main/DATA/Orders.csv)

these  were loaded using PostgreSQL’s COPY command, which is fast and reliable.

  ```sql
  COPY Books
  FROM '/path/to/books.csv'
  DELIMITER ','
  CSV HEADER;
  ```

## 📊 SQL Analysis & Insights
Once the data was ready, I ran SQL queries to answer business questions.

### Sample SQL Query

- **Finding the total books sold by each genre**
```sql
-- Example: Finding the total books sold by each genre
SELECT b.genre, SUM(o.quantity) AS total_books_sold
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.genre;
```
- **Finding the top 5 best-selling books**
```sql
-- Example: Finding the top 5 best-selling books
SELECT b.Title, SUM(o.Quantity) as Total_Sold
FROM Books b
JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Title
ORDER BY Total_Sold DESC
LIMIT 5;

```

**Other Insights: **

- Identify most expensive and least stocked books
- Total books sold by each genre
- Average book price by genre
- Customers with multiple orders
- Most frequently ordered book
- Top 3 most expensive books by genre
- Total books sold by each author
- Cities of high-spending customers
- Customer with highest total spending
- Remaining stock after fulfilling all orders

## 💭 What I Learned

- How to convert business requirements into database tables.
- Why normalization and relationships actually matter.
- Writing SQL that answers real questions, not just academic ones.
- Understanding how backend data supports e-commerce products.

### Contributed By:

<table>
  <tr>
    <td align="center"><a href="https://github.com/Swati-s-Sahu"><img src="https://avatars.githubusercontent.com/u/134575890?v=4" width="100px;" alt=""/><br /><sub><b>Swati Sahu</b></sub></a><br /><a href="https://github.com/Swati-s-Sahu" title="github"></td>
   <tr>
  <table>

