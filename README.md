# ahora12project
 Excel, SQL and Python processing from excel files

## 1. Source files
The excel source files where downloaded from Argentina's Governtment website: https://datos.gob.ar/dataset/produccion-programa-ahora-12. These are two excel files containing national operations and billings from "Ahora 12" Program.  This Program allows people to pay the items or services they buy in 12 monthly installments free of interest.

## 2. Working on Excel
My goal was to join both tables (from both files) into one, using SQL. To this end I made a new column in each table to work as keys in the join statement.

## 3. Joining on SQL
First, I created a new database on Microsoft SQL Server, and imported both new excel files into tables. Then I created a view joining both tables (Inner Join) selecting only those registries where both tables have values (not nulls). Finally, I created a new table from the previously created view.

## 4. Connecting SQL to Jupyter Notebook
I created a connection from my jupyter notebook to Microsoft SQL Server using pyodbc module. Then, using pandas I created a new dataframe importing the data from the table created on the previous step.
> V1.1: New connection using SQLAlquemy module (it works better).

## 5. Creating dataframes and plots on pandas/matplotlib
I created two dataframes showing the sum of billings by segment and then some plots to show the results.
> V1.2: Two added dataframes: 1. Top 3 Billings by Province, 2. Top 3 Billings by Segment.
