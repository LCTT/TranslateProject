translating by Flowsnow

Getting started with functional programming in Python using the toolz library
======

The toolz library allows you to manipulate functions, making it easier to understand and test code.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy)

In the second of a two-part series, we continue to explore how we can import ideas from functional programming methodology into Python to have the best of both worlds.

In the previous post, we covered [immutable data structures][1]. Those allow us to write "pure" functions, or functions that have no side effects, merely accepting some arguments and returning a result while maintaining decent performance.

In this post, we build on that using the `toolz` library. This library has functions that manipulate such functions, and they work especially well with pure functions. In the functional programming world, these are often referred to as "higher-order functions" since they take functions as arguments and return functions as results.

Let's start with this:

```
def add_one_word(words, word):
    return words.set(words.get(word, 0) + 1)
```

This function assumes that its first argument is an immutable dict-like object, and it returns a new dict-like object with the relevant place incremented: It's a simple frequency counter.

However, it is useful only if we apply it to a stream of words and reduce. We have access to a reducer in the built-in module `functools`. `functools.reduce(function, stream, initializer)`.

We want a function that, applied to a stream, will return a frequency count.

We start by using `toolz.curry`:

```
add_all_words = curry(functools.reduce, add_one_word)
```

With this version, we will need to supply the initializer. However, we can't just add `pyrsistent.m` to the `curry`; it is in the wrong order.

```
add_all_words_flipped = flip(add_all_words)
```

The `flip` higher-level function returns a function that calls the original, with arguments flipped.

```
get_all_words = add_all_words_flipped(pyrsistent.m())
```

We take advantage of the fact that `flip` auto-curries its argument to give it a starting value: an empty dictionary.

Now we can do `get_all_words(word_stream)` and get a frequency dictionary. However, how do we get a word stream? Python files are by line streams.

```
def to_words(lines):
    for line in lines:
        yield from line.split()
```

After testing each function by itself, we can combine them:

```
words_from_file = toolz.compose(get_all_words, to_words)
```

In this case, the composition being of just being two functions was straightforward to read: Apply `to_words` first, then apply `get_all_words` to the result. The prose, it seems, is in the inverse of the code.

This matters when we start taking composability seriously. It is sometimes possible to write the code as a sequence of units, test each individually, and finally, compose them all. If there are several elements, the ordering of compose can get tricky to understand.

The `toolz` library borrows from the Unix command line and uses `pipe` as a function that does the same, but in the reverse order.

```
words_from_file = toolz.pipe(to_words, get_all_words)
```

Now it reads more intuitively: Pipe the input into `to_words`, and pipe the results into `get_all_words`. On a command line, the equivalent would look like this:

```
$ cat files | to_words | get_all_words
```

The `toolz` library allows us to manipulate functions, slicing, dicing, and composing them to make our code easier to understand and to test.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/functional-programming-python-toolz

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/10/functional-programming-python-immutable-data-structures
