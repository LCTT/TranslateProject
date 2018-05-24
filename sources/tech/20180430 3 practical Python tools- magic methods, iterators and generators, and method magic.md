3 practical Python tools: magic methods, iterators and generators, and method magic
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/serving-bowl-forks-dinner.png?itok=a3YqPwr5)
Python offers a unique set of tools and language features that help make your code more elegant, readable, and intuitive. By selecting the right tool for the right problem, your code will be easier to maintain. In this article, we'll examine three of those tools: magic methods, iterators and generators, and method magic.

### Magic methods


Magic methods can be considered the plumbing of Python. They're the methods that are called "under the hood" for certain built-in methods, symbols, and operations. A common magic method you may be familiar with is, `__init__()`,which is called when we want to initialize a new instance of a class. 

You may have seen other common magic methods, like `__str__` and `__repr__`. There is a whole world of magic methods, and by implementing a few of them, we can greatly modify the behavior of an object or even make it behave like a built-in datatype, such as a number, list, or dictionary.

Let's take this `Money` class for example:
```
class Money:



    currency_rates = {

        '$': 1,

        '€': 0.88,

    }



    def __init__(self, symbol, amount):

        self.symbol = symbol

        self.amount = amount



    def __repr__(self):

        return '%s%.2f' % (self.symbol, self.amount)



    def convert(self, other):

        """ Convert other amount to our currency """

        new_amount = (

            other.amount / self.currency_rates[other.symbol]

            * self.currency_rates[self.symbol])



        return Money(self.symbol, new_amount)

```

The class defines a currency rate for a given symbol and exchange rate, specifies an initializer (also known as a constructor), and implements `__repr__`, so when we print out the class, we see a nice representation such as `$2.00` for an instance `Money('$', 2.00)` with the currency symbol and amount. Most importantly, it defines a method that allows you to convert between different currencies with different exchange rates.

Using a Python shell, let's say we've defined the costs for two food items in different currencies, like so:
```
>>> soda_cost = Money('$', 5.25)

>>> soda_cost

    $5.25



>>> pizza_cost = Money('€', 7.99)

>>> pizza_cost

    €7.99

```

We could use magic methods to help instances of this class interact with each other. Let's say we wanted to be able to add two instances of this class together, even if they were in different currencies. To make that a reality, we could implement the `__add__` magic method on our `Money` class:
```
class Money:



    # ... previously defined methods ...



    def __add__(self, other):

        """ Add 2 Money instances using '+' """

        new_amount = self.amount + self.convert(other).amount

        return Money(self.symbol, new_amount)

```

Now we can use this class in a very intuitive way:
```
>>> soda_cost = Money('$', 5.25)



>>> pizza_cost = Money('€', 7.99)



>>> soda_cost + pizza_cost

    $14.33



>>> pizza_cost + soda_cost

    €12.61

```

When we add two instances together, we get a result in the first defined currency. All the conversion is done seamlessly under the hood. If we wanted to, we could also implement `__sub__` for subtraction, `__mul__` for multiplication, and many more. Read about [emulating numeric types][1], or read this [guide to magic methods][2] for others.

We learned that `__add__` maps to the built-in operator `+`. Other magic methods can map to symbols like `[]`. For example, to access an item by index or key (in the case of a dictionary), use the `__getitem__` method:
```
>>> d = {'one': 1, 'two': 2}



>>> d['two']

2

>>> d.__getitem__('two')

2

```

Some magic methods even map to built-in functions, such as `__len__()`, which maps to `len()`.
```
class Alphabet:

    letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'



    def __len__(self):

        return len(self.letters)





>>> my_alphabet = Alphabet()

>>> len(my_alphabet)

    26

```

### Custom iterators

Custom iterators are an incredibly powerful but unfortunately confusing topic to new and seasoned Pythonistas alike.

Many built-in types, such as lists, sets, and dictionaries, already implement the protocol that allows them to be iterated over under the hood. This allows us to easily loop over them.
```
>>> for food in ['Pizza', 'Fries']:

         print(food + '. Yum!')



Pizza. Yum!

Fries. Yum!

```

How can we iterate over our own custom classes? First, let's clear up some terminology.

  * To be iterable, a class needs to implement `__iter__()`
  * The `__iter__()` method needs to return an iterator
  * To be an iterator, a class needs to implement `__next__()` (or `next()` [in Python 2][3]), which must raise a `StopIteration` exception when there are no more items to iterate over.



Whew! It sounds complicated, but once you remember these fundamental concepts, you'll be able to iterate in your sleep.

When might we want to use a custom iterator? Let's imagine a scenario where we have a `Server` instance running different services such as `http` and `ssh` on different ports. Some of these services have an `active` state while others are `inactive`.
```
class Server:



    services = [

        {'active': False, 'protocol': 'ftp', 'port': 21},

        {'active': True, 'protocol': 'ssh', 'port': 22},

        {'active': True, 'protocol': 'http', 'port': 80},

    ]

```

