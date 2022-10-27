[#]: subject: "SQLx: The Rust SQL Toolkit"
[#]: via: "https://www.opensourceforu.com/2022/05/sqlx-the-rust-sql-toolkit/"
[#]: author: "Sibi Prabakaran https://www.opensourceforu.com/author/sibi-prabakaran/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

SQLx: The Rust SQL Toolkit
======
An async, pure Rust SQL crate features compile-time checked queries without a domain specific language. This article will give a basic whirlwind tour of the library by showing CRUD operations and the transactions supported using it.

![The-Rust-SQL-Toolkit-Featured-imade][1]

SQLx is a Rust crate for interacting with your database. Some of its features that distinguish it from other crates in the Rust ecosystem are:

* Built with async IO in mind
* Compile-time checked queries
* Database agnostic
* Postgres/MySQL drivers are written in pure Rust (as opposed to them being a FFI binding to a C library)
* Works with various runtimes

**Database setup**
For our demo, we will start with a simple database with two tables and a simple relationship between them:

```
CREATe TABLE “person”(“id” SERIAL8  PRIMARY KEY UNIQUE,”name” TEXT NOT NULL,”age” smallint NOT NULL,”email” TEXT NULL)
CREATe TABLE “book”(“id” SERIAL8  PRIMARY KEY UNIQUE,”name” TEXT NOT NULL,”isbn” TEXT NOT NULL,”person” INT8 NOT NULL)
ALTER TABLE “book” ADD CONSTRAINT “book_person_fkey” FOREIGN KEY(“person”) REFERENCES “person”(“id”) ON DELETE RESTRICT  ON UPDATE RESTRICT
```

We have two tables:

* Person
* Book

And there is a relationship between the ‘book’ and the ‘person’ tables. Make sure you have a local (or remote, if you prefer) PostgreSQL running to test it out. You will also need the sqlx *cli* in your *$PATH*.

**Rust project setup**
We will use Cargo to create a new project. Cargo is the package manager for Rust. It can download your Rust package’s dependencies, compile your packages, make distributable packages, and upload them to crates.io. You can refer to Rust documentation for more details.

```
❯ cargo new sqlx-demo Created binary (application) `sqlx-demo` package
```

The project is set up as a binary project:

```
❯ tree
.
├── Cargo.toml
└── src
└── main.rs
1 directory, 2 files
```

Let’s export the database credentials in an environment variable:

```
export DATABASE_URL=postgres://postgres:postgres@localhost/sqlx-demo
```

Next, we will add the SQL file (20211223133946_initial_setup.sql) as part of the migration:

```
❯ sqlx migrate add initial_setup
Creating migrations/20211223133946_initial_setup.sql
```

Congratulations on creating your first migration!
Did you know you can embed your migrations in your application binary? On startup, after creating your database connection or pool, add:

```
sqlx::migrate!().run(<&your_pool OR &mut your_connection>).await?;
```

Note that the compiler won’t pick up new migrations if no Rust source files have changed. You can create a Cargo build script to work around this with `sqlx migrate build-script` (see *https://docs.rs/sqlx/0.5/sqlx/macro.migrate.html).*

Now you have to go to the above file and add your SQL statements. Once you have done that, you can set up the database:

```
❯ sqlx database setup
Applied 20211223133946/migrate initial setup (27.149609ms)
```

Next, let’s add the required dependencies to the Cargo*.toml* file:

```
[dependencies]
anyhow = “1.0.51”
sqlx = { version = “0.5.9”, features = [  “runtime-tokio-rustls”, “postgres” ]}
tokio = { version = “1”, features = [“full”] }
```

And you can modify the main.rs code to do the following things:

* Set up a connection pool
* Pass credentials to get a connection from the pool

```
use sqlx::{PgPool};
use anyhow::*;
use sqlx::postgres::PgPoolOptions;

#[derive(Clone)]
pub struct DBApplication {
    pool: PgPool
}

impl DBApplication {
    pub async fn new(config: String) -> Result<DBApplication> {
        let pool = PgPoolOptions::new()
            .max_connections(5)
            .connect(&config)
            .await?;
        Ok(DBApplication { pool })
    }
}

#[tokio::main]
async fn main() -> Result<()> {
    let db = DBApplication::new(“postgres://postgres:postgres@localhost/sqlx-demo”.into()).await?;
    println!(“Connection acquired!”);
    Ok(())
}
```

You can confirm if this works by running the command *cargo run*:

```
❯ cargo run
    Finished dev [unoptimized + debuginfo] target(s) in 0.04s
     Running `target/debug/sqlx-demo`
Connection acquired!
```

**Domain types**
We have two tables and, usually, we would want to model them into Rust structs. The easy way of doing this is to use *derive* macros:

```
#[derive(sqlx::FromRow, Debug)]
pub struct Person {
    id: i64,
    name: String,
    age: i16,
    email: String
}
```

The usual convention is to have two sets of records — one for inserting and the other for fetching. I use the New prefix to distinguish them:

```
pub struct NewPerson {
    pub name: String,
    pub age: i16,
    pub email: String
}
```

Another nice option is to use the *query_as!* macro, as it doesn’t need the above derive macro. I will be using that later in the demo.

**Transactions**
Let’s write a function to create a person, and let’s use a transaction to do the same:

```
pub async fn create_person(&self, person: NewPerson) -> Result<Person> {
    let mut transaction = self.pool.begin().await?;
    let person = sqlx::query_as(“INSERT INTO person(name, age, email) VALUES ($1, $2, $3) RETURNING *;”)
        .bind(person.name)
        .bind(person.age)
        .bind(person.email)
        .fetch_one(&mut transaction).await?;
    transaction.commit().await?;
    Ok(person)
}
```

You can modify your main fetch to use it:

```
#[tokio::main]
async fn main() -> Result<()> {
    let db = DBApplication::new(“postgres://postgres:postgres@localhost/sqlx-demo”.into()).await?;
    let sibi = db.create_person(NewPerson{ name: “Sibi”.into(), age: 20, email: “test@psibi.in”.into()}).await?;
    println!(“Sibi: {:?}”, sibi);
    Ok(())
}
```

Now let’s check if the function returns early because of an error, if the transaction rolls back. We will simulate a failure in the above function by an early return after insert:

```
pub async fn create_person(&self, person: NewPerson) -> Result<Person> {
    let mut transaction = self.pool.begin().await?;
    let person = sqlx::query_as(“INSERT INTO person(name, age, email) VALUES ($1, $2, $3) RETURNING *;”)
        .bind(person.name)
        .bind(person.age)
        .bind(person.email)
        .fetch_one(&mut transaction).await?;
    bail!(“Simulate error”);
    transaction.commit().await?;
    Ok(person)
}
```

And the main function will be like this:

```
#[tokio::main]
async fn main() -> Result<()> {
    let db = DBApplication::new(“postgres://postgres:postgres@localhost/sqlx-demo”.into()).await?;
    let sibi = db.create_person(NewPerson{ name: “Sibi”.into(), age: 20, email: “test@psibi.in”.into()}).await?;
    println!(“Sibi: {:?}”, sibi);
    Ok(())
}
```

Before running the executable, you can check the current rows in your table:

```
sqlx-demo=# select * from person;
 id | name | age | email
----+------+-----+-------
(0 rows)
```

Now let’s execute the program:

```
❯ cargo run     Finished dev [unoptimized + debuginfo] target(s) in 0.05s
     Running `target/debug/sqlx-demo`
Error: Simulate error
```

You can see that it did return an error. You can also verify that the transaction has rolled back and has not inserted the row, by inspecting the rows:

```
sqlx-demo=# select * from person;
 id | name | age | email
----+------+-----+-------
(0 rows)
```

**Other CRUD operations**
Similarly, you can implement other CRUD (create, read, update, delete) operations too:

```
pub async fn get_person(&self, id: i64) -> Result<Person> {
    let mut transaction = self.pool.begin().await?;
    let person = sqlx::query_as(“SELECT * from person where id = $1”)
        .bind(id)
        .fetch_one(&mut transaction).await?;
    transaction.commit().await?;
    Ok(person)
}

pub async fn update_person_name(&self, id: i64, name: String) -> Result<Person> {
    let mut transaction = self.pool.begin().await?;
    let person = sqlx::query_as(“UPDATE person SET name = $1 WHERE id = $2 RETURNING *”)
        .bind(name)
        .bind(id)
        .fetch_one(&mut transaction).await?;
    transaction.commit().await?;
    Ok(person)
}

pub async fn delete_book(&self, id: i64) -> Result<()> {
    let mut transaction = self.pool.begin().await?;
    sqlx::query(“DELETE FROM book WHERE id = $1”)
        .bind(id)
        .fetch_optional(&mut transaction).await?;
    transaction.commit().await?;
    Ok(())
}
```

**Compile time queries**
One nice thing about SQLx is that it can perform static checks against your database server. Using the *query_as* macro will achieve this. Rewriting the above *get_person* function to use the macro will look like this:

```
pub async fn get_person_macro(&self, id: i64) -> Result<Person> {
    let mut transaction = self.pool.begin().await?;
    let person = sqlx::query_as!(Person, “SELECT * from person where id = $1”, id)
        .fetch_one(&mut transaction)
        .await?;
    transaction.commit().await?;
    Ok(person)
}
```

The real power of it shines when you make mistakes in your SQL query. Let’s change the above code to use *id_*wrong instead of id:

```
pub async fn get_person_macro(&self, id: i64) -> Result<Person> {
    let mut transaction = self.pool.begin().await?;
    let person = sqlx::query_as!(Person, “SELECT * from person where id_wrong = $1”, id)
        .fetch_one(&mut transaction)
        .await?;
    transaction.commit().await?;
    Ok(person)
}
```


Compiling the above code will give this error:

```
error: error returned from database: column “id_wrong” does not exist
  --> src/main.rs:99:22
   |
99 |         let person = sqlx::query_as!(Person, “SELECT * from person where id_wrong = $1”, id)
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: this error originates in the macro `$crate::sqlx_macros::expand_query` (in Nightly builds, run with -Z macro-backtrace for more info)
```

As the error message indicates, there is no column named *id_wrong* in your table.

**Migrations**
You could see above that we ran the migrations using the *sqlx-cli tool.* But in our application code, it will often be handy to run the migrations on a fresh database.*The sqlx::migration* macro is specifically meant for that. It embeds the migration into your binary and can be used to run it before the application is started. This is how your new main function will look like with migrations integration:

```
#[tokio::main]
async fn main() -> Result<()> {
    let db = DBApplication::new(“postgres://postgres:postgres@localhost/sqlx-demo”.into()).await?;
    sqlx::migrate!().run(&db.pool).await?;
    ...
    ...
    Ok(())
}
```

Hopefully, this article gave you a good idea of how to use SQLx for interacting with your database. If you prefer an object-relational mapping (ORM) based solution, these are some of the popular options:

* Diesel: https://diesel.rs/
* sea_orm: https://docs.rs/sea-orm/latest/sea_orm/
* ormx: https://github.com/NyxCode/ormx

Both sea_orm and ormx are built on top of SQLx. The major differentiating factor between Diesel and the other ORM based solutions is that the former isn’t async IO ready yet.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/sqlx-the-rust-sql-toolkit/

作者：[Sibi Prabakaran][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/sibi-prabakaran/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/04/The-Rust-SQL-Toolkit-Featured-imade.jpg
