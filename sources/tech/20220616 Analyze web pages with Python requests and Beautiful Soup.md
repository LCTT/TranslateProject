[#]: subject: "Analyze web pages with Python requests and Beautiful Soup"
[#]: via: "https://opensource.com/article/22/6/analyze-web-pages-python-requests-beautiful-soup"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Analyze web pages with Python requests and Beautiful Soup
======
Follow this Python tutorial to easily extract information about web pages.

![Python programming language logo with question marks][1]

Image by: Opensource.com

Browsing the web probably accounts for much of your day. But it's an awfully manual process, isn't it? You have to open a browser. Go to a website. Click buttons, move a mouse. It's a lot of work. Wouldn't it be nicer to interact with the Internet through code?

You can get data from the Internet using Python with the help of the Python module `requests` :

```
import requests

DATA = "https://opensource.com/article/22/5/document-source-code-doxygen-linux"
PAGE = requests.get(DATA)

print(PAGE.text)
```

In this code sample, you first import the module `requests`. Then you create two variables: one called `DATA` to hold the URL you want to download. In later versions of this code, you'll be able to provide a different URL each time you run your application. For now, though, it's easiest to just "hard code” a test URL for demonstration purposes.

The other variable is `PAGE`, which you set to the responseof the `requests.get` function when it reads the URL stored in `DATA`. The `requests` module and its `.get` function is pre-programmed to "read” an Internet address (a URL), access the Internet, and download whatever is located at that address.

That's a lot of steps you don't have to figure out on your own, and that's exactly why Python modules exist. Finally, you tell Python to `print` everything that `requests.get` has stored in the `.text` field of the `PAGE` variable.

### Beautiful Soup

If you run the sample code above, you get the contents of the example URL dumped indiscriminately into your terminal. It does that because the only thing your code does with the data that `requests` has gathered is print it. It's more interesting to parse the text.

Python can "read” text with its most basic functions, but parsing text allows you to search for patterns, specific words, HTML tags, and so on. You could parse the text returned by `requests` yourself, but using a specialized module is much easier. For HTML and XML, there's the [Beautiful Soup][2] library.

This code accomplishes the same thing, but it uses Beautiful Soup to parse the downloaded text. Because Beautiful Soup recognizes HTML entities, you can use some of its built-in features to make the output a little easier for the human eye to parse.

For instance, instead of printing raw text at the end of your program, you can run the text through the `.prettify` function of Beautiful Soup:

```
from bs4 import BeautifulSoup
import requests

PAGE = requests.get("https://opensource.com/article/22/5/document-source-code-doxygen-linux")
SOUP = BeautifulSoup(PAGE.text, 'html.parser')

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    # do a thing here
    print(SOUP.prettify())
```

The output of this version of your program ensures that every opening HTML tag starts on its own line, with indentation to help demonstrate which tag is a parent of another tag. Beautiful Soup is aware of HTML tags in more ways than just how it prints it out.

Instead of printing the whole page, you can single out a specific kind of tag. For instance, try changing the print selector from print(SOUP.prettify() to this:

```
print(SOUP.p)
```

This prints just a `<p>` tag. Specifically, it prints just the first `<p>` tag encountered. To print all `<p>` tags, you need a loop.

### Looping

Create a for loop to cycle over the entire webpage contained in the `SOUP` variable, using the `find_all` function of Beautiful Soup. It's not unreasonable to want to use your loop for other tags besides just the `<p>` tag, so build it as a custom function, designated by the `def` keyword (for "define”) in Python.

```
def loopit():
    for TAG in SOUP.find_all('p'):
        print(TAG)
```

The temporary variable `TAG` is arbitrary. You can use any term, such as `ITEM` or `i` or whatever you want. Each time the loop runs, `TAG` contains the search results of the `find_all` function. In this code, the `<p>` tag is being searched.

A function doesn't run unless it's explicitly called. You can call your function at the end of your code:

```
# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    # do a thing here
    loopit()
```

Run your code to see all `<p>` tags and each one's contents.

### Getting just the content

You can exclude tags from being printed by specifying that you want just the "string” (programming lingo for "words”).

```
def loopit():
    for TAG in SOUP.find_all('p'):
        print(TAG.string)
```

Of course, once you have the text of a webpage, you can parse it further with the standard Python string libraries. For instance, you can get a word count using `len` and `split` :

```
def loopit():
    for TAG in SOUP.find_all('p'):
        if TAG.string is not None:
            print(len(TAG.string.split()))
```

This prints the number of strings within each paragraph element, omitting those paragraphs that don't have any strings. To get a grand total, use a variable and some basic math:

```
def loopit():
    NUM = 0
    for TAG in SOUP.find_all('p'):
        if TAG.string is not None:
            NUM = NUM + len(TAG.string.split())
    print("Grand total is ", NUM)
```

### Python homework

There's a lot more information you can extract with Beautiful Soup and Python. Here are some ideas on how to improve your application:

* [Accept input][3] so you can specify what URL to download and analyze when you launch your application.
* Count the number of images (<img> tags) on a page.
* Count the number of images (<img> tags) within another tag (for instance, only images that appear in the `<main>` div, or only images following a `</p>` tag).

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/analyze-web-pages-python-requests-beautiful-soup

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/python_programming_question.png
[2]: https://beautiful-soup-4.readthedocs.io/en/latest/
[3]: https://opensource.com/article/17/3/python-tricks-artists-interactivity-Python-scripts
