# online-bookstore-postgresql
This project is a relational database implementation of an Online Book Store built using PostgreSQL. It focuses on designing a structured database, importing real-world data, and performing SQL queries to analyze book sales, customers, and orders.

🗂️ Database Structure

The database consists of three main tables:

Books

Book_ID (Primary Key)

Title

Author

Genre

Published_Year

Price

Stock

Customers

Customer_ID (Primary Key)

Name

Email

Phone

City

Country

Orders

Order_ID (Primary Key)

Customer_ID (Foreign Key)

Book_ID (Foreign Key)

Order_Date

Quantity

Total_Amount

📥 Data Import

Data was imported from CSV files into PostgreSQL tables using the COPY command.

Ensured proper data types and referential integrity.

🔍 SQL Queries & Analysis

The project includes basic and advanced SQL queries, such as:

Filtering books by genre and publication year

Customer and order analysis by country and date

Stock management and inventory tracking

Revenue calculation and sales performance

Genre-wise and author-wise book sales

Identifying top customers and most frequently ordered books

Remaining stock calculation after fulfilling all orders

📊 Key Insights Generated

Total revenue generated from orders

Best-selling genres and authors

Most expensive and least stocked books

Customers with highest spending

Cities contributing to higher sales

🛠️ Tools & Technologies

Database: PostgreSQL

Language: SQL

Concepts Used:

Database Design

Primary & Foreign Keys

Joins (INNER, LEFT)

Aggregation Functions

Group By & Having

Data Analysis Queries

🚀 Learning Outcome

This project strengthened my understanding of SQL querying, relational database design, and data analysis using PostgreSQL, making it suitable for entry-level roles in Data Analysis / SQL Developer / Database Management.
