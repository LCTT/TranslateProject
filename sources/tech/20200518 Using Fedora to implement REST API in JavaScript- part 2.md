[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Fedora to implement REST API in JavaScript: part 2)
[#]: via: (https://fedoramagazine.org/using-fedora-to-implement-rest-api-in-javascript-part-2/)
[#]: author: (Vaclav Keil https://fedoramagazine.org/author/vaclavk/)

Using Fedora to implement REST API in JavaScript: part 2
======

![][1]

In [part 1][2] previously, you saw how to quickly create a simple API service using Fedora Workstation, Express, and JavaScript. This article shows you the simplicity of how to create a new API. This part shows you how to:

  * Install a DB server
  * Build a new route
  * Connect a new datasource
  * Use Fedora terminal to send and receive data



### Generating an app

Please refer to the [previous article][2] for more details. But to make things simple, change to your work directory and generate an app skeleton.
```

```

$ cd our-work-directory
$ npx express-generator –no-view –git /myApp
$ cd myApp
$ npm i
```

```

### Installing a database server

In this part, we’ll install MariaDB database. MariaDB is the Fedora default database.

```
$ dnf module list mariadb | sort -u ## lists the streams available
$ sudo dnf module install mariadb:10.3 ##10.4 is the latest
```

_Note: the default profile is mariadb/server_.

For those who need to spin up a Docker container a ready made container with Fedora 31 is available.

```
$ docker pull registry.fedoraproject.org/f31/mariadb
$ docker run -d --name mariadb_database -e MYSQL_USER=user -e MYSQL_PASSWORD=pass -e MYSQL_DATABASE=db -p 3306:3306 registry.fedoraproject.org/f31/mariadb
```

Now start the MariaDB service.

```
$ sudo systemctl start mariadb
```

If you’d like the service to start at boot, you can also enable it in systemd:

```
$ sudo systemctl enable mariadb ## start at boot
```

Next, setup the database as needed:

```
$ mysql -u root -p ## root password is blank
MariaDB> CREATE DATABASE users;
MariaDB> create user dbuser identified by ‘123456‘;
MariaDB> grant select, insert, update, create, drop on users.* to dbuser;
MariaDB> show grants for dbuser;
MariaDB> \q
```

A database connector is needed to use the database with Node.js.

```
$ npm install mariadb ## installs MariaDB Node.js connector
```

We’ll leverage Sequelize in this sample API. Sequelize is a promise-based Node.js ORM (Object Relational Mapper) for Postgres, MySQL, MariaDB, SQLite and Microsoft SQL Server.

```
$ npm install sequelize ## installs Sequelize
```

### Connecting a new datasource

Now, create a new _db_ folder and create a new file _sequelize.js_ there:

```
const Sequelize = require('sequelize'),
  sequelize = new Sequelize(process.env.db_name || 'users', process.env.db_user || 'dbuser', process.env.db_pass || '123456', {
    host: 'localhost',
    dialect: 'mariadb',
    ssl: true
})

module.exports = sequelize
```

_Note: For the sake of completeness I‘m including a link to the related Github repo: <https://github.com/vaclav18/express-api-mariadb>_

Let‘s create a new file _models/user.js_. A nice feature of a Sequelize model is that it helps us to create the necessary tables and colums automatically. The code snippet responsible for doing this is seen below:

```
sequelize.sync({
force: false
})
```

Note: never switch to true with a production database – it would _drop your tables at app start_!

We will refer to the earlier created sequelize.js this way:

```
const sequelize = require('../db/sequelize')
```

### Building new routes

Next, you’ll create a new file _routes/user.js_. You already have _routes/users.js_ from the previous article. You can copy and paste the code in and proceed with editing it.

You’ll also need a reference to the previously created model.

```
const User = require('../models/user')
```

Change the route path to _/users_ and also create a new **post** method route.

Mind the async – await keywords there. An interaction with a database will take some time and this one will do the trick. Yes, an async function returns a promise and this one makes promises easy to use.

_Note: This code is not production ready, since it would also need to include an authentication feature._

We‘ll make the new route working this way:

```
const userRouter = require('./routes/user')
app.use(userRouter)
```

Let‘s also remove the existing _usersRouter_. The _routes/users.js_ can be deleted too.

```
$ npm start
```

With the above command, you can launch your new app.

### Using the terminal to send and retrieve data

Let’s create a new database record through the post method:

```
$ curl -d 'name=Adam' http://localhost:3000/users
```

To retrieve the data created through the API, do an HTTP GET request:

```
$ curl http://localhost:3000/users
```

The console output of the curl command is a JSON array containing data of all the records in the _Users_ table.

_Note: This is not really the usual end result — an application consumes the API finally. The API will usually also have endpoints to update and remove data._

### More automation

Let‘s assume we might want to create an API serving many tables. It‘s possible and very handy to automatically generate models for Sequelize from our database. Sequelize-auto will do the heavy lifting for us. The resulting files (_models.js_) would be placed and imported within the _/models_ directory.

```
$ npm install sequelize-auto
```

A node.js connector is needed to use this one and we have it already installed for MariaDB.

### Conclusion

It‘s possible to develop and run an API using Fedora, Fedora default MariaDB, JavaScript and efficiently develop a solution like with a noSQL database. For those used to working with MongoDB or a similar noSQL database, Fedora and MariaDB are important open-source enablers.

* * *

_Photo by [Mazhar Zandsalimi][3] on [Unsplash][4]._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-fedora-to-implement-rest-api-in-javascript-part-2/

作者：[Vaclav Keil][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/vaclavk/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/05/javascript-api-2-816x345.jpg
[2]: https://fedoramagazine.org/using-fedora-to-quickly-implement-rest-api-with-javascript/
[3]: https://unsplash.com/@m47h4r?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://unsplash.com/s/photos/javascript?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
