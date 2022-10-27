[#]: subject: "Write C applications using Vely on Linux"
[#]: via: "https://opensource.com/article/22/5/write-c-appplications-vely-linux"
[#]: author: "Sergio Mijatovic https://opensource.com/users/vely"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Write C applications using Vely on Linux
======
Vely is an open source tool for writing web and command-line applications in C on major Linux distributions.

![Women in computing and open source][1]

Image by: Ray Smith

Vely is a tool for writing web and command-line applications in C. Vely combines high performance and the low footprint associated with C programming with ease of use and improved safety reminiscent of languages like PHP. It's free and open source software, and licensed under GPLv3 and LGPL 3 for libraries, so you can even build commercial software with it.

Vely works on major Linux distributions and processor architectures. You can use webservers, such as Apache, Nginx, or others, and databases such as MariaDB, PostgreSQL, and SQLite.

You can use Vely for web applications, command-line programs, as middleware, database applications, services software, data integration, IoT (Internet of Things), and anywhere else. It's well suited for the cloud, works easily in a container, and, due to low resource requirements, it's also a good choice when memory and processing power are at a premium.

### Install Vely

To try Vely, install the Apache webserver and [MariaDB database][2]. You can use a different webserver and database, and the setup would be similar, but in this example, I use Apache and MariaDB.

Next, install Vely. On Linux use a package manager such as `dnf` or `apt`.

### Stock tickers project

This example saves the names of stock tickers and their prices so you can view them in a list.

Start by creating `stock.v` file, and paste this code into it:

```
#include "vely.h"

void stock() {
   out-header default
   @<html>
       @<body>
       input-param action
       input-param stock_name
       input-param stock_price
       if (!strcmp (action, "add")) {
          // Add to stock table, update if stock exists
          run-query#add_data@db = "insert into stock (stock_name,\
              stock_price) values ('%s', '%s') on duplicate key \
              update stock_price='%s'" : stock_name, stock_price, \
              stock_price
           end-query
           error#add_data to define err
           if (strcmp (err, "0")) {
               report-error "Cannot update stock price, error [%s]", err
           }
           @<div>
              @Stock price updated!
           @</div>
       } else if (!strcmp (action, "show")) {
         // Show stock names and values
           @<table>
               @<tr>
                   @<td>Stock name</td>
                   @<td>Stock price</td>
               @</tr>
               run-query#show_data@db = "select stock_name, \
                    stock_price from stock" output stock_name, \
                    stock_price
                   @<tr>
                       @<td>
                       query-result#show_data, stock_name
                       @</td>
                       @<td>
                       query-result#show_data, stock_price
                       @</td>
                   @</tr>
               end-query
           @</table>
       } else {
           @<div>Unrecognized request!</div>
       }
       @</body>
   @</html>
}
```

### Build the database

For this example, create a database named `dbstock`, owned by user `vely` with the password `your_password`. These are arbitrary names, and in real life, you can use whatever values you want, as long as they're consistent throughout your code.

First, log in to the MariaDB database as root and execute this:

```
CREATE DATABASE IF NOT EXISTS dbstock;
FLUSH privileges;
CREATE USER IF NOT EXISTS vely@localhost IDENTIFIED BY 'your_password';
FLUSH privileges;
GRANT ALL privileges ON dbstock.* TO vely@localhost;
FLUSH privileges;
exit;
```

Now log in to MariaDB again and set the current database:

```
$ mysql -u vely -pyour_password
```

Now you can create the database objects needed for the application. You need a `stock` table in the `dbstock` database for this example.

```
USE dbstock;
CREATE TABLE IF NOT EXISTS stock (stock_name VARCHAR(100) PRIMARY KEY, stock_price BIGINT);
```

Finally, create a database configuration file named `db` so that your application can log into the database. You must call it `db` because that's what the code in `stock.v` uses. For instance:

```
[...]
run-query#add_data@db = "insert into stock ..."
[...]
```

The database name is preceded by the `@` sign, in this case, `@db`, so the name of the database configuration file is `db`. As with other values, you can name your database configuration file whatever you want, as long as your code is consistent.

Here's the configuration for the `db` file:

```
[client]
user=vely
password=your_password
database=dbstock
```

The above is a standard MariaDB [client options file][3]. Vely uses native database connectivity, so you can specify any options a given database allows.

### Build the application

Next, you can create your Vely application. For this example, you're going to create a web app called `stockapp` :

```
$ sudo vf -i -u $(whoami) stockapp
```

This creates an application home under the Vely directory (`/var/lib/vv` ) and performs the required application setup steps for you.

To build your application, use the `vv` command:

```
$ vv -q --db=mariadb:db stockapp
```

Here's what each option means:

* -q builds an application
* --db specifies the database to be used (mariadb:db, as specified in your configuration file)
* stockapp is the application name

You can actually use any number of databases and different vendors in your application. This example is simple, though, so you only need one database. Vely has many other useful options you can use, but this is sufficient for now.

### Configure web access

To access your application via a web browser or various web clients, you need to set up a webserver. It can be Apache, Nginx, or any other server that supports FastCGI proxying (most, if not all, webservers and load balancers do this). Here, I will set up Apache, but the setup is similar for other webservers.

The `proxy` and `proxy_fcgi` modules are installed and enabled by default on the Fedora install of the Apache web server, but you must enable them on Debian-based systems (like Ubuntu):

```
$ sudo a2enmod proxy
$ sudo a2enmod proxy_fcgi
$ sudo systemctl restart apache2
```

If you're not on a Debian-based system, you can enable an Apache module by adding it to the Apache configuration file or in a file in the `/etc/httpd/conf.modules.d/` directory, depending on your distribution's configuration.

Next, open your Apache configuration file in a text editor. For example, on a Debian-based system:

```
$ sudo vi /etc/apache2/apache2.conf
```

On a Fedora system (including Red Hat Enterprise Linux and CentOS):

```
$ sudo vi /etc/httpd/conf/httpd.conf
```

Add this line to the end of the file:

```
ProxyPass "/stockapp" unix:///var/lib/vv/stockapp/sock/sock|fcgi://localhost/stockapp
```

Depending on your webserver configuration, there may be a better place to add the `ProxyPass` directive. For this example, though, the above is sufficient.

Save the file and restart the webserver. On Fedora-based systems:

```
$ sudo systemctl restart httpd
```

On Debian-based systems:

```
$ sudo systemctl restart apache2
```

In this case, you're connecting to your application through a socket, but you can use a TCP port instead (which comes in handy when your application resides in a container or something similar).

### Run the application

Start the application server for your application:

```
$ vf stockapp
```

By default, this runs anywhere from 0 to 20 server processes for your application, depending on the load. When the user load is low, your application uses virtually no memory at all.

That was it! Navigate to [http://127.0.0.1/stockapp?req=stock&action=add&stock_name=XYZ&stock_pri…][4] in your web browser to see the application.

You've just updated the stock price for ticker "XYZ" to 440. Try different tickers and prices to build a list of stocks, which you can view with the URL [http://127.0.0.1/stockapp?req=stock&action=show][5].

Congratulations, you've created your first Vely application, reverse proxied behind a web server.

You can also view the output without a graphical browser by [using curl][6]:

```
$ curl -s \
"http://127.0.0.1/stockapp?req=stock&action=add&stock_name=XYZ&stock_price=440"
$ curl -s "http://127.0.0.1/stockapp?req=stock&action=show"
```

### Run the application from the terminal

You can run your application from the terminal, too. A terminal command is always made along with the FastCGI application server, and it's named the same as your application (in this case, `stockapp` ). It works exactly the same as the web app. You can write some requests to your application to be fulfilled as web requests and others to run from the command-line. To do that, you provide the request as environment variables. For instance, to output the list of stocks as HTML, type:

```
$ export REQUEST_METHOD=GET
$ export QUERY_STRING="req=stock&action=show"
$ /var/lib/vv/bld/stockapp/stockapp
```

To suppress HTTP headers, use:

```
$ export VV_SILENT_HEADER=yes
$ /var/lib/vv/bld/stockapp/stockapp
```

### How Vely works

Your application works by processing requests and sending back replies. A request is one of two HTTP methods: GET or POST.

A request always has a parameter `req`. In the example here, its value is `stock`. That means source code compiled from file `stock.v` is called automatically to handle such a request.

A source file like this can do many different things, all grouped logically under a single request. Here, you have another parameter `action`, which can have a value of `add` (to add or update a stock) or `show` (to show a list of stocks). You specify `stock_name` and `stock_price` parameters when adding or updating. Pretty easy stuff. Other than `req`, you can choose parameter names however you wish.

Looking at the code in `stock.v`, it's simple to follow. You use the [input-param][7] construct to get the values for your input parameters. Yes, those strange things in the C code that aren't C are [Vely language constructs][8], and they do lots of useful stuff for you, such as [run-query][9], which (as you might expect from the name) runs your queries. An easy one is `@`, which is an [output construct][10]. String handling is made simple and reliable without worrying about buffer overruns. Check out the [full reference of Vely constructs][11] to understand Vely's capabilities.

Vely converts all constructs in your code into pure C and makes a native executable that is very small and fast. Your application runs as several FastCGI server processes, which stay resident in memory while accepting and processing requests. All of these processes work in parallel.

For more info, see [how Vely works][12] and read more about [Vely architecture][13].

### Manage strings and memory

Vely has automatic garbage collection for all of its constructs. In fact, most of the time, you shouldn't need to free memory at all, so application development is even simpler. Leave that to Vely and enjoy computing free of memory leaks and far fewer memory issues than you might expect. String constructs such as `write-string` make it safe, fast, and easy to create complex strings just as they do simple ones.

### FastCGI program manager

Even if you don't want to develop your own applications with Vely, you can use `vf`, [Vely's FastCGI program manager][14], with any generic FastCGI program, not just those created with Vely.

### Want to learn more about Vely?

I sometimes get asked about the project name. *Vely* is short for *Vel(ocit)y*. It's fast to program with, fast to understand code and maintain, and fast (and small!) at run time. It's even easy to containerize.

Check out the documentation at [vely.dev][15], which features downloads and examples that go beyond the introduction this article provides.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/write-c-appplications-vely-linux

作者：[Sergio Mijatovic][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/vely
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/OSDC_women_computing_2.png
[2]: https://www.redhat.com/sysadmin/mysql-mariadb-introduction?intcmp=7013a000002qLH8AAM
[3]: https://mariadb.com/kb/en/configuring-mariadb-connectorc-with-option-files/#options
[4]: http://127.0.0.1/stockapp?req=stock&action=add&stock_name=XYZ&stock_price=440
[5]: http://127.0.0.1/stockapp?req=stock&action=show
[6]: https://opensource.com/article/20/5/curl-cheat-sheet
[7]: https://vely.dev/input-param.html
[8]: https://vely.dev/language_constructs.html
[9]: https://vely.dev/run-query.html
[10]: https://vely.dev/output_construct.html
[11]: https://vely.dev/reference.html
[12]: https://vely.dev/how_vely_works.html
[13]: https://vely.dev/vely_architecture.html
[14]: https://vely.dev/plain_C_FCGI.html
[15]: http://vely.dev
