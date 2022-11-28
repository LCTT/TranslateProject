[#]: subject: "PHP MySQL WHERE Clause"
[#]: via: "https://ostechnix.com/php-mysql-where-clause/"
[#]: author: "Sravan Kumar https://ostechnix.com/author/sravankumar/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

PHP MySQL WHERE Clause
======
How To Select And Filter Data From A MySQL Database Using PHP In XAMPP

In this guide, we will discuss how to select the records from a MySQL database based on specific conditions with the WHERE clause and the SELECT command using PHP in XAMPP stack.

### Prerequisites

Make sure you've created a database and table in XAMPP stack as described in the following guide.

* Create MySQL Database And Table Using PHP In XAMPP

For demonstration purpose, I've created a table named **"sales"** in a MySQL database called **"my_company"** with the below schema and records.

![Database Schema And Records][1]

### Filtering Data From MySQL Table With WHERE Clause Using PHP

The WHERE clause is used to extract only the records that matches a specific condition. The WHERE clause will check the condition by taking an operator followed by a value.

**WHERE Clause Syntax:**

```
SELECT column1,column2,.,column n from table_name WHERE column_name operator value;
```

Where,

* column_name - the column on which condition is applied.
* operator - It is used to check the condition.
* value - It is the string/numeric value compared with each and every column values present in the table.

```
column_name
```

```
operator
```

```
value
```

### Steps

**1.** Specify the servername (E.g. localhost), database username (E.g. `root` ), root user password and the database name (E.g. my_company). Here, my `root` user's password is empty.

**2.** Establish a connection using the `mysqli_connect()` function. It will take servername, username and password as parameters.

**Code:**

```
$connection = mysqli_connect($server_name, $user_name, $password, $database_name);
```

**3.** Specify the SQL Query to select a particular column or all columns' records from the table by a condition. In this step, we can specify the SQL query to select columns from the table into a variable.

For example, I am going to use the database name called **my_company** and I am storing it in a variable named **query**. The table name is **sales** that has three columns.

**Code:**

```
$query = "SELECT column1,…. from sales where column_name operator value";
```

**4.** Store the selected results into a variable called **"final"** using the `mysqli_query()` function. It will take "connection" and "query" as parameters.

**Code:**

```
mysqli_query($connection, $query);
```

**5.** Get the rows one by one from the "final" variable using the `mysqli_num_rows()` function. After that fetch the results by iterating through a **while** loop using `mysqli_fetch_assoc()` function. It will take the "`final` " variable as a parameter.

**Code:**

```
if (mysqli_num_rows($final) > 0) {
 //get the output of each row
  while($i = mysqli_fetch_assoc($final)) {
    echo $i["column1”],…………..;
  }
} else {
  echo "No results";
}
```

**6.** Finally, close the connection by using the `mysqli_close()` function.

**Code:**

```
mysqli_close($connection);
```

Now, let us write a sample PHP code based on the above steps.

### PHP code To Select Data From MySQL Database Using WHERE Clause

**Example Code 1:**

In this example, we will select all columns from the "sales" table where the **id value is greater than 4** and display the result in a PHP page.

So our operator will be greater than (**">"**) and the value is **4** by specifying the **column_name** as **id**.

Create a new file named `select.php` under the `/htdocs` folder with the following contents in it.

**Heads Up:** If you use Linux, the **htdocs** folder will be under **/opt/lampp/** directory. If you're on Windows, the **htdocs** will be usually in **C:\xampp**\ folder.

```
<?php
//specify the server name and here it is localhost
$server_name = "localhost";

//specify the username - here it is root
$user_name = "root";

//specify the password - it is empty
$password = "";

//specify the database name - "my_company"
$database_name = "my_company";

// Creating the connection by specifying the connection details
$connection = mysqli_connect($server_name, $user_name, $password, $database_name);

//sql query to select particular columns
//select all columns such that id is greater than 4
$query = "SELECT * from sales where id>4";

#get the result
$final = mysqli_query($connection, $query);

if (mysqli_num_rows($final) > 0) {
 //get the output of each row
  while($i = mysqli_fetch_assoc($final)) {
      //get all columns
    echo "id: " . $i["id"]. "  ----> name: " . $i["name"]."  ----> count: " . $i["count"]. "<br>";
  }
} else {
  echo "No results";
}

//close the connection
mysqli_close($connection);
?>
```

Open your web browser and point it to **http://localhost/select.php** URL. You can see that data is selected where **id is greater than 4** and the result is displayed in the browser window.

![Select Data From MySQL Database Using WHERE Clause][2]

**Example Code 2:**

In this example, we will select all columns from the "sales" table with the name as "Eggs" and display the result in the PHP page.

So our operator will be equal to (**"="**) and the value is "Eggs" by specifying the `column_name` as **name**.

```
<?php
//specify the server name and here it is localhost
$server_name = "localhost";

//specify the username - here it is root
$user_name = "root";

//specify the password - it is empty
$password = "";

//specify the database name
$database_name = "my_company";

// Creating the connection by specifying the connection details
$connection = mysqli_connect($server_name, $user_name, $password, $database_name);

//sql query to select particular columns
//select all columns such that name equals to Eggs
$query = "SELECT * from sales where name ='Eggs'";

#get the result
$final = mysqli_query($connection, $query);

if (mysqli_num_rows($final) > 0) {
 //get the output of each row
  while($i = mysqli_fetch_assoc($final)) {
      //get all columns
    echo "id: " . $i["id"]. "  ----> name: " . $i["name"]."  ----> count: " . $i["count"]. "<br>";
  }
} else {
  echo "No results";
}

//close the connection
mysqli_close($connection);
?>
```

Open your web browser and point it to **http://localhost/select.php** URL. You can see that data is selected where name ='Eggs' and displayed.

![Select Columns That Contains The Name Eggs][3]

**Example Code 3:**

In this example, we will select all columns from the "sales" table with **count as 45** and display the result in the PHP page.

So our operator will be equal to (**"="**) and the value is 45 by specifying the column_name as **count**.

```
<?php
//specify the server name and here it is localhost
$server_name = "localhost";

//specify the username - here it is root
$user_name = "root";

//specify the password - it is empty
$password = "";

//specify the database name
$database_name = "my_company";

// Creating the connection by specifying the connection details
$connection = mysqli_connect($server_name, $user_name, $password, $database_name);

//sql query to select particular columns
//select all columns such that count is 45
$query = "SELECT * from sales where count =45";

#get the result
$final = mysqli_query($connection, $query);

if (mysqli_num_rows($final) > 0) {
 //get the output of each row
  while($i = mysqli_fetch_assoc($final)) {
      //get all columns
    echo "id: " . $i["id"]. "  ----> name: " . $i["name"]."  ----> count: " . $i["count"]. "<br>";
  }
} else {
  echo "No results";
}

//close the connection
mysqli_close($connection);
?>
```

Open your web browser and point it to **http://localhost/select.php** URL. You can see that data is selected where **count = 45** and the resulting column is displayed.

![Select Columns That Contains The Count 45][4]

### Conclusion

In this tutorial, we've discussed three different ways to select data from a MySQL database based on particular conditions using PHP with WHERE clause. The first example showed you how to filter the data by using the numeric value "id". The second and third examples explained how to select data by using the string value "name" and the numeric value "count" respectively.

--------------------------------------------------------------------------------

via: https://ostechnix.com/php-mysql-where-clause/

作者：[Sravan Kumar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sravankumar/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/wp-content/uploads/2022/05/Database-Schema-And-Records.png
[2]: https://ostechnix.com/wp-content/uploads/2022/05/Select-Data-From-MySQL-Database-Using-WHERE-Clause.png
[3]: https://ostechnix.com/wp-content/uploads/2022/05/Select-Columns-That-Contains-The-Name-Eggs.png
[4]: https://ostechnix.com/wp-content/uploads/2022/05/Select-Columns-That-Contains-The-Count-45.png
