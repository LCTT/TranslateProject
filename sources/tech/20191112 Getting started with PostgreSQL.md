[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with PostgreSQL)
[#]: via: (https://opensource.com/article/19/11/getting-started-postgresql)
[#]: author: (Greg Pittman https://opensource.com/users/greg-p)

Getting started with PostgreSQL
======
Install, set up, create, and start using your first PostgreSQL database.
![Guy on a laptop on a building][1]

Everyone has things that would be useful to collect in a database. Even if you're obsessive about keeping paperwork or electronic files, they can become cumbersome. Paper documents can be lost or completely disorganized, and information you need to access in electronic files may be buried in depths of paragraphs and pages of information.

When I was practicing medicine, I used [PostgreSQL][2] to keep track of my hospital patient list and to submit information about my hospital patients. I carried a printout of my daily patient list in my pocket for quick reference and to make quick notes about any changes in the patients' room, diagnosis, or other details.

I thought that was all behind me, until last year when my wife decided to get a new car, and I "inherited" her previous one. She had kept a folder of car repair and maintenance service receipts, but over time, it lost any semblance of organization. It takes time to sift through all the slips of paper to figure out what was done when, and I thought PostgreSQL would be a better way to keep track of this information.

### Install PostgreSQL

It had been a while since I last used PostgreSQL, and I had forgotten how to get going with it. In fact, I didn't even have it on my computer. Installing it was step one. I use Fedora, so in a console, I ran:


```
`dnf list postgresql*`
```

Notice that you don't need to use sudo to use the **list** option. This command returned a long list of packages; after scanning them, I decided I only wanted three: postgresql, postgresql-server, and postgresql-docs.

To find out what I needed to do next, I decided to consult the [PostgreSQL docs][3]. The docs are a very extensive reference—so extensive, in fact, that it is rather daunting. Fortunately, I found some notes I made in the past when I was upgrading Fedora and wanted to efficiently export my database, restart PostgreSQL on the new version, and import my old database.

### Set up PostgreSQL

Unlike most other software, you can't just install PostgreSQL and start using it. You must carry out two basic steps beforehand: First, you need to set up PostgreSQL, and second, you need to start it. You must do these as the **root** user (sudo will not work here).

To set it up, enter:


```
`postgresql-setup –initdb`
```

This establishes the location of the PostgreSQL databases on the computer. Then (still as **root**), enter these two commands:


```
systemctl start postgresql.service
systemctl enable postgresql.service
```

The first command starts PostgreSQL for the current session on your computer (if you turn it off, PostgreSQL shuts down). The second command causes PostgreSQL to automatically start on subsequent reboots.

### Create a user

PostgreSQL is running, but you still can't use it because you haven't been named a user yet. To do this, you need to switch to the special user **postgres**. While you are still running as **root**, type:


```
`su postgres`
```

Since you're doing this as **root**, you don't need to enter a password. The **root** user can operate as any user without knowing their password; this is part of what makes it so powerful—and dangerous.

Now that you're **postgres**, run two commands like the following example (which creates the user **gregp**) to create your user:


```
createuser gregp
createdb gregp
```

You will probably get an error message like: **Could not switch to /home/gregp**. This just means that the user **postgres** doesn't have access to that directory. Nonetheless, your user and the database have been created. Next, type **Exit** and **Enter** twice so you're back to being yourself again.

### Set up a database

To start using PostgreSQL, type **psql** on the command line. You should see something like **gregp=&gt;** to the left of each line to show that you're using PostgreSQL and can only use commands that it understands. You automatically have a database (mine is named **gregp**)—with absolutely nothing in it. A database, in the sense of PostgreSQL, is just a space to work. Inside that space, you create _tables_. A table contains a list of variables, and underneath each variable is the data that makes up your database.

Here is how I set up my auto-service database:


```
CREATE TABLE autorepairs (
        date            date,
        repairs         varchar(80),
        location        varchar(80),
        cost            numeric(6,2)
);
```

I could have typed this continuously on a single line, but I broke it up to illustrate the parts better and to show that the white space of tabs and line feeds is not interpreted by PostgreSQL. The data points are contained within parentheses, each variable name and data type is separated from the next by a comma (except for the last), and the command ends with a semicolon. All commands must end with a semicolon!

The first variable name is **date**, and its datatype is also **date**, which is OK with PostgreSQL. The second and third variables, **repairs** and **location**, are both datatype **varchar(80)**, which means they can be any mixture of up to 80 characters (letters, numbers, whatever). The last variable, **cost**, uses the **numeric** datatype. The numbers in parentheses indicate there is a maximum of six digits and two of them are decimals. At first, I tried the **real** datatype, which would be a floating-point number. The problem with **real** as a datatype comes in more advanced commands using a **WHERE** clause, like **WHERE cost = 0** or any other specific number. Since there is some imprecision in **real** values, specific numbers will never match anything.

### Enter data

Next, you can add some data (in PostgreSQL called a **row**) with the command **INSERT INTO**:


```
`INSERT INTO autorepairs VALUES ('2017-08-11', 'airbag recall', 'dealer', 0);`
```

Notice that the parentheses form a container for the values, which must be in the correct order, separated by commas, and with a semicolon at the end of the command. The value for the **date** and **varchar(80)** datatypes must be enclosed in single quotes, but number values like **numeric** do not. As feedback, you should see:


```
`INSERT 0 1`
```

Just as in your regular terminal session, you will have a history of entered commands, so often you can save a great deal of time when entering subsequent rows by pressing the Up arrow key to show the last command and editing the data as needed.

What if you get something wrong? Use **UPDATE** to change a value:


```
`UPDATE autorepairs SET date = '2017-11-08' WHERE repairs = 'airbag recall';`
```

Or maybe you no longer want something in your table. Use **DELETE**:


```
`DELETE FROM autorepairs WHERE repairs = 'airbag recall';`
```

and the whole row will be deleted.

One last thing: Even though I used all caps in the PostgreSQL commands (which is also done in most documentation), you can type them in lowercase, which is what I generally do.

### Output data

If you want to show your data, use **SELECT**:


```
`SELECT * FROM autorepairs ORDER BY date;`
```

Without the **ORDER BY** option, the rows would appear however they were entered. For example, here's a selection of my auto-service data as it's output in my terminal:


```
SELECT date, repairs FROM autorepairs ORDER BY date;

    date   |                             repairs                             
\-----------+-----------------------------------------------------------------
2008-08-08 | oil change, air filter, spark plugs
2011-09-30 | 35000 service, oil change, rotate tires/balance wheels
2012-03-07 | repl battery
2012-11-14 | 45000 maint, oil/filter
2014-04-09 | 55000 maint, oil/filter, spark plugs, air/dust filters
2014-04-21 | replace 4 tires
2014-04-21 | wheel alignment
2016-06-01 | 65000 mile service, oil change
2017-05-16 | oil change, replce oil filt housing
2017-05-26 | rotate tires
2017-06-05 | air filter, cabin filter,spark plugs
2017-06-05 | brake pads and rotors, flush brakes
2017-08-11 | airbag recall
2018-07-06 | oil/filter change, fuel filter, battery svc
2018-07-06 | transmission fl, p steering fl, rear diff fl
2019-07-22 | oil &amp; filter change, brake fluid flush, front differential flush
2019-08-20 | replace 4 tires
2019-10-09 | replace passenger taillight bulb
2019-10-25 | replace passenger taillight assembly
(19 rows)
```

To send this to a file, change the output with:


```
`\o autorepairs.txt`
```

then run the **SELECT** command again.

### Exit PostgreSQL

Finally, to get out of PostgreSQL mode in the terminal, type:


```
`quit`
```

or its shorthand version:


```
`\q`
```

While this is just a brief introduction to PostgreSQL, I hope it demonstrates that it's neither difficult nor time-consuming to use the database for a simple task like this.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/getting-started-postgresql

作者：[Greg Pittman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV (Guy on a laptop on a building)
[2]: https://www.postgresql.org/
[3]: http://www.postgresql.org/docs
