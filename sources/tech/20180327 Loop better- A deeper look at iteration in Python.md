Loop better: A deeper look at iteration in Python
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/pez-candy.png?itok=tRoOn_iy)
Python's `for` loops don't work the way `for` loops do in other languages. In this article we're going to dive into Python's `for` loops to take a look at how they work under the hood and why they work the way they do.

### Looping gotchas

We're going to start off our journey by taking a look at some "gotchas." After we've learned how looping works in Python, we'll take another look at these gotchas and explain what's going on.

#### Gotcha 1: Looping twice

Let's say we have a list of numbers and a generator that will give us the squares of those numbers:
```
>>> numbers = [1, 2, 3, 5, 7]

>>> squares = (n**2 for n in numbers)

```

We can pass our generator object to the `tuple` constructor to make a tuple out of it:
```
>>> tuple(squares)

(1, 4, 9, 25, 49)

```

If we then take the same generator object and pass it to the `sum` function, we might expect that we'd get the sum of these numbers, which would be 88.
```
>>> sum(squares)

0

```

Instead we get `0`.

#### Gotcha 2: Containment checking

Let's take the same list of numbers and the same generator object:
```
>>> numbers = [1, 2, 3, 5, 7]

>>> squares = (n**2 for n in numbers)

```

If we ask whether `9` is in our `squares` generator, Python will tell us that 9 is in `squares`. But if we ask the same question again, Python will tell us that 9 is not in `squares`.
```
>>> 9 in squares

True

>>> 9 in squares

False

```

We asked the same question twice and Python gave us two different answers.

#### Gotcha 3: Unpacking

This dictionary has two key-value pairs:
```
>>> counts = {'apples': 2, 'oranges': 1}

```

Let's unpack this dictionary using multiple assignment:
```
>>> x, y = counts

```

You might expect that when unpacking this dictionary, we'll get key-value pairs or maybe we'll get an error.

But unpacking dictionaries doesn't raise errors and it doesn't return key-value pairs. When you unpack dictionaries you get keys:
```
>>> x

'apples'

```

### Review: Python's _for_ loop

We'll come back to these gotchas after we've learned a bit about the logic that powers these Python snippets.

Python doesn't have traditional `for` loops. To explain what I mean, let's take a look at a `for` loop in another programming language.

This is a traditional C-style `for` loop written in JavaScript:
```
let numbers = [1, 2, 3, 5, 7];

for (let i = 0; i < numbers.length; i += 1) {

    print(numbers[i])

}

```

JavaScript, C, C++, Java, PHP, and a whole bunch of other programming languages all have this kind of `for` loop. But Python **does not**.

Python **does not** have traditional C-style `for` loops. We do have something that we _call_ a `for` loop in Python, but it works like a [foreach loop][1].

This is Python's flavor of `for` loop:
```
numbers = [1, 2, 3, 5, 7]

for n in numbers:

    print(n)

```

Unlike traditional C-style `for` loops, Python's `for` loops don't have index variables. There's no index initializing, bounds checking, or index incrementing. Python's `for` loops do _all the work_ of looping over our `numbers` list for us.

So while we do have `for` loops in Python, we do not have have traditional C-style `for` loops. The thing that _we_ call a for loop works very differently.

### Definitions: Iterables and sequences

Now that we've addressed the index-free `for` loop in our Python room, let's get some definitions out of the way.

An **iterable** is anything you can loop over with a `for` loop in Python. Iterables can be looped over, and anything that can be looped over is an iterable.
```
for item in some_iterable:

    print(item)

```

Sequences are a very common type of iterable. Lists, tuples, and strings are all sequences.
```
>>> numbers = [1, 2, 3, 5, 7]

>>> coordinates = (4, 5, 7)

>>> words = "hello there"

```

Sequences are iterables that have a specific set of features. They can be indexed starting from `0` and ending at one less than the length of the sequence, they have a length, and they can be sliced. Lists, tuples, strings, and all other sequences work this way.
```
>>> numbers[0]

1

>>> coordinates[2]

7

>>> words[4]

'o'

```

Lots of things in Python are iterables, but not all iterables are sequences. Sets, dictionaries, files, and generators are all iterables but none of these things are sequences.
```
>>> my_set = {1, 2, 3}

>>> my_dict = {'k1': 'v1', 'k2': 'v2'}

>>> my_file = open('some_file.txt')

>>> squares = (n**2 for n in my_set)

```

So anything that can be looped over with a `for` loop is an iterable, and sequences are one type of iterable, but Python has many other kinds of iterables as well.

