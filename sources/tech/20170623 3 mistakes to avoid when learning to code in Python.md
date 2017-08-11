
polebug is translating

3 mistakes to avoid when learning to code in Python
============================================================

### These errors created big problems that took hours to solve.

![3 mistakes to avoid when learning to code in Python](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/blocks_building.png?itok=q0_Wo8Tr "3 mistakes to avoid when learning to code in Python")
Image by : opensource.com

It's never easy to admit when you do things wrong, but making errors is part of any learning process, from learning to walk to learning a new programming language, such as Python.

Here's a list of three things I got wrong when I was learning Python, presented so that newer Python programmers can avoid making the same mistakes. These are errors that either I got away with for a long time or that that created big problems that took hours to solve.

Take heed young coders, some of these mistakes are afternoon wasters!

### 1\. Mutable data types as default arguments in function definitions

It makes sense right? You have a little function that, let's say, searches for links on a current page and optionally appends it to another supplied list.

```
def search_for_links(page, add_to=[]):
    new_links = page.search_for_links()
    add_to.extend(new_links)
    return add_to
```

On the face of it, this looks like perfectly normal Python, and indeed it is. It works. But there are issues with it. If we supply a list for the **add_to** parameter, it works as expected. If, however, we let it use the default, something interesting happens.

Try the following code:

```
def fn(var1, var2=[]):
    var2.append(var1)
    print var2

fn(3)
fn(4)
fn(5)
```

You may expect that we would see:

**[3]
[4]
[5]**

But we actually see this:

**[3]
[3, 4]
[3, 4, 5]**

Why? Well, you see, the same list is used each time. In Python, when we write the function like this, the list is instantiated as part of the function's definition. It is not instantiated each time the function is run. This means that the function keeps using the exact same list object again and again, unless of course we supply another one:

```
fn(3, [4])
```

**[4, 3]**

Just as expected. The correct way to achieve the desired result is:

```
def fn(var1, var2=None):
    if not var2:
        var2 = []
    var2.append(var1)
```

Or, in our first example:

```
def search_for_links(page, add_to=None):
    if not add_to:
        add_to = []
    new_links = page.search_for_links()
    add_to.extend(new_links)
    return add_to
```

This moves the instantiation from module load time so that it happens every time the function runs. Note that for immutable data types, like [**tuples**][7], [**strings**][8], or [**ints**][9], this is not necessary. That means it is perfectly fine to do something like:

```
def func(message="my message"):
    print message
```

### 2\. Mutable data types as class variables

Hot on the heels of the last error is one that is very similar. Consider the following:

```
class URLCatcher(object):
    urls = []

    def add_url(self, url):
        self.urls.append(url)
```

This code looks perfectly normal. We have an object with a storage of URLs. When we call the **add_url** method, it adds a given URL to the store. Perfect right? Let's see it in action:

```
a = URLCatcher()
a.add_url('http://www.google.')
b = URLCatcher()
b.add_url('http://www.bbc.co.')
```

**b.urls
['[http://www.google.com][2]', '[http://www.bbc.co.uk][3]']**

**a.urls
['[http://www.google.com][4]', '[http://www.bbc.co.uk][5]']**

Wait, what?! We didn't expect that. We instantiated two separate objects, **a** and **b**. **A** was given one URL and **b** the other. How is it that both objects have both URLs?

Turns out it's kinda the same problem as in the first example. The URLs list is instantiated when the class definition is created. All instances of that class use the same list. Now, there are some cases where this is advantageous, but the majority of the time you don't want to do this. You want each object to have a separate store. To do that, we would modify the code like:

```
class URLCatcher(object):
    def __init__(self):
        self.urls = []

    def add_url(self, url):
        self.urls.append(url)
```

Now the URLs list is instantiated when the object is created. When we instantiate two separate objects, they will be using two separate lists.

### 3\. Mutable assignment errors

This one confused me for a while. Let's change gears a little and use another mutable datatype, the [**dict**][10].