When we loop over our `Server` instance, we only want to loop over `active` services. Let's create a new class, an `IterableServer`:
```
class IterableServer:



    def __init__(self):

        self.current_pos = 0



    def __next__(self):

        pass  # TODO: Implement and remember to raise StopIteration

```

First, we initialize our current position to `0`. Then, we define a `__next__()` method, which will return the next item. We'll also ensure that we raise `StopIteration` when there are no more items to return. So far so good! Now, let's implement this `__next__()` method.
```
class IterableServer:



    def __init__(self):

        self.current_pos = 0.  # we initialize our current position to zero



    def __iter__(self):  # we can return self here, because __next__ is implemented

        return self



    def __next__(self):

        while self.current_pos < len(self.services):

            service = self.services[self.current_pos]

            self.current_pos += 1

            if service['active']:

                return service['protocol'], service['port']

        raise StopIteration



    next = __next__  # optional python2 compatibility

```

We keep looping over the services in our list while our current position is less than the length of the services but only returning if the service is active. Once we run out of services to iterate over, we raise a `StopIteration` exception.

Because we implement a `__next__()` method that raises `StopIteration` when it is exhausted, we can return `self` from `__iter__()` because the `IterableServer` class adheres to the `iterable` protocol.

Now we can loop over an instance of `IterableServer`, which will allow us to look at each active service, like so:
```
>>> for protocol, port in IterableServer():

        print('service %s is running on port %d' % (protocol, port))



service ssh is running on port 22

service http is running on port 21

```

That's pretty great, but we can do better! In an instance like this, where our iterator doesn't need to maintain a lot of state, we can simplify our code and use a [generator][4] instead.
```
class Server:



    services = [

        {'active': False, 'protocol': 'ftp', 'port': 21},

        {'active': True, 'protocol': 'ssh', 'port': 22},

        {'active': True, 'protocol': 'http', 'port': 21},

    ]



    def __iter__(self):

        for service in self.services:

            if service['active']:

                yield service['protocol'], service['port']

```