### Python's _for_ loops don't use indexes

You might think that under the hood Python's `for` loops use indexes to loop. Here we're manually looping over an iterable using a `while` loop and indexes:
```
numbers = [1, 2, 3, 5, 7]

i = 0

while i < len(numbers):

    print(numbers[i])

    i += 1

```

This works for lists, but it won't work everything. This way of looping **only works for sequences**.

If we try to manually loop over a set using indexes, we'll get an error:
```
>>> fruits = {'lemon', 'apple', 'orange', 'watermelon'}

>>> i = 0

>>> while i < len(fruits):

...     print(fruits[i])

...     i += 1

...

Traceback (most recent call last):

File "<stdin>", line 2, in <module>

TypeError: 'set' object does not support indexing

```

Sets are not sequences, so they don't support indexing.

We cannot manually loop over every iterable in Python by using indexes. This simply won't work for iterables that aren't sequences.

### Iterators power _for_ loops

So we've seen that Python's `for` loops must not be using indexes under the hood. Instead, Python's `for` loops use **iterators**.

Iterators are the things that power iterables. You can get an iterator from any iterable. And you can use an iterator to manually loop over the iterable it came from.

Let's take a look at how that works.

Here are three iterables: a set, a tuple, and a string.
```
>>> numbers = {1, 2, 3, 5, 7}

>>> coordinates = (4, 5, 7)

>>> words = "hello there"

```

We can ask each of these iterables for an iterator using Python's built-in `iter` function. Passing an iterable to the `iter` function will always give us back an iterator, no matter what type of iterable we're working with.
```
>>> iter(numbers)

<set_iterator object at 0x7f2b9271c860>

>>> iter(coordinates)

<tuple_iterator object at 0x7f2b9271ce80>

>>> iter(words)

<str_iterator object at 0x7f2b9271c860>

```

Once we have an iterator, the one thing we can do with it is get its next item by passing it to the built-in `next` function.
```
>>> numbers = [1, 2, 3]

>>> my_iterator = iter(numbers)

>>> next(my_iterator)

1

>>> next(my_iterator)

2

```

Iterators are stateful, meaning once you've consumed an item from them, it's gone.

If you ask for the `next` item from an iterator and there are no more items, you'll get a `StopIteration` exception:
```
>>> next(my_iterator)

3

>>> next(my_iterator)

Traceback (most recent call last):

  File "<stdin>", line 1, in <module>

StopIteration

```

So you can get an iterator from every iterable. The only thing you can do with iterators is ask them for their next item using the `next` function. And if you pass them to `next` but they don't have a next item, a `StopIteration` exception will be raised.

You can think of iterators as Pez dispensers that cannot be reloaded. You can take Pez out, but once a Pez is removed it can't be put back, and once the dispenser is empty, it's useless.

### Looping without a _for_ loop

Now that we've learned about iterators and the `iter` and `next` functions, we'll try to manually loop over an iterable without using a `for` loop.

We'll do so by attempting to turn this `for` loop into a `while` loop:
```
def funky_for_loop(iterable, action_to_do):

    for item in iterable:

        action_to_do(item)

```

To do this we'll:

  1. Get an iterator from the given iterable
  2. Repeatedly get the next item from the iterator
  3. Execute the body of the `for` loop if we successfully got the next item
  4. Stop our loop if we got a `StopIteration` exception while getting the next item


```
def funky_for_loop(iterable, action_to_do):

    iterator = iter(iterable)

    done_looping = False

    while not done_looping:

        try:

            item = next(iterator)

        except StopIteration:

            done_looping = True

        else:

            action_to_do(item)

```

We've just reinvented a `for` loop by using a `while` loop and iterators.

The above code pretty much defines the way looping works under the hood in Python. If you understand the way the built-in `iter` and `next` functions work for looping over things, you understand how Python's `for` loops work.

In fact you'll understand a little bit more than just how `for` loops work in Python. All forms of looping over iterables work this way.

The **iterator protocol** is a fancy way of saying  "how looping over iterables works in Python." It's essentially the definition of the way the `iter` and `next` functions work in Python. All forms of iteration in Python are powered by the iterator protocol.