```
a = {'1': "one", '2': 'two'}
```

Now let's assume we want to take that **dict** and use it someplace else, leaving the original intact.

```
b = a

b['3'] = 'three'
```

Simple eh?

Now let's look at our original dict, **a**, the one we didn't want to modify:

```
{'1': "one", '2': 'two', '3': 'three'}
```

Whoa, hold on a minute. What does **b** look like then?

```
{'1': "one", '2': 'two', '3': 'three'}
```

Wait what? But… let's step back and see what happens with our other immutable types, a **tuple** for instance:

```
c = (2, 3)
d = c
d = (4, 5)
```

Now **c** is:
**(2, 3)**

While **d** is:
**(4, 5)**

That functions as expected. So what happened in our example? When using mutable types, we get something that behaves a little more like a pointer from C. When we said **b = a** in the code above, what we really meant was: **b** is now also a reference to **a**. They both point to the same object in Python's memory. Sound familiar? That's because it's similar to the previous problems. In fact, this post should really have been called, "The Trouble with Mutables."

Does the same thing happen with lists? Yes. So how do we get around it? Well, we have to be very careful. If we really need to copy a list for processing, we can do so like:

```
b = a[:]
```

This will go through and copy a reference to each item in the list and place it in a new list. But be warned: If any objects in the list are mutable, we will again get references to those, rather than complete copies.

Imagine having a list on a piece of paper. In the original example, Person A and Person B are looking at the same piece of paper. If someone changes that list, both people will see the same changes. When we copy the references, each person now has their own list. But let's suppose that this list contains places to search for food. If "fridge" is first on the list, even when it is copied, both entries in both lists point to the same fridge. So if the fridge is modified by Person A, by say eating a large gateaux, Person B will also see that the gateaux is missing. There is no easy way around this. It is just something that you need to remember and code in a way that will not cause an issue.

Dicts function in the same way, and you can create this expensive copy by doing:

```
b = a.copy()
```

Again, this will only create a new dictionary pointing to the same entries that were present in the original. Thus, if we have two lists that are identical and we modify a mutable object that is pointed to by a key from dict 'a', the dict object present in dict 'b' will also see those changes.

The trouble with mutable data types is that they are powerful. None of the above are real problems; they are things to keep in mind to prevent issues. The expensive copy operations presented as solutions in the third item are unnecessary 99% of the time. Your program can and probably should be modified so that those copies are not even required in the first place.

 _Happy coding! And feel free to ask questions in the comments._

--------------------------------------------------------------------------------

作者简介：

Pete Savage - Peter is a passionate Open Source enthusiast who has been promoting and using Open Source products for the last 10 years. He has volunteered in many different areas, starting in the Ubuntu community, before moving off into the realms of audio production and later into writing. Career wise he spent much of his early years managing and building datacenters as a sysadmin, before ending up working for Red Hat as a Principal Quailty Engineer for the CloudForms product. He occasionally pops out a

-----------------

via: https://opensource.com/article/17/6/3-things-i-did-wrong-learning-python

作者：[Pete Savage ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/psav
[1]:https://opensource.com/article/17/6/3-things-i-did-wrong-learning-python?rate=SfClhaQ6tQsJdKM8-YTNG00w53fsncvsNWafwuJbtqs
[2]:http://www.google.com/
[3]:http://www.bbc.co.uk/
[4]:http://www.google.com/
[5]:http://www.bbc.co.uk/
[6]:https://opensource.com/user/36026/feed
[7]:https://docs.python.org/2/library/functions.html?highlight=tuple#tuple
[8]:https://docs.python.org/2/library/string.html
[9]:https://docs.python.org/2/library/functions.html#int
[10]:https://docs.python.org/2/library/stdtypes.html?highlight=dict#dict
[11]:https://opensource.com/users/psav
[12]:https://opensource.com/article/17/6/3-things-i-did-wrong-learning-python#comments
