用 Python 构建你自己的 RSS 提示系统
======

![](https://fedoramagazine.org/wp-content/uploads/2018/01/learn-python-rss-notifier.png-945x400.jpg)

人生苦短，我用 Python，Python 是非常棒的快速构建应用程序的编程语言。在这篇文章中我们将学习如何使用 Python 去构建一个 RSS 提示系统，目标是使用 Fedora 快乐地学习 Python。如果你正在寻找一个完整的 RSS 提示应用程序，在 Fedora 中已经准备好了几个包。

### Fedora 和 Python —— 入门知识

Python 3.6 在 Fedora 中是默认安装的，它包含了 Python 的很多标准库。标准库提供了一些可以让我们的任务更加简单完成的模块的集合。例如，在我们的案例中，我们将使用 [sqlite3][1] 模块在数据库中去创建表、添加和读取数据。在这个案例中，我们试图去解决的是这样的一个特定问题，在标准库中没有包含，而有可能已经有人为我们开发了这样一个模块。最好是使用像大家熟知的 [PyPI][2]  Python 包索引去搜索一下。在我们的示例中，我们将使用 [feedparser][3] 去解析 RSS 源。

因为 feedparser 并不是标准库，我们需要将它安装到我们的系统上。幸运的是，在 Fedora 中有这个 RPM 包，因此，我们可以运行如下的命令去安装 feedparser：
```
$ sudo dnf install python3-feedparser
```

我们现在已经拥有了编写我们的应用程序所需的东西了。

### 存储源数据

我们需要存储已经发布的文章的数据，这样我们的系统就可以只提示新发布的文章。我们要保存的数据将是用来辨别一篇文章的唯一方法。因此，我们将存储文章的标题和发布日期。

因此，我们来使用 Python sqlite3 模块和一个简单的 SQL 语句来创建我们的数据库。同时也添加一些后面将要用到的模块（feedparse，smtplib，和 email）。

#### 创建数据库

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

这几行代码创建一个名为 `magazine_rss.sqlite` 文件的新 sqlite 数据库，然后在数据库创建一个名为 `magazine` 的新表。这个表有两个列 —— `title` 和 `date` —— 它们能存诸 TEXT 类型的数据，也就是说每个列的值都是文本字符。

#### 检查数据库中的旧文章

由于我们仅希望增加新的文章到我们的数据库中，因此我们需要一个功能去检查 RSS 源中的文章在数据库中是否存在。我们将根据它来判断是否发送（有新文章的）邮件提示。Ok，现在我们来写这个功能的代码。

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

这个功能的主要部分是一个 SQL 查询，我们运行它去搜索数据库。我们使用一个 `SELECT` 命令去定义我们将要在哪个列上运行这个查询。我们使用 `*` 符号去选取所有列（`title` 和 `date`）。然后，我们使用查询的 `WHERE` 条件 `article_title` 和 `article_date` 去匹配标题和日期列中的值，以检索出我们需要的内容。

最后，我们使用一个简单的返回 `True` 或者 `False` 的逻辑来表示是否在数据库中找到匹配的文章。

#### 在数据库中添加新文章

现在我们可以写一些代码去添加新文章到数据库中。

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

这个功能很简单，我们使用了一个 SQL 查询去插入一个新行到 `magazine` 表的 `article_title` 和 `article_date` 列中。然后提交它到数据库中永久保存。

这些就是在数据库中所需要的东西，接下来我们看一下，如何使用 Python 实现提示系统和发送电子邮件。

### 发送电子邮件提示

我们使用 Python 标准库模块 smtplib 来创建一个发送电子邮件的功能。我们也可以使用标准库中的 email 模块去格式化我们的电子邮件信息。

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

在这个示例中，我使用了谷歌邮件系统的 smtp 服务器去发送电子邮件，在你自己的代码中你需要将它更改为你自己的电子邮件服务提供者的 SMTP 服务器。这个功能是个样板，大多数的内容要根据你的 smtp 服务器的参数来配置。代码中的电子邮件地址和凭证也要更改为你自己的。

如果在你的 Gmail 帐户中使用了双因子认证，那么你需要配置一个密码应用程序为你的这个应用程序提供一个唯一密码。可以看这个 [帮助页面][4]。

### 读取 Fedora Magazine 的 RSS 源

我们已经有了在数据库中存储文章和发送提示电子邮件的功能，现在来创建一个解析 Fedora Magazine RSS 源并提取文章数据的功能。

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

在这里我们将使用 `feedparser.parse` 功能。这个功能返回一个用字典表示的 RSS 源，对于 feedparser 的完整描述可以参考它的 [文档][5]。

RSS 源解析将返回最后的 10 篇文章作为 `entries`，然后我们提取以下信息：标题、链接、文章发布日期。因此，我们现在可以使用前面定义的检查文章是否在数据库中存在的功能，然后，发送提示电子邮件并将这个文章添加到数据库中。

当运行我们的脚本时，最后的 `if` 语句运行我们的 `read_article_feed` 功能，然后关闭数据库连接。

### 运行我们的脚本

给脚本文件赋于正确运行权限。接下来，我们使用 cron 实用程序去每小时自动运行一次我们的脚本。cron 是一个作业计划程序，我们可以使用它在一个固定的时间去运行一个任务。

```
$ chmod a+x my_rss_notifier.py
$ sudo cp my_rss_notifier.py /etc/cron.hourly
```

为了使该教程保持简单，我们使用了 `cron.hourly` 目录每小时运行一次我们的脚本，如果你想学习关于 cron 的更多知识以及如何配置 crontab，请阅读 cron 的 wikipedia [页面][6]。

### 总结

在本教程中，我们学习了如何使用 Python 去创建一个简单的 sqlite 数据库、解析一个 RSS 源、以及发送电子邮件。我希望通过这篇文章能够向你展示，使用 Python 和 Fedora 构建你自己的应用程序是件多么容易的事。

这个脚本在 [GitHub][7] 上可以找到。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/never-miss-magazines-article-build-rss-notification-system/

作者：[Clément Verna][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://docs.python.org/3/library/sqlite3.html
[2]:https://pypi.python.org/pypi
[3]:https://pypi.python.org/pypi/feedparser/5.2.1
[4]:https://support.google.com/accounts/answer/185833?hl=en
[5]:https://pythonhosted.org/feedparser/reference.html
[6]:https://en.wikipedia.org/wiki/Cron
[7]:https://github.com/cverna/rss_feed_notifier
