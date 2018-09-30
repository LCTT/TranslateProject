translating----geekpi

Clinews – Read News And Latest Headlines From Commandline
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/clinews-720x340.jpeg)

A while ago, we have written about a CLI news client named [**InstantNews**][1] that helps you to read news and latest headlines from commandline instantly. Today, I stumbled upon a similar utility named **Clinews** which serves the same purpose – reading news and latest headlines from popular websites, blogs from Terminal. You don’t need to install GUI applications or mobile apps. You can read what’s happening in the world right from your Terminal. It is free, open source utility written using **NodeJS**.

### Installing Clinews

Since Clinews is written using NodeJS, you can install it using NPM package manager. If you haven’t install NodeJS, install it as described in the following link.

Once node installed, run the following command to install Clinews:

```
$ npm i -g clinews
```

You can also install Clinews using **Yarn** :

```
$ yarn global add clinews
```

Yarn itself can installed using npm

```
$ npm -i yarn
```

### Configure News API

Clinews retrieves all news headlines from [**News API**][2]. News API is a simple and easy-to-use API that returns JSON metadata for the headlines currently published on a range of news sources and blogs. It currently provides live headlines from 70 popular sources, including Ars Technica, BBC, Blooberg, CNN, Daily Mail, Engadget, ESPN, Financial Times, Google News, hacker News, IGN, Mashable, National Geographic, Reddit r/all, Reuters, Speigel Online, Techcrunch, The Guardian, The Hindu, The Huffington Post, The Newyork Times, The Next Web, The Wall street Journal, USA today and [**more**][3].

First, you need an API key from News API. Go to [**https://newsapi.org/register**][4] URL and register a free account to get the API key.

Once you got the API key from News API site, edit your **.bashrc** file:

```
$ vi ~/.bashrc

```

Add newsapi API key at the end like below:

```
export IN_API_KEY="Paste-API-key-here"

```

Please note that you need to paste the key inside the double quotes. Save and close the file.

Run the following command to update the changes.

```
$ source ~/.bashrc

```

Done. Now let us go ahead and fetch the latest headlines from new sources.

### Read News And Latest Headlines From Commandline

To read news and latest headlines from specific new source, for example **The Hindu** , run:

```
$ news fetch the-hindu

```

Here, **“the-hindu”** is the new source id (fetch id).

The above command will fetch latest 10 headlines from The Hindu news portel and display them in the Terminal. Also, it displays a brief description of the news, the published date and time, and the actual link to the source.

**Sample output:**

![](https://www.ostechnix.com/wp-content/uploads/2018/09/clinews-1.png)

To read a news in your browser, hold Ctrl key and click on the URL. It will open in your default web browser.

To view all the sources you can get news from, run:

```
$ news sources

```

**Sample output:**

![](https://www.ostechnix.com/wp-content/uploads/2018/09/clinews-2.png)

As you see in the above screenshot, Clinews lists all news sources including the name of the news source, fetch id, description of the site, website URL and the country where it is located. As of writing this guide, Clinews currently supports 70+ news sources.

Clinews can also able to search for news stories across all sources matching search criteria/term. Say for example, to list all news stories with titles containing the words **“Tamilnadu”** , use the following command:

```
$ news search "Tamilnadu"
```

This command will scrap all news sources for stories that match term **Tamilnadu**.

Clinews has some extra flags that helps you to

  * limit the amount of news stories you want to see,
  * sort news stories (top, latest, popular),
  * display news stories category wise (E.g. business, entertainment, gaming, general, music, politics, science-and-nature, sport, technology)



For more details, see the help section:

```
$ clinews -h
```

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/clinews-read-news-and-latest-headlines-from-commandline/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://www.ostechnix.com/get-news-instantly-commandline-linux/
[2]: https://newsapi.org/
[3]: https://newsapi.org/sources
[4]: https://newsapi.org/register
