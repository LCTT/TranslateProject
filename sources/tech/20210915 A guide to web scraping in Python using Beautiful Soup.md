[#]: subject: "A guide to web scraping in Python using Beautiful Soup"
[#]: via: "https://opensource.com/article/21/9/web-scraping-python-beautiful-soup"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A guide to web scraping in Python using Beautiful Soup
======
The Beautiful Soup library in Python makes extracting HTML from web
pages easy.
![Computer screen with files or windows open][1]

Today we'll discuss how to use the Beautiful Soup library to extract content from an HTML page. After extraction, we'll convert it to a Python list or dictionary using Beautiful Soup.

### What is web scraping, and why do I need it?

The simple answer is this: Not every website has an API to fetch content. You might want to get recipes from your favorite cooking website or photos from a travel blog. Without an API, extracting the HTML, or _scraping_, might be the only way to get that content. I'm going to show you how to do this in Python.

**Not all websites take kindly to scraping, and some may prohibit it explicitly. Check with the website owners if they're okay with scraping.**

### How do I scrape a website in Python?

For web scraping to work in Python, we're going to perform three basic steps:

  1. Extract the HTML content using the `requests` library.
  2. Analyze the HTML structure and identify the tags which have our content.
  3. Extract the tags using Beautiful Soup and put the data in a Python list.



### Installing the libraries

Let's first install the libraries we'll need. The `requests` library fetches the HTML content from a website. Beautiful Soup parses HTML and converts it to Python objects. To install these for Python 3, run:


```
`pip3 install requests beautifulsoup4`
```

### Extracting the HTML

For this example, I'll choose to scrape the [Technology][2] section of this website. If you go to that page, you'll see a list of articles with title, excerpt, and publishing date. Our goal is to create a list of articles with that information.

The full URL for the Technology page is:


```
`https://notes.ayushsharma.in/technology`
```

We can get the HTML content from this page using `requests`:


```
#!/usr/bin/python3
import requests

url = '<https://notes.ayushsharma.in/technology>'

data = requests.get(url)

print(data.text)
```

The variable `data` will contain the HTML source code of the page.

### Extracting content from the HTML

To extract our data from the HTML received in `data`, we'll need to identify which tags have what we need.

If you skim through the HTML, you’ll find this section near the top:


```
&lt;[div][3] class="col"&gt;
  &lt;[a][4] href="/2021/08/using-variables-in-jekyll-to-define-custom-content" class="post-card"&gt;
    &lt;[div][3] class="card"&gt;
      &lt;[div][3] class="card-body"&gt;
        &lt;[h5][5] class="card-title"&gt;Using variables in Jekyll to define custom content&lt;/[h5][5]&gt;
        &lt;[small][6] class="card-text text-muted"&gt;I recently discovered that Jekyll's config.yml can be used to define custom
          variables for reusing content. I feel like I've been living under a rock all this time. But to err over and
          over again is human.&lt;/[small][6]&gt;
      &lt;/[div][3]&gt;
      &lt;[div][3] class="card-footer text-end"&gt;
        &lt;[small][6] class="text-muted"&gt;Aug 2021&lt;/[small][6]&gt;
      &lt;/[div][3]&gt;
    &lt;/[div][3]&gt;
  &lt;/[a][4]&gt;
&lt;/[div][3]&gt;
```

This is the section that repeats throughout the page for every article. We can see that `.card-title` has the article title, `.card-text` has the excerpt, and `.card-footer > small` has the publishing date.

Let's extract these using Beautiful Soup.


```
#!/usr/bin/python3
import requests
from bs4 import BeautifulSoup
from pprint import pprint

url = '<https://notes.ayushsharma.in/technology>'
data = requests.get(url)

my_data = []

html = BeautifulSoup(data.text, 'html.parser')
articles = html.select('a.post-card')

for article in articles:

    title = article.select('.card-title')[0].get_text()
    excerpt = article.select('.card-text')[0].get_text()
    pub_date = article.select('.card-footer small')[0].get_text()

    my_data.append({"title": title, "excerpt": excerpt, "pub_date": pub_date})

pprint(my_data)
```

The above code extracts the articles and puts them in the `my_data` variable. I'm using `pprint` to pretty-print the output, but you can skip it in your code. Save the code above in a file called `fetch.py`, and then run it using:


```
`python3 fetch.py`
```

If everything went fine, you should see this:


```
[{'excerpt': "I recently discovered that Jekyll's config.yml can be used to"
"define custom variables for reusing content. I feel like I've"
'been living under a rock all this time. But to err over and over'
'again is human.',
'pub_date': 'Aug 2021',
'title': 'Using variables in Jekyll to define custom content'},
{'excerpt': "In this article, I'll highlight some ideas for Jekyll"
'collections, blog category pages, responsive web-design, and'
'netlify.toml to make static website maintenance a breeze.',
'pub_date': 'Jul 2021',
'title': 'The evolution of ayushsharma.in: Jekyll, Bootstrap, Netlify,'
'static websites, and responsive design.'},
{'excerpt': "These are the top 5 lessons I've learned after 5 years of"
'Terraform-ing.',
'pub_date': 'Jul 2021',
'title': '5 key best practices for sane and usable Terraform setups'},

... (truncated)
```

And that's all it takes! In 22 lines of code, we've built a web scraper in Python. You can find the [source code in my example repo][7].

### Conclusion

With the website content in a Python list, we can now do cool stuff with it. We could return it as JSON for another application or convert it to HTML with custom styling. Feel free to copy-paste the above code and experiment with your favorite website.

Have fun, and keep coding.

* * *

_This article was originally published on the [author's personal blog][8] and has been adapted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/web-scraping-python-beautiful-soup

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://notes.ayushsharma.in/technology
[3]: http://december.com/html/4/element/div.html
[4]: http://december.com/html/4/element/a.html
[5]: http://december.com/html/4/element/h5.html
[6]: http://december.com/html/4/element/small.html
[7]: https://gitlab.com/ayush-sharma/example-assets/-/blob/fd7d2dfbfa3ca34103402993b35a61cbe943bcf3/programming/beautiful-soup/fetch.py
[8]: https://notes.ayushsharma.in/2021/08/a-guide-to-web-scraping-in-python-using-beautifulsoup