The iterator protocol is used by `for` loops (as we've already seen):
```
for n in numbers:

    print(n)

```

Multiple assignment also uses the iterator protocol:
```
x, y, z = coordinates

```

Star expressions use the iterator protocol:
```
a, b, *rest = numbers

print(*numbers)

```

And many built-in functions rely on the iterator protocol:
```
unique_numbers = set(numbers)

```

Anything in Python that works with an iterable probably uses the iterator protocol in some way. Anytime you're looping over an iterable in Python, you're relying on the iterator protocol.

### Generators are iterators

So you might be thinking: Iterators seem cool, but they also just seem like an implementation detail and we, as users of Python, might not need to care about them.

I have news for you: It's very common to work directly with iterators in Python.

The `squares` object here is a generator:
```
>>> numbers = [1, 2, 3]

>>> squares = (n**2 for n in numbers)

```

And generators are iterators, meaning you can call `next` on a generator to get its next item:
```
>>> next(squares)

1

>>> next(squares)

4

```

But if you've ever used a generator before, you probably know that you can also loop over generators:
```
>>> squares = (n**2 for n in numbers)

>>> for n in squares:

...     print(n)

...

1

4

9

```

If you can loop over something in Python, it's an **iterable**.

So **generators are iterators** , but generators are also iterables. What's going on here?

### I lied to you

So when I explained how iterators worked earlier, I skipped over an important detail about them.

**Iterators are iterables.**

I'll say that again: Every iterator in Python is also an iterable, which means you can loop over iterators.

Because iterators are also iterables, you can get an iterator from an iterator using the built-in `iter` function:
```
>>> numbers = [1, 2, 3]

>>> iterator1 = iter(numbers)

>>> iterator2 = iter(iterator1)

```

Remember that iterables give us iterators when we call `iter` on them.

When we call `iter` on an iterator it will always give us itself back:
```
>>> iterator1 is iterator2

True

```

Iterators are iterables and all iterators are their own iterators.
```
def is_iterator(iterable):

    return iter(iterable) is iterable

```

Confused yet?

Let's recap these terms.

  * An iter **able** is something you're able to iterate over
  * An iter **ator** is the agent that actually does the iterating over an iterable



Additionally, in Python iterators are also iterables and they act as their own iterators.

So iterators are iterables, but they don't have the variety of features that some iterables have.

Iterators have no length and they can't be indexed:
```
>>> numbers = [1, 2, 3, 5, 7]

>>> iterator = iter(numbers)

>>> len(iterator)

TypeError: object of type 'list_iterator' has no len()

>>> iterator[0]

TypeError: 'list_iterator' object is not subscriptable

```

From our perspective as Python programmers, the only useful things you can do with an iterator are to pass it to the built-in `next` function or to loop over it:
```
>>> next(iterator)

1

>>> list(iterator)

[2, 3, 5, 7]

```

And if we loop over an iterator a second time, we'll get nothing back:
```
>>> list(iterator)

[]

```

You can think of iterators as **lazy iterables** that are **single-use** , meaning they can be looped over one time only.

As you can see in the truth table below, iterables are not always iterators but iterators are always iterables:

Object Iterable? Iterator? Iterable ✔️ ❓ Iterator ✔️ ✔️ Generator ✔️ ✔️ List ✔️ ❌

### The iterator protocol in full

Let's define how iterators work from Python's perspective.

Iterables can be passed to the `iter` function to get an iterator for them.

Iterators:

  * Can be passed to the `next` function, which will give their next item or raise a `StopIteration` exception if there are no more items
  * Can be passed to the `iter` function and will return themselves back



The inverse of these statements also holds true:

  * Anything that can be passed to `iter` without a `TypeError` is an iterable
  * Anything that can be passed to `next` without a `TypeError` is an iterator
  * Anything that returns itself when passed to `iter` is an iterator



That's the iterator protocol in Python.

### Iterators enable laziness

Iterators allow us to both work with and create **lazy iterables** that don't do any work until we ask them for their next item. Because we can create lazy iterables, we can make infinitely long iterables. And we can create iterables that are conservative with system resources, can save us memory, and can save us CPU time.

### Iterators are everywhere

You've already seen lots of iterators in Python. I've already mentioned that generators are iterators. Many of Python's built-in classes are iterators also. For example Python's `enumerate` and `reversed` objects are iterators.
```
>>> letters = ['a', 'b', 'c']

>>> e = enumerate(letters)

>>> e

<enumerate object at 0x7f112b0e6510>

>>> next(e)

(0, 'a')

```

In Python 3, `zip`, `map`, and `filter` objects are iterators too.
```
>>> numbers = [1, 2, 3, 5, 7]

>>> letters = ['a', 'b', 'c']

>>> z = zip(numbers, letters)

>>> z

<zip object at 0x7f112cc6ce48>

>>> next(z)

(1, 'a')

```

And file objects in Python are iterators also.
```
>>> next(open('hello.txt'))

'hello world\n'

```

There are lots of iterators built into Python, in the standard library, and in third-party Python libraries. These iterators all act like lazy iterables by delaying work until the moment you ask them for their next item.

### Creating your own iterator

It's useful to know that you're already using iterators, but I'd like you to also know that you can create your own iterators and your own lazy iterables.

This class makes an iterator that accepts an iterable of numbers and provides squares of each of the numbers as it's looped over.
```
class square_all:

    def __init__(self, numbers):

        self.numbers = iter(numbers)

    def __next__(self):

        return next(self.numbers) * 2

    def __iter__(self):

        return self

```

But no work will be done until we start looping over an instance of this class.

Here we have an infinitely long iterable `count` and you can see that `square_all` accepts `count` without fully looping over this infinitely long iterable:
```
>>> from itertools import count

>>> numbers = count(5)

>>> squares = square_all(numbers)

>>> next(squares)

25

>>> next(squares)

36

```

This iterator class works, but we don't usually make iterators this way. Usually when we want to make a custom iterator, we make a generator function:
```
def square_all(numbers):

    for n in numbers:

        yield n**2

```

This generator function is equivalent to the class we made above, and it works essentially the same way.

That `yield` statement probably seems magical, but it is very powerful: `yield` allows us to put our generator function on pause between calls from the `next` function. The `yield` statement is the thing that separates generator functions from regular functions.

Another way we could implement this same iterator is with a generator expression.
```
def square_all(numbers):

    return (n**2 for n in numbers)

```

This does the same thing as our generator function, but it uses a syntax that looks [like a list comprehension][2]. If you need to make a lazy iterable in your code, think of iterators and consider making a generator function or a generator expression.

### How iterators can improve your code

Once you've embraced the idea of using lazy iterables in your code, you'll find that there are lots of possibilities for discovering or creating helper functions that assist you in looping over iterables and processing data.

#### Laziness and summing

This is a `for` loop that sums up all billable hours in a Django queryset:
```
hours_worked = 0

for event in events:

    if event.is_billable():

        hours_worked += event.duration

```

Here is code that does the same thing by using a generator expression for lazy evaluation:
```
billable_times = (

    event.duration

    for event in events

    if event.is_billable()

)



hours_worked = sum(billable_times)

```

Notice that the shape of our code has changed dramatically.

Turning our billable times into a lazy iterable has allowed us to name something (`billable_times`) that was previously unnamed. This has also allowed us to use the `sum` function. We couldn't have used `sum` before because we didn't even have an iterable to pass to it. Iterators allow you to fundamentally change the way you structure your code.

#### Laziness and breaking out of loops

This code prints out the first 10 lines of a log file:
```
for i, line in enumerate(log_file):

    if i >= 10:

        break

    print(line)

```

This code does the same thing, but we're using the `itertools.islice` function to lazily grab the first 10 lines of our file as we loop:
```
from itertools import islice



first_ten_lines = islice(log_file, 10)

for line in first_ten_lines:

    print(line)

```

The `first_ten_lines` variable we've made is an iterator. Again, using an iterator allowed us to give a name to something (`first_ten_lines`) that was previously unnamed. Naming things can make our code more descriptive and more readable.

As a bonus, we also removed the need for a `break` statement in our loop because the `islice` utility handles the breaking for us.

You can find many more iteration helper functions in [itertools][3] in the standard library as well as in third-party libraries such as [boltons][4] and [more-itertools][5].

#### Creating your own iteration helpers

You can find helper functions for looping in the standard library and in third-party libraries, but you can also make your own!

This code makes a list of the differences between consecutive values in a sequence.
```
current = readings[0]

for next_item in readings[1:]:

    differences.append(next_item - current)

    current = next_item

```

Notice that this code has an extra variable that we need to assign each time we loop. Also note that this code works only with things we can slice, like sequences. If `readings` were a generator, a zip object, or any other type of iterator, this code would fail.

Let's write a helper function to fix our code.

This is a generator function that gives us the current item and the item following it for every item in a given iterable:
```
def with_next(iterable):

    """Yield (current, next_item) tuples for each item in iterable."""

    iterator = iter(iterable)

    current = next(iterator)

    for next_item in iterator:

        yield current, next_item

        current = next_item

```

We're manually getting an iterator from our iterable, calling `next` on it to grab the first item, then looping over our iterator to get all subsequent items, keeping track of our last item along the way. This function works not just with sequences, but with any type of iterable.

This is the same code as before, but we're using our helper function instead of manually keeping track of `next_item`:
```
differences = []

for current, next_item in with_next(readings):

    differences.append(next_item - current)

```

Notice that this code doesn't have awkward assignments to `next_item` hanging around our loop. The `with_next` generator function handles the work of keeping track of `next_item` for us.

Also note that this code has been compacted enough that we could even [copy-paste our way into a list comprehension][2] if we wanted to.
```
differences = [

    (next_item - current)

    for current, next_item in with_next(readings)

]

```

### Looping gotchas revisited

Now we're ready to jump back to those odd examples we saw earlier and try to figure out what was going on.

#### Gotcha 1: Exhausting an iterator

Here we have a generator object, `squares`:
```
>>> numbers = [1, 2, 3, 5, 7]

>>> squares = (n**2 for n in numbers)

```

If we pass this generator to the `tuple` constructor, we'll get a tuple of its items back:
```
>>> numbers = [1, 2, 3, 5, 7]

>>> squares = (n**2 for n in numbers)

>>> tuple(squares)

(1, 4, 9, 25, 49)

```

If we then try to compute the `sum` of the numbers in this generator, we'll get `0`:
```
>>> sum(squares)

0

```

This generator is now empty: we've exhausted it. If we try to make a tuple out of it again, we'll get an empty tuple:
```
>>> tuple(squares)

()

```

Generators are iterators. And iterators are single-use iterables. They're like Hello Kitty Pez dispensers that cannot be reloaded.

#### Gotcha 2: Partially consuming an iterator

Again we have a generator object, `squares`:
```
>>> numbers = [1, 2, 3, 5, 7]

>>> squares = (n**2 for n in numbers)

```

If we ask whether `9` is in this `squares` generator, we'll get `True`:
```
>>> 9 in squares

True

```

But if we ask the same question again, we'll get `False`:
```
>>> 9 in squares

False

```

When we ask whether `9` is in this generator, Python has to loop over this generator to find `9`. If we kept looping over it after checking for `9`, we'll only get the last two numbers because we've already consumed the numbers before this point:
```
>>> numbers = [1, 2, 3, 5, 7]

>>> squares = (n**2 for n in numbers)

>>> 9 in squares

True

>>> list(squares)

[25, 49]

```

Asking whether something is contained in an iterator will partially consume the iterator. There is no way to know whether something is in an iterator without starting to loop over it.

#### Gotcha 3: Unpacking is iteration

When you loop over dictionaries you get keys:
```
>>> counts = {'apples': 2, 'oranges': 1}

>>> for key in counts:

...     print(key)

...

apples

oranges

```

You also get keys when you unpack a dictionary:
```
>>> x, y = counts

>>> x, y

('apples', 'oranges')

```

Looping relies on the iterator protocol. Iterable unpacking also relies on the iterator protocol. Unpacking a dictionary is really the same as looping over the dictionary. Both use the iterator protocol, so you get the same result in both cases.

### Recap and related resources

Sequences are iterables, but not all iterables are sequences. When someone says the word "iterable," you can only assume they mean "something that you can iterate over." Don't assume iterables can be looped over twice, asked for their length, or indexed.

Iterators are the most rudimentary form of iterables in Python. If you'd like to make a lazy iterable in your code, think of iterators and consider making a generator function or a generator expression.

And finally, remember that every type of iteration in Python relies on the iterator protocol, so understanding the iterator protocol is the key to understanding quite a bit about looping in Python in general.

Here are related articles and videos I recommend:

This article is based on the Loop Better talk the author gave last year at [DjangoCon AU][6], [PyGotham][7], and [North Bay Python][8]. For more content like this, attend [PYCON][9], which will be held May 9-17, 2018, in Columbus, Ohio.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/loop-better-deeper-look-iteration-python

作者：[Trey Hunner][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/treyhunner
[1]:https://en.wikipedia.org/wiki/Foreach_loop
[2]:http://treyhunner.com/2015/12/python-list-comprehensions-now-in-color/
[3]:https://docs.python.org/3/library/itertools.html
[4]:https://boltons.readthedocs.io
[5]:https://more-itertools.readthedocs.io
[6]:https://www.youtube.com/watch?v=JYuE8ZiDPl4
[7]:https://www.youtube.com/watch?v=Wd7vcuiMhxU
[8]:https://www.youtube.com/watch?v=V2PkkMS2Ack
[9]:https://us.pycon.org/2018/