What exactly is the `yield` keyword? Yield is used when defining a generator function. It's sort of like a `return`. While a `return` exits the function after returning the value, `yield` suspends execution until the next time it's called. This allows your generator function to maintain state until it resumes. Check out [yield's documentation][5] to learn more. With a generator, we don't have to manually maintain state by remembering our position. A generator knows only two things: what it needs to do right now and what it needs to do to calculate the next item. Once we reach a point of execution where `yield` isn't called again, we know to stop iterating.

This works because of some built-in Python magic. In the [Python documentation for `__iter__()`][6] we can see that if `__iter__()` is implemented as a generator, it will automatically return an iterator object that supplies the `__iter__()` and `__next__()` methods. Read this great article for a deeper dive of [iterators, iterables, and generators][7].

### Method magic

Due to its unique aspects, Python provides some interesting method magic as part of the language.

One example of this is aliasing functions. Since functions are just objects, we can assign them to multiple variables. For example:
```
>>> def foo():

       return 'foo'



>>> foo()

'foo'



>>> bar = foo



>>> bar()

'foo'

```

We'll see later on how this can be useful.

Python provides a handy built-in, [called `getattr()`][8], that takes the `object, name, default` parameters and returns the attribute `name` on `object`. This programmatically allows us to access instance variables and methods. For example:
```
>>> class Dog:

        sound = 'Bark'

        def speak(self):

            print(self.sound + '!', self.sound + '!')



>>> fido = Dog()



>>> fido.sound

'Bark'

>>> getattr(fido, 'sound')

'Bark'



>>> fido.speak

<bound method Dog.speak of <__main__.Dog object at 0x102db8828>>

>>> getattr(fido, 'speak')

<bound method Dog.speak of <__main__.Dog object at 0x102db8828>>





>>> fido.speak()

Bark! Bark!

>>> speak_method = getattr(fido, 'speak')

>>> speak_method()

Bark! Bark!

```

Cool trick, but how could we practically use `getattr`? Let's look at an example that allows us to write a tiny command-line tool to dynamically process commands.
```
class Operations:

    def say_hi(self, name):

        print('Hello,', name)



    def say_bye(self, name):

        print ('Goodbye,', name)



    def default(self, arg):

        print ('This operation is not supported.')



if __name__ == '__main__':

    operations = Operations()



    # let's assume we do error handling

    command, argument = input('> ').split()

    func_to_call = getattr(operations, command, operations.default)

    func_to_call(argument)

```

The output of our script is:
```
$ python getattr.py



> say_hi Nina

Hello, Nina



> blah blah

This operation is not supported.

```

Next, we'll look at `partial`. For example, **`functool.partial(func, *args, **kwargs)`** allows you to return a new [partial object][9] that behaves like `func` called with `args` and `kwargs`. If more `args` are passed in, they're appended to `args`. If more `kwargs` are passed in, they extend and override `kwargs`. Let's see it in action with a brief example:
```
>>> from functools import partial

>>> basetwo = partial(int, base=2)

>>> basetwo

<functools.partial object at 0x1085a09f0>



>>> basetwo('10010')

18



# This is the same as

>>> int('10010', base=2)

```

Let's see how this method magic ties together in some sample code from a library I enjoy using [called][10]`agithub`, which is a (poorly named) REST API client with transparent syntax that allows you to rapidly prototype any REST API (not just GitHub) with minimal configuration. I find this project interesting because it's incredibly powerful yet only about 400 lines of Python. You can add support for any REST API in about 30 lines of configuration code. `agithub` knows everything it needs to about protocol (`REST`, `HTTP`, `TCP`), but it assumes nothing about the upstream API. Let's dive into the implementation.

Here's a simplified version of how we'd define an endpoint URL for the GitHub API and any other relevant connection properties. View the [full code][11] instead.
```
class GitHub(API):



    def __init__(self, token=None, *args, **kwargs):

        props = ConnectionProperties(api_url = kwargs.pop('api_url', 'api.github.com'))

        self.setClient(Client(*args, **kwargs))

        self.setConnectionProperties(props)

```

Then, once your [access token][12] is configured, you can start using the [GitHub API][13].
```
>>> gh = GitHub('token')

>>> status, data = gh.user.repos.get(visibility='public', sort='created')

>>> # ^ Maps to GET /user/repos

>>> data

... ['tweeter', 'snipey', '...']

```

Note that it's up to you to spell things correctly. There's no validation of the URL. If the URL doesn't exist or anything else goes wrong, the error thrown by the API will be returned. So, how does this all work? Let's figure it out. First, we'll check out a simplified example of the [`API` class][14]:
```
class API:



    # ... other methods ...



    def __getattr__(self, key):

        return IncompleteRequest(self.client).__getattr__(key)

    __getitem__ = __getattr__

```

Each call on the `API` class ferries the call to the [`IncompleteRequest` class][15] for the specified `key`.
```
class IncompleteRequest:



    # ... other methods ...



    def __getattr__(self, key):

        if key in self.client.http_methods:

            htmlMethod = getattr(self.client, key)

            return partial(htmlMethod, url=self.url)

        else:

            self.url += '/' + str(key)

            return self

    __getitem__ = __getattr__





class Client:

    http_methods = ('get')  # ... and post, put, patch, etc.



    def get(self, url, headers={}, **params):

        return self.request('GET', url, None, headers)

```

If the last call is not an HTTP method (like 'get', 'post', etc.), it returns an `IncompleteRequest` with an appended path. Otherwise, it gets the right function for the specified HTTP method from the [`Client` class][16] and returns a `partial` .

What happens if we give a non-existent path?
```
>>> status, data = this.path.doesnt.exist.get()

>>> status

... 404

```

And because `__getitem__` is aliased to `__getattr__`:
```
>>> owner, repo = 'nnja', 'tweeter'

>>> status, data = gh.repos[owner][repo].pulls.get()

>>> # ^ Maps to GET /repos/nnja/tweeter/pulls

>>> data

.... # {....}

```

Now that's some serious method magic!

### Learn more

Python provides plenty of tools that allow you to make your code more elegant and easier to read and understand. The challenge is finding the right tool for the job, but I hope this article added some new ones to your toolbox. And, if you'd like to take this a step further, you can read about decorators, context managers, context generators, and `NamedTuple`s on my blog [nnja.io][17]. As you become a better Python developer, I encourage you to get out there and read some source code for well-architected projects. [Requests][18] and [Flask][19] are two great codebases to start with.


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/elegant-solutions-everyday-python-problems

作者：[Nina Zakharenko][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/nnja
[1]:https://docs.python.org/3/reference/datamodel.html#emulating-numeric-types
[2]:https://rszalski.github.io/magicmethods/
[3]:https://docs.python.org/2/library/stdtypes.html#iterator.next
[4]:https://docs.python.org/3/library/stdtypes.html#generator-types
[5]:https://docs.python.org/3/reference/expressions.html#yieldexpr
[6]:https://docs.python.org/3/reference/datamodel.html#object.__iter__
[7]:http://nvie.com/posts/iterators-vs-generators/
[8]:https://docs.python.org/3/library/functions.html#getattr
[9]:https://docs.python.org/3/library/functools.html#functools.partial
[10]:https://github.com/mozilla/agithub
[11]:https://github.com/mozilla/agithub/blob/master/agithub/GitHub.py
[12]:https://github.com/settings/tokens
[13]:https://developer.github.com/v3/repos/#list-your-repositories
[14]:https://github.com/mozilla/agithub/blob/dbf7014e2504333c58a39153aa11bbbdd080f6ac/agithub/base.py#L30-L58
[15]:https://github.com/mozilla/agithub/blob/dbf7014e2504333c58a39153aa11bbbdd080f6ac/agithub/base.py#L60-L100
[16]:https://github.com/mozilla/agithub/blob/dbf7014e2504333c58a39153aa11bbbdd080f6ac/agithub/base.py#L102-L231
[17]:http://nnja.io
[18]:https://github.com/requests/requests
[19]:https://github.com/pallets/flask
[20]:https://us.pycon.org/2018/schedule/presentation/164/
[21]:https://us.pycon.org/2018/
