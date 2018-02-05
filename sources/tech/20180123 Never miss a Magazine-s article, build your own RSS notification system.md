Never miss a Magazine's article, build your own RSS notification system
======

![](https://fedoramagazine.org/wp-content/uploads/2018/01/learn-python-rss-notifier.png-945x400.jpg)

Python is a great programming language to quickly build applications that make our life easier. In this article we will learn how to use Python to build a RSS notification system, the goal being to have fun learning Python using Fedora. If you are looking for a complete RSS notifier application, there are a few already packaged in Fedora.

### Fedora and Python - getting started

Python 3.6 is available by default in Fedora, that includes Python's extensive standard library. The standard library provides a collection of modules which make some tasks simpler for us. For example, in our case we will use the [**sqlite3**][1] module to create, add and read data from a database. In the case where a particular problem we are trying to solve is not covered by the standard library, the chance is that someone has already developed a module for everyone to use. The best place to search for such modules is the Python Package Index known as [PyPI][2]. In our example we are going to use the [**feedparser**][3] to parse an RSS feed.

Since **feedparser** is not in the standard library, we have to install it in our system. Luckily for us there is an rpm package in Fedora, so the installation of **feedparser** is as simple as:
```
$ sudo dnf install python3-feedparser
```

We now have everything we need to start coding our application.

### Storing the feed data

We need to store data from the articles that have already been published so that we send a notification only for new articles. The data we want to store will give us a unique way to identify an article. Therefore we will store the **title** and the **publication date** of the article.

So let's create our database using python **sqlite3** module and a simple SQL query. We are also adding the modules we are going to use later ( **feedparser** , **smtplib** and **email** ).

#### Creating the Database
```
#!/usr/bin/python3
import sqlite3
import smtplib
from email.mime.text import MIMEText

import feedparser

db_connection = sqlite3.connect('/var/tmp/magazine_rss.sqlite')
db = db_connection.cursor()
db.execute(' CREATE TABLE IF NOT EXISTS magazine (title TEXT, date TEXT)')

```

These few lines of code create a new sqlite database stored in a file called 'magazine_rss.sqlite', and then create a new table within the database called 'magazine'. This table has two columns - 'title' and 'date' - that can store data of the type TEXT, which means that the value of each column will be a text string.

#### Checking the Database for old articles

Since we only want to add new articles to our database we need a function that will check if the article we get from the RSS feed is already in our database or not. We will use it to decide if we should send an email notification (new article) or not (old article). Ok let's code this function.
```
def article_is_not_db(article_title, article_date):
    """ Check if a given pair of article title and date
    is in the database.
    Args:
        article_title (str): The title of an article
        article_date  (str): The publication date of an article
    Return:
        True if the article is not in the database
        False if the article is already present in the database
    """
    db.execute("SELECT * from magazine WHERE title=? AND date=?", (article_title, article_date))
    if not db.fetchall():
        return True
    else:
        return False
```

The main part of this function is the SQL query we execute to search through the database. We are using a SELECT instruction to define which column of our magazine table we will run the query on. We are using the 0_sync_master.sh 1_add_new_article_manual.sh 1_add_new_article_newspaper.sh 2_start_translating.sh 3_continue_the_work.sh 4_finish.sh 5_pause.sh base.sh env format.test lctt.cfg parse_url_by_manual.sh parse_url_by_newspaper.py parse_url_by_newspaper.sh README.org reformat.sh symbol to select all columns ( title and date). Then we ask to select only the rows of the table WHERE the article_title and article_date string are equal to the value of the title and date column.

To finish, we have a simple logic that will return True if the query did not return any results and False if the query found an article in database matching our title, date pair.

#### Adding a new article to the Database

Now we can code the function to add a new article to the database.
```
def add_article_to_db(article_title, article_date):
    """ Add a new article title and date to the database
    Args:
        article_title (str): The title of an article
        article_date (str): The publication date of an article
    """
    db.execute("INSERT INTO magazine VALUES (?,?)", (article_title, article_date))
    db_connection.commit()
```

This function is straight forward, we are using a SQL query to INSERT a new row INTO the magazine table with the VALUES of the article_title and article_date. Then we commit the change to make it persistent.

That's all we need from the database's point of view, let's look at the notification system and how we can use python to send emails.

### Sending an email notification

Let's create a function to send an email using the python standard library module **smtplib.** We are also using the **email** module from the standard library to format our email message.
```
def send_notification(article_title, article_url):
    """ Add a new article title and date to the database

    Args:
        article_title (str): The title of an article
        article_url (str): The url to access the article
    """

    smtp_server = smtplib.SMTP('smtp.gmail.com', 587)
    smtp_server.ehlo()
    smtp_server.starttls()
    smtp_server.login('your_email@gmail.com', '123your_password')
    msg = MIMEText(f'\nHi there is a new Fedora Magazine article : {article_title}. \nYou can read it here {article_url}')
    msg['Subject'] = 'New Fedora Magazine Article Available'
    msg['From'] = 'your_email@gmail.com'
    msg['To'] = 'destination_email@gmail.com'
    smtp_server.send_message(msg)
    smtp_server.quit()
```

In this example I am using the Google mail smtp server to send an email, but this will work with any email services that provides you with a SMTP server. Most of this function is boilerplate needed to configure the access to the smtp server. You will need to update the code with your email address and credentials.

If you are using 2 Factor Authentication with your gmail account you can setup a password app that will give you a unique password to use for this application. Check out this help [page][4].

### Reading Fedora Magazine RSS feed

We now have functions to store an article in the database and send an email notification, let's create a function that parses the Fedora Magazine RSS feed and extract the articles' data.
```
def read_article_feed():
    """ Get articles from RSS feed """
    feed = feedparser.parse('https://fedoramagazine.org/feed/')
    for article in feed['entries']:
        if article_is_not_db(article['title'], article['published']):
            send_notification(article['title'], article['link'])
            add_article_to_db(article['title'], article['published'])

if __name__ == '__main__':
    read_article_feed()
    db_connection.close()
```

Here we are making use of the **feedparser.parse** function. The function returns a dictionary representation of the RSS feed, for the full reference of the representation you can consult **feedparser** 's [documentation][5].

The RSS feed parser will return the last 10 articles as entries and then we extract the following information: the title, the link and the date the article was published. As a result, we can now use the functions we have previously defined to check if the article is not in the database, then send a notification email and finally, add the article to our database.

The last if statement is used to execute our read_article_feed function and then close the database connection when we execute our script.

### Running our script

Finally, to run our script we need to give the correct permission to the file. Next, we make use of the **cron** utility to automatically execute our script every hour (1 minute past the hour). **cron** is a job scheduler that we can use to run a task at a fixed time.
```
$ chmod a+x my_rss_notifier.py
$ sudo cp my_rss_notifier.py /etc/cron.hourly
```

To keep this tutorial simple, we are using the cron.hourly directory to execute the script every hours, I you wish to learn more about **cron** and how to configure the **crontab,** please read **cron 's** wikipedia [page][6].

### Conclusion

In this tutorial we have learned how to use Python to create a simple sqlite database, parse an RSS feed and send emails. I hope that this showed you how you can easily build your own application using Python and Fedora.

The script is available on github [here][7].


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/never-miss-magazines-article-build-rss-notification-system/

作者：[Clément Verna][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://docs.python.org/3/library/sqlite3.html
[2]:https://pypi.python.org/pypi
[3]:https://pypi.python.org/pypi/feedparser/5.2.1
[4]:https://support.google.com/accounts/answer/185833?hl=en
[5]:https://pythonhosted.org/feedparser/reference.html
[6]:https://en.wikipedia.org/wiki/Cron
[7]:https://github.com/cverna/rss_feed_notifier
