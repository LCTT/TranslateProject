[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 reasons why I love Python)
[#]: via: (https://opensource.com/article/19/10/why-love-python)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

5 reasons why I love Python
======
These are a few of my favorite things about Python.
![Snake charmer cartoon with a yellow snake and a blue snake][1]

I have been using Python since it was a little-known language in 1998. It was a time when [Perl was quite popular][2] in the open source world, but I believed in Python from the moment I found it. My parents like to remind me that I used to say things like, "Python is going to be a big deal" and "I'll be able to find a job using it one day."** **It took a while, but my predictions came true.

There is so much to love about the language. Here are my top 5 reasons why I continue to love Python so much (in reverse order, to build anticipation).

### 5\. Python reads like executable pseudocode

Pseudocode is the concept of writing out programming logic without it following the exact syntax and grammar of a specific language. I have stopped writing much pseudocode since becoming a Python programmer because its actual design meets my needs.

Python can be easy to read even if you don't know the language well and that is very much by design. It is reasonably famous for whitespace requirements for code to be able to run. Whitespace is necessary for any language–it allows us to see each of the words in this sentence as distinct. Most languages have suggestions or  "best practices" around whitespace usage, but Python takes a bold step by requiring standardization. For me, that makes it incredibly straightforward to read through code and see exactly what it's doing.

For example, here is an implementation of the classic [bubble sort algorithm][3].


```
def bubble_sort(things):

    needs_pass = True

    while needs_pass:

        needs_pass = False

        for idx in range(1, len(things)):

            if things[idx - 1] &gt; things[idx]:

                things[idx - 1], things[idx] = things[idx], things[idx - 1]

                needs_pass = True
```

Now let's compare that with [this implementation][4] in Java.


```
public static int[] bubblesort(int[] numbers) {
    boolean swapped = true;
    for(int i = numbers.length - 1; i &gt; 0 &amp;&amp; swapped; i--) {
        swapped = false;
        for (int j = 0; j &lt; i; j++) {
            if (numbers[j] &gt; numbers[j+1]) {
                int temp = numbers[j];
                numbers[j] = numbers[j+1];
                numbers[j+1] = temp;
                swapped = true;
            }
        }
    }
    return numbers;
}
```

I appreciate that Python requires indentation to indicate nesting of blocks. While our Java example also uses indentation quite nicely, it is not required. The curly brackets are what determine the beginning and end of the block, not the spacing. Since Python uses whitespace as syntax, there is no need for beginning **{** and end **}** notation throughout the other code. 

Python also avoids the need for semicolons, which is a [syntactic sugar][5] needed to make other languages human-readable. Python is much easier to read on my eyes and it feels so close to pseudocode it sometimes surprises me what is runnable!

### 4\. Python has powerful primitives

In programming language design, a primitive is the simplest available element. The fact that Python is easy to read does _not_ mean it is not a powerful language, and that stems from its use of primitives. My favorite example of what makes Python both easy to use and advanced is its concept of **generators**. 

Imagine you have a simple binary tree structure with `value`, `left`, and `right`. You want to easily iterate over it in order. You usually are looking for "small" elements, in order to exit as soon as the right value is found. That sounds simple so far. However, there are many kinds of algorithms to make a decision on the element.

Other languages would have you write a **visitor**, where you invert control by putting your "is this the right element?" in a function and call it via function pointers. You _can_ do this in Python. But you don't have to.


```
def in_order(tree):

    if tree is None:

        return

    yield from in_order(tree.left)

    yield tree.value

    yield from in_order(tree.right)
```

This _generator function_ will return an iterator that, if used in a **for** loop, will only execute as much as needed but no more. That's powerful.

### 3\. The Python standard library

Python has a great standard library with many hidden gems I did not know about until I took the time to [walk through the list of all available][6] functions, constants, types, and much more. One of my personal favorites is the `itertools` module, which is listed under the functional programming modules (yes, [Python supports functional programming][7]!).

It is great for playing jokes on your tech interviewer, for example with this nifty little solution to the classic [FizzBuzz interview question][8]:


```
fizz = itertools.cycle(itertools.chain(['Fizz'], itertools.repeat('', 2)))

buzz = itertools.cycle(itertools.chain(['Buzz'], itertools.repeat('', 4)))

fizz_buzz = map(operator.add, fizz, buzz)

numbers = itertools.islice(itertools.count(), 100)

combo = zip(fizz_buzz, numbers)

for fzbz, n in combo:

    print(fzbz or n)
```

A quick web search will show that this is not the most straight-forward way to solve for FizzBuzz, but it sure is fun!

Beyond jokes, the `itertools` module, as well as the `heapq` and `functools` modules are a trove of treasures that come by default in your Python implementation.

### 2\. The Python ecosystem is massive

For everything that is not in the standard library, there is an enormous ecosystem to support the new Pythonista, from exciting packages to text editor plugins specifically for the language. With around 200,000 projects hosted on PyPi (at the time of writing) and growing, there is something for everyone: [data science][9], [async frameworks][10], [web frameworks][11], or just tools to make [remote automation][12] easier.

### 1\. The Python community is special

The Python community is amazing. It was one of the first to adopt a code of conduct, first for the [Python Software Foundation][13] and then for [PyCon][14]. There is a real commitment to diversity and inclusion: blog posts and conference talks on this theme are frequent, thoughtful, and well-read by Python community members.

While the community is global, there is a lot of great activity in the local community as well. Local Python meet-ups are a great place to meet wonderful people who are smart, experienced, and eager to help. A lot of meet-ups will explicitly have time set aside for experienced people to help newcomers who want to learn a new concept or to get past an issue with their code. My local community took the time to support me as I began my Python journey, and I am privileged to continue to give back to new developers.

Whether you can attend a local community meet-up or you spend time with the [online Python community][15] across IRC, Slack, and Twitter, I am sure you will meet lovely people who want to help you succeed as a developer. 

### Wrapping it up

There is so much to love about Python, and now you know my favorite part is definitely the people.

I have found kind, thoughtful Pythonistas in the community throughout the world, and the amount of community investment provide to those in need is incredibly encouraging. In addition to those I've met, the simple, clean, and powerful Python language gives any developer more than enough to master on their journey toward a career in software development or as a hobbyist enjoying playing around with a fun language. If you are interested in learning your first or a new language, consider Python and let me know how I can help.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/why-love-python

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/getting_started_with_python.png?itok=MFEKm3gl (Snake charmer cartoon with a yellow snake and a blue snake)
[2]: https://opensource.com/article/19/8/command-line-heroes-perl
[3]: https://en.wikipedia.org/wiki/Bubble_sort
[4]: https://en.wikibooks.org/wiki/Algorithm_Implementation/Sorting/Bubble_sort#Java
[5]: https://en.wikipedia.org/wiki/Syntactic_sugar
[6]: https://docs.python.org/3/library/
[7]: https://opensource.com/article/19/10/python-programming-paradigms
[8]: https://en.wikipedia.org/wiki/Fizz_buzz
[9]: https://pypi.org/project/pandas/
[10]: https://pypi.org/project/Twisted/
[11]: https://pypi.org/project/Django/
[12]: https://pypi.org/project/paramiko/
[13]: https://www.python.org/psf/conduct/
[14]: https://us.pycon.org/2019/about/code-of-conduct/
[15]: https://www.python.org/community/
