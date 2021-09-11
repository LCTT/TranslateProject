[#]: subject: "Quadratic algorithms are slow (and hashmaps are fast)"
[#]: via: "https://jvns.ca/blog/2021/09/10/hashmaps-make-things-fast/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Quadratic algorithms are slow (and hashmaps are fast)
======

Hello! I was talking to a friend yesterday who was studying for a programming interview and trying to learn some algorithms basics.

The topic of quadratic-time vs linear-time algorithms came up, I thought this would be fun to write about here because avoiding quadratic-time algorithms isn’t just important in interviews – it’s sometimes good to know about in real life too! I’ll explain what a “quadratic-time algorithm is” in a minute :)

here are the 3 things we’ll talk about:

  1. quadratic time functions are WAY WAY WAY slower than linear time functions
  2. sometimes you can make a quadratic algorithm into a linear algorithm by using a hashmap
  3. this is because hashmaps lookups are very fast (instant!)



I’m going to try to keep the math jargon to a minimum and focus on real code examples and how fast/slow they are.

### our problem: intersect two lists

Let’s talk about a simple interview-style problem: getting the intersection of 2 lists of numbers. For example, `intersect([1,2,3], [2,4,5])` should return `[2]`.

This problem is also somewhat realistic – you could imagine having a real program where you need to take the intersection of 2 lists of IDs.

### the “obvious” solution:

Let’s write some code to take the intersection of 2 lists. Here’s a program that does it, called `quadratic.py`.

```
import sys

# the actual code
def intersection(list1, list2):
    result = []
    for x in list1:
        for y in list2:
            if x == y:
                result.append(y)
    return result

# some boilerplate so that we can run it from the command line on lists of
# different sizes
def run(n):
    # make 2 lists of n+1 elements
    list1 = list(range(3, n)) + [2]
    list2 = list(range(n+1, 2*n)) + [2]
    # intersect them and print out the result
    print(list(intersection(list1, list2)))

# Run with the program's first command line argument
run(int(sys.argv[1]))
```

The reason it’s called `quadratic.py` is that if `list1` and `list2` have size `n`, then the inner loop (`if x == y`) will run `n^2` times. And in math, functions like `x^2` are called “quadratic” functions.

### how slow is `quadratic.py`?

Let’s run this program with a bunch of lists of different lengths. The intersection of the two lists is always the same: `[2]`.

```
$ time python3 quadratic.py 10
[2]

real    0m0.037s
$ time python3 quadratic.py 100
[2]

real    0m0.053s
$ time python3 quadratic.py 1000
[2]

real    0m0.051s
$ time python3 quadratic.py 10000 # 10,000
[2]

real    0m1.661s
```

So far none of this is too bad – it’s still taking less than 2 seconds.

Then I ran it on two lists with 100,000 elements, and I had to wait a LONG time. Here’s the result:

```
$ time python3 quadratic.py 100000 # 100,000
[2]

real    2m41.059s
```

This is very slow! It’s 160 seconds, which is almost exactly 100x longer than it did to run on 10,000 elements (which was 1.6 seconds). So we can see that after a certain point, every time we make the list 10x bigger, the program takes about 100x longer to run.

I didn’t try to run this program on 1,000,000 elements, because I knew it would take 100x longer again – probably about 3 hours. I don’t have time for that!

You can probably see now why quadratic time algorithms can be a problem – even this very simple program starts getting very slow pretty quickly.

### let’s write a fast version: `linear.py`

Okay, so let’s write a fast version of the program. First I’ll show you the program, then I’ll explain it.

```
import sys

# the actual algorithm
def intersection(list1, list2):
    set1 = set(list1) # this is a hash set
    result = []
    for y in list2:
        if y in set1:
            result.append(y)
    return result

# some boilerplate so that we can run it from the command line on lists of
# different sizes
def run(n):
    # make 2 lists of n+1 elements
    list1 = range(3, n) + [2]
    list2 = range(n+1, 2*n) + [2]
    # print out the intersection
    print(intersection(list1, list2))

run(int(sys.argv[1]))
```

(this isn’t the most idiomatic Python, but I wanted to write it without using too many python-isms so that people who don’t know Python could understand it more easily)

We’ve done 2 things differently here than our slow program:

  1. convert `list1` into a set called `set1`
  2. only use one for loop instead of two for loops



### let’s see how fast this `linear.py` program is

Before we talk about _why_ this program is fast, let’s first prove that it’s fast by running it on some big lists. Here it is running on lists of size 10 to 10,000,000. (remember that our original program started getting SUPER slow when run on 100,000 elements)

```
$ time python3 linear.py 100
[2]

real    0m0.056s
$ time python3 linear.py 1000
[2]

real    0m0.036s
$ time python3 linear.py 10000 # 10,000
[2]

real    0m0.028s
$ time python3 linear.py 100000 # 100,000
[2]

real    0m0.048s <-- quadratic.py took 2 minutes in this case! we're doing it in 0.04 seconds now!!! so fast!
$ time python3 linear.py 1000000 # 1,000,000
[2]

real    0m0.178s
$ time python3 linear.py 10000000 # 10,000,000
[2]

real    0m1.560s
```

### running `linear.py` on an extremely big list

If we try to run it on a very very big list (10 billion / 10,000,000,000 elements), then actually we run into a different problem: it’s _fast_ enough (that list is only 100x bigger than the list that took 4.2 seconds, so we could probably do it in 420 seconds), but my computer doesn’t have enough memory to store all of the elements of the list and so the program crashes before it gets there.

```
$ time python3 linear.py 10000000000
Traceback (most recent call last):
  File "/home/bork/work/homepage/linear.py", line 18, in <module>
    run(int(sys.argv[1]))
  File "/home/bork/work/homepage/linear.py", line 13, in run
    list1 = [1] * n + [2]
MemoryError

real    0m0.090s
user    0m0.034s
sys 0m0.018s
```

We’re not talking about memory usage in this blog post though, so let’s ignore that.

### okay, why is `linear.py` fast?

Now I’ll try to explain why `linear.py` is fast.

Here’s the code again:

```
def intersection(list1, list2):
    set1 = set(list1) # this is a hash set
    result = []
    for y in list2:
        if y in set1:
            result.append(y)
    return result
```

Let’s say that `list1` and `list2` are both lists of about 10,000,000 different elements. That’s kind of a lot of elements!

So why is this able to run so fast? HASHMAPS!!!

### hashmap lookups are instant (“constant time”)

Let’s look at this if statement from our fast program:

```
if y in set1:
    result.append(y)
```

You might think that this check – `if y in set1` – would be slower if the `set1` contains 10 million elements than it is if `set1` contains 1000 elements. But it’s not! It always takes basically the same amount of time (SUPER FAST), no matter how big `set1` gets.

This is because `set1` is a hash set, which is a type of hashmap/hashtable which only has keys and no values.

I’m not going to explain _why_ hashmap lookups are instant in this post, but the amazing Vaidehi Joshi’s [basecs][1] series has explanations of [hash tables][2] and [hash functions][3] which talk about it.

### accidentally quadratic: real life quadratic algorithms!

This issue that we saw where quadratic time algorithms are really slow is actually a problem that shows up in real life – Nelson Elhage has a great blog called [accidentally quadratic][4] with stories about performance problems caused by code that accidentally ran in quadratic time.

### quadratic time algorithms can kind of sneak up on you

The weird thing about quadratic time algorithms is that when you run them on a small number of elements (like 1000), it doesn’t seem so bad! It’s not that slow! But then if you throw 1,000,000 elements at it, it can really take hours to run.

So I think it’s worth being broadly aware of them, so you can avoid writing them by accident. Especially if there’s an easy way to write a linear-time algorithm instead (like using a hashmap).

### hashmaps always feel a little magical to me

Hashmaps aren’t magic of course (you can learn the math behind why hashmap lookups are instant! it’s cool!), but it always _feels_ a little magical to me, and every time I use hashmaps in a program to speed things up it makes me happy :)

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/09/10/hashmaps-make-things-fast/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://medium.com/basecs
[2]: https://medium.com/basecs/taking-hash-tables-off-the-shelf-139cbf4752f0
[3]: https://medium.com/basecs/hashing-out-hash-functions-ea5dd8beb4dd
[4]: https://accidentallyquadratic.tumblr.com/
