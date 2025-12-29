# 📚 Online Book Store Database Project (PostgreSQL)

## 📌 Project Overview
This project is a relational database implementation of an **Online Book Store** developed using **PostgreSQL**.  
The main objective of this project is to design a structured database, import real-world data, and perform SQL queries to analyze books, customers, orders, sales, and inventory.

This project demonstrates practical usage of **SQL for database design and data analysis**.

---

## 🛠️ Tools & Technologies
- **Database:** PostgreSQL  
- **Language:** SQL  
- **Concepts Used:**
  - Relational Database Design
  - Primary & Foreign Keys
  - Joins (INNER JOIN, LEFT JOIN)
  - Aggregation Functions
  - Group By & Having
  - Data Analysis Queries

---

## 🗂️ Database Structure
The database consists of **three main tables**:

### 📘 Books
- Book_ID (Primary Key)
- Title
- Author
- Genre
- Published_Year
- Price
- Stock

### 👤 Customers
- Customer_ID (Primary Key)
- Name
- Email
- Phone
- City
- Country

### 🛒 Orders
- Order_ID (Primary Key)
- Customer_ID (Foreign Key)
- Book_ID (Foreign Key)
- Order_Date
- Quantity
- Total_Amount

---

## 📥 Data Import
Data is imported into PostgreSQL tables from CSV files using the `COPY` command:
- Books.csv
- Customers.csv
- Orders.csv

This simulates real-world data handling in database projects.

---

## 🔍 SQL Queries Performed

### ✅ Basic Queries
- Retrieve books by genre and publication year
- List customers by country
- Find orders within a specific date range
- Calculate total stock of books
- Identify most expensive and least stocked books
- Retrieve total revenue generated from orders

### 🚀 Advanced Queries
- Total books sold by each genre
- Average book price by genre
- Customers with multiple orders
- Most frequently ordered book
- Top 3 most expensive books by genre
- Total books sold by each author
- Cities of high-spending customers
- Customer with highest total spending
- Remaining stock after fulfilling all orders

---


## 📊 Sample SQL Query

```sql
SELECT b.genre, SUM(o.quantity) AS total_books_sold
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.genre;
```

---

## 📁 Project Structure

```
online-bookstore-postgresql/
│
├── README.md
├── sql/
│   ├── database.sql
│   └── queries.sql
│
├── data/
│   ├── Books.csv
│   ├── Customers.csv
│   └── Orders.csv

```




