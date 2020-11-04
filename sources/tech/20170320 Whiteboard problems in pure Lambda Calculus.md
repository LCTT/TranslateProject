[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Whiteboard problems in pure Lambda Calculus)
[#]: via: (https://www.jtolio.com/2017/03/whiteboard-problems-in-pure-lambda-calculus)
[#]: author: (jtolio.com https://www.jtolio.com/)

Whiteboard problems in pure Lambda Calculus
======

My team at [Vivint][1], the [Space Monkey][2] group, stopped doing whiteboard interviews a while ago. We certainly used to do them, but we’ve transitioned to homework problems or actually just hiring a candidate as a short term contractor for a day or two to solve real work problems and see how that goes. Whiteboard interviews are kind of like [Festivus][3] but in a bad way: you get the feats of strength and then the airing of grievances. Unfortunately, modern programming is nothing like writing code in front of a roomful of strangers with only a whiteboard and a marker, so it’s probably not best to optimize for that.

Nonetheless, [Kyle][4]’s recent (wonderful, amazing) post titled [acing the technical interview][5] got me thinking about fun ways to approach whiteboard problems as an interviewee. Kyle’s [Church-encodings][6] made me wonder how many “standard” whiteboard problems you could solve in pure lambda calculus. If this isn’t seen as a feat of strength by your interviewers, there will certainly be some airing of grievances.

➡️️ **Update**: I’ve made a lambda calculus web playground so you can run lambda calculus right in your browser! I’ve gone through and made links to examples in this post with it. Check it out at <https://jtolio.github.io/sheepda/>

### Lambda calculus

Wait, what is lambda calculus? Did I learn that in high school?

Big-C “Calculus” of course usually refers to derivatives, integrals, Taylor series, etc. You might have learned about Calculus in high school, but this isn’t that.

More generally, a little-c “calculus” is really just any system of calculation. The [lambda calculus][7] is essentially a formalization of the smallest set of primitives needed to make a completely [Turing-complete][8] programming language. Expressions in the language can only be one of three things.

  * An expression can define a function that takes exactly one argument (no more, no less) and then has another expression as the body.
  * An expression can call a function by applying two subexpressions.
  * An expression can reference a variable.



Here is the entire grammar:

```
<expr> ::= <variable>
         | `λ` <variable> `.` <expr>
         | `(` <expr> <expr> `)`
```

That’s it. There’s nothing else you can do. There are no numbers, strings, booleans, pairs, structs, anything. Every value is a function that takes one argument. All variables refer to these functions, and all functions can do is return another function, either directly, or by calling yet another function. There’s nothing else to help you.

To be honest, it’s a little surprising that this is even Turing-complete. How do you do branches or loops or recursion? This seems too simple to work, right?

A common whiteboard problem is the [fizz buzz problem][9]. The goal is to write a function that prints out all the numbers from 0 to 100, but instead of printing numbers divisible by 3 it prints “fizz”, and instead of printing numbers divisible by 5 it prints “buzz”, and in the case of both it prints “fizzbuzz”. It’s a simple toy problem but it’s touted as a good whiteboard problem because evidently many self-proclaimed programmers can’t solve it. Maybe part of that is cause whiteboard problems suck? I dunno.

Anyway, here’s fizz buzz in pure lambda calculus:

```
(λU.(λY.(λvoid.(λ0.(λsucc.(λ+.(λ*.(λ1.(λ2.(λ3.(λ4.(λ5.(λ6.(λ7.(λ8.(λ9.(λ10.(λnum.(λtrue.(λfalse.(λif.(λnot.(λand.(λor.(λmake-pair.(λpair-first.(λpair-second.(λzero?.(λpred.(λ-.(λeq?.(λ/.(λ%.(λnil.(λnil?.(λcons.(λcar.(λcdr.(λdo2.(λdo3.(λdo4.(λfor.(λprint-byte.(λprint-list.(λprint-newline.(λzero-byte.(λitoa.(λfizzmsg.(λbuzzmsg.(λfizzbuzzmsg.(λfizzbuzz.(fizzbuzz (((num 1) 0) 1)) λn.((for n) λi.((do2 (((if (zero? ((% i) 3))) λ_.(((if (zero? ((% i) 5))) λ_.(print-list fizzbuzzmsg)) λ_.(print-list fizzmsg))) λ_.(((if (zero? ((% i) 5))) λ_.(print-list buzzmsg)) λ_.(print-list (itoa i))))) (print-newline nil)))) ((cons (((num 0) 7) 0)) ((cons (((num 1) 0) 5)) ((cons (((num 1) 2) 2)) ((cons (((num 1) 2) 2)) ((cons (((num 0) 9) 8)) ((cons (((num 1) 1) 7)) ((cons (((num 1) 2) 2)) ((cons (((num 1) 2) 2)) nil))))))))) ((cons (((num 0) 6) 6)) ((cons (((num 1) 1) 7)) ((cons (((num 1) 2) 2)) ((cons (((num 1) 2) 2)) nil))))) ((cons (((num 0) 7) 0)) ((cons (((num 1) 0) 5)) ((cons (((num 1) 2) 2)) ((cons (((num 1) 2) 2)) nil))))) λn.(((Y λrecurse.λn.λresult.(((if (zero? n)) λ_.(((if (nil? result)) λ_.((cons zero-byte) nil)) λ_.result)) λ_.((recurse ((/ n) 10)) ((cons ((+ zero-byte) ((% n) 10))) result)))) n) nil)) (((num 0) 4) 8)) λ_.(print-byte (((num 0) 1) 0))) (Y λrecurse.λl.(((if (nil? l)) λ_.void) λ_.((do2 (print-byte (car l))) (recurse (cdr l)))))) PRINT_BYTE) λn.λf.((((Y λrecurse.λremaining.λcurrent.λf.(((if (zero? remaining)) λ_.void) λ_.((do2 (f current)) (((recurse (pred remaining)) (succ current)) f)))) n) 0) f)) λa.do3) λa.do2) λa.λb.b) λl.(pair-second (pair-second l))) λl.(pair-first (pair-second l))) λe.λl.((make-pair true) ((make-pair e) l))) λl.(not (pair-first l))) ((make-pair false) void)) λm.λn.((- m) ((* ((/ m) n)) n))) (Y λ/.λm.λn.(((if ((eq? m) n)) λ_.1) λ_.(((if (zero? ((- m) n))) λ_.0) λ_.((+ 1) ((/ ((- m) n)) n)))))) λm.λn.((and (zero? ((- m) n))) (zero? ((- n) m)))) λm.λn.((n pred) m)) λn.(((λn.λf.λx.(pair-second ((n λp.((make-pair (f (pair-first p))) (pair-first p))) ((make-pair x) x))) n) succ) 0)) λn.((n λ_.false) true)) λp.(p false)) λp.(p true)) λx.λy.λt.((t x) y)) λa.λb.((a true) b)) λa.λb.((a b) false)) λp.λt.λf.((p f) t)) λp.λa.λb.(((p a) b) void)) λt.λf.f) λt.λf.t) λa.λb.λc.((+ ((+ ((* ((* 10) 10)) a)) ((* 10) b))) c)) (succ 9)) (succ 8)) (succ 7)) (succ 6)) (succ 5)) (succ 4)) (succ 3)) (succ 2)) (succ 1)) (succ 0)) λm.λn.λx.(m (n x))) λm.λn.λf.λx.((((m succ) n) f) x)) λn.λf.λx.(f ((n f) x))) λf.λx.x) λx.(U U)) (U λh.λf.(f λx.(((h h) f) x)))) λf.(f f))
```

➡️️ [Try it out in your browser!][10]

(This program expects a function to be defined called `PRINT_BYTE` which takes a Church-encoded numeral, turns it into a byte, writes it to `stdout`, and then returns the same Church-encoded numeral. Expecting a function that has side-effects might arguably disqualify this from being pure, but it’s definitely arguable.)

Don’t be deceived! I said there were no native numbers or lists or control structures in lambda calculus and I meant it. `0`, `7`, `if`, and `+` are all _variables_ that represent _functions_ and have to be constructed before they can be used in the code block above.

### What? What’s happening here?

Okay let’s start over and build up to fizz buzz. We’re going to need a lot. We’re going to need to build up concepts of numbers, logic, and lists all from scratch. Ask your interviewers if they’re comfortable cause this might be a while.

Here is a basic lambda calculus function:

```
λx.x
```

This is the identity function and it is equivalent to the following Javascript:

```
function(x) { return x; }
```

It takes an argument and returns it! We can call the identity function with another value. Function calling in many languages looks like `f(x)`, but in lambda calculus, it looks like `(f x)`.

```
(λx.x y)
```

This will return `y`. Once again, here’s equivalent Javascript:

```
function(x) { return x; }(y)
```

Aside: If you’re already familiar with lambda calculus, my formulation of precedence is such that `(λx.x y)` is not the same as `λx.(x y)`. In my formulation, `(λx.x y)` calls the identity function `λx.x` with the argument `y`, and `λx.(x y)` is a function that applies its argument `x` to `y`. Perhaps not what you’re used to, but the parser was way more straightforward, and programming with it this way seems a bit more natural, believe it or not.

Okay, great. We can call functions. What if we want to pass more than one argument?

### Currying

Imagine the following Javascript function:

```
let s1 = function(f, x) { return f(x); }
```

We want to call it with two arguments, another function and a value, and we want the function to then be called on the value, and have its result returned. Can we do this while using only one argument?

[Currying][11] is a technique for dealing with this. Instead of taking two arguments, take the first argument and return another function that takes the second argument. Here’s the Javascript:

```
let s2 = function(f) {
  return function(x) {
    return f(x);
  }
};
```

Now, `s1(f, x)` is the same as `s2(f)(x)`. So the equivalent lambda calculus for `s2` is then

```
λf.λx.(f x)
```

Calling this function with `g` for `f` and `y` for `x` is like so:

```
((s2 g) y)
```

or

```
((λf.λx.(f x) g) y)
```

The equivalent Javascript here is:

```
function(f) {
  return function(x) {
    f(x)
  }
}(g)(y)
```

### Numbers

Since everything is a function, we might feel a little stuck with what to do about numbers. Luckily, [Alonzo Church][12] already figured it out for us! When you have a number, often what you want to do is represent how many times you might do something.

So let’s represent a number as how many times we’ll apply a function to a value. This is called a [Church numeral][13]. If we have `f` and `x`, `0` will mean we don’t call `f` at all, and just return `x`. `1` will mean we call `f` one time, `2` will mean we call `f` twice, and so on.

Here are some definitions! (N.B.: assignment isn’t actually part of lambda calculus, but it makes writing down definitions easier)

```
0 = λf.λx.x
```

Here, `0` takes a function `f`, a value `x`, and never calls `f`. It just returns `x`. `f` is called 0 times.

```
1 = λf.λx.(f x)
```

Like `0`, `1` takes `f` and `x`, but here it calls `f` exactly once. Let’s see how this continues for other numbers.

```
2 = λf.λx.(f (f x))
3 = λf.λx.(f (f (f x)))
4 = λf.λx.(f (f (f (f x))))
5 = λf.λx.(f (f (f (f (f x)))))
```

`5` is a function that takes `f`, `x`, and calls `f` 5 times!

Okay, this is convenient, but how are we going to do math on these numbers?

### Successor

Let’s make a _successor_ function that takes a number and returns a new number that calls `f` just one more time.

```
succ = λn.  λf.λx.(f ((n f) x))
```

`succ` is a function that takes a Church-encoded number, `n`. The spaces after `λn.` are ignored. I put them there to indicate that we expect to usually call `succ` with one argument, curried or no. `succ` then returns another Church-encoded number, `λf.λx.(f ((n f) x))`. What is it doing? Let’s break it down.

  * `((n f) x)` looks like that time we needed to call a function that took two “curried” arguments. So we’re calling `n`, which is a Church numeral, with two arguments, `f` and `x`. This is going to call `f` `n` times!
  * `(f ((n f) x))` This is calling `f` again, one more time, on the result of the previous value.



So does `succ` work? Let’s see what happens when we call `(succ 1)`. We should get the `2` we defined earlier!

```
   (succ 1)
-> (succ λf.λx.(f x))                   # resolve the variable 1
-> (λn.λf.λx.(f ((n f) x)) λf.λx.(f x)) # resolve the variable succ
-> λf.λx.(f ((λf.λx.(f x) f) x))        # call the outside function. replace n
                                        # with the argument

let's sidebar and simplify the subexpression
   (λf.λx.(f x) f)
-> λx.(f x)                             # call the function, replace f with f!

now we should be able to simplify the larger subexpression
   ((λf.λx.(f x) f) x)
-> (λx.(f x) x)                         # sidebar above
-> (f x)                                # call the function, replace x with x!

let's go back to the original now
   λf.λx.(f ((λf.λx.(f x) f) x))
-> λf.λx.(f (f x))                      # subexpression simplification above
```

and done! That last line is identical to the `2` we defined originally! It calls `f` twice.

### Math

Now that we have the successor function, if your interviewers haven’t checked out, tell them that fizz buzz isn’t too far away now; we have [Peano Arithmetic][14]! They can then check their interview bingo cards and see if they’ve increased their winnings.

No but for real, since we have the successor function, we can now easily do addition and multiplication, which we will need for fizz buzz.

First, recall that a number `n` is a function that takes another function `f` and an initial value `x` and applies `f` _n_ times. So if you have two numbers _m_ and _n_, what you want to do is apply `succ` to `m` _n_ times!

```
+ = λm.λn.((n succ) m)
```

Here, `+` is a variable. If it’s not a lambda expression or a function call, it’s a variable!

Multiplication is similar, but instead of applying `succ` to `m` _n_ times, we’re going to add `m` to `0` `n` times.

First, note that if `((+ m) n)` is adding `m` and `n`, then that means that `(+ m)` is a _function_ that adds `m` to its argument. So we want to apply the function `(+ m)` to `0` `n` times.

```
* = λm.λn.((n (+ m)) 0)
```

Yay! We have multiplication and addition now.

### Logic

We’re going to need booleans and if statements and logic tests and so on. So, let’s talk about booleans. Recall how with numbers, what we kind of wanted with a number `n` is to do something _n_ times. Similarly, what we want with booleans is to do one of two things, either/or, but not both. Alonzo Church to the rescue again.

Let’s have booleans be functions that take two arguments (curried of course), where the `true` boolean will return the first option, and the `false` boolean will return the second.

```
true  = λt.λf.t
false = λt.λf.f
```

So that we can demonstrate booleans, we’re going to define a simple sample function called `zero?` that returns `true` if a number `n` is zero, and `false` otherwise:

```
zero? = λn.((n λ_.false) true)
```

To explain: if we have a Church numeral for 0, it will call the first argument it gets called with 0 times and just return the second argument. In other words, 0 will just return the second argument and that’s it. Otherwise, any other number will call the first argument at least once. So, `zero?` will take `n` and give it a function that throws away its argument and always returns `false` whenever it’s called, and start it off with `true`. Only zero values will return `true`.

➡️️ [Try it out in your browser!][15]

We can now write an `if'` function to make use of these boolean values. `if'` will take a predicate value `p` (the boolean) and two options `a` and `b`.

```
if' = λp.λa.λb.((p a) b)
```

You can use it like this:

```
((if' (zero? n)
      (something-when-zero x))
      (something-when-not-zero y))
```

One thing that’s weird about this construction is that the interpreter is going to evaluate both branches (my lambda calculus interpreter is [eager][16] instead of [lazy][17]). Both `something-when-zero` and `something-when-not-zero` are going to be called to determine what to pass in to `if'`. To make it so that we don’t actually call the function in the branch we don’t want to run, let’s protect the logic in another function. We’ll name the argument to the function `_` to indicate that we want to just throw it away.

```
((if (zero? n)
     λ_. (something-when-zero x))
     λ_. (something-when-not-zero y))
```

This means we’re going to have to make a new `if` function that calls the correct branch with a throwaway argument, like `0` or something.

```
if = λp.λa.λb.(((p a) b) 0)
```

Okay, now we have booleans and `if`!

### Currying part deux

At this point, you might be getting sick of how calling something with multiple curried arguments involves all these extra parentheses. `((f a) b)` is annoying, can’t we just do `(f a b)`?

It’s not part of the strict grammar, but my interpreter makes this small concession. `(a b c)` will be expanded to `((a b) c)` by the parser. `(a b c d)` will be expanded to `(((a b) c) d)` by the parser, and so on.

So, for the rest of the post, for ease of explanation, I’m going to use this [syntax sugar][18]. Observe how using `if` changes:

```
(if (zero? n)
    λ_. (something-when-zero x)
    λ_. (something-when-not-zero y))
```

It’s a little better.

### More logic

Let’s talk about `and`, `or`, and `not`!

`and` returns true if and only if both `a` and `b` are true. Let’s define it!

```
and = λa.λb.
  (if (a)
      λ_. b
      λ_. false)
```

`or` returns true if `a` is true or if `b` is true:

```
or = λa.λb.
  (if (a)
      λ_. true
      λ_. b)
```

`not` just returns the opposite of whatever it was given:

```
not = λa.
  (if (a)
      λ_. false
      λ_. true)
```

It turns out these can be written a bit more simply, but they’re basically doing the same thing:

```
and = λa.λb.(a b false)
or = λa.λb.(a true b)
not = λp.λt.λf.(p f t)
```

➡️️ [Try it out in your browser!][19]

### Pairs!

Sometimes it’s nice to keep data together. Let’s make a little 2-tuple type! We want three functions. We want a function called `make-pair` that will take two arguments and return a “pair”, we want a function called `pair-first` that will return the first element of the pair, and we want a function called `pair-second` that will return the second element. How can we achieve this? You’re almost certainly in the interview room alone, but now’s the time to yell “Alonzo Church”!

```
make-pair = λx.λy. λa.(a x y)
```

`make-pair` is going to take two arguments, `x` and `y`, and they will be the elements of the pair. The pair itself is a function that takes an “accessor” `a` that will be given `x` and `y`. All `a` has to do is take the two arguments and return the one it wants.

Here is someone making a pair with variables `1` and `2`:

```
(make-pair 1 2)
```

This returns:

```
λa.(a 1 2)
```

There’s a pair! Now we just need to access the values inside.

Remember how `true` takes two arguments and returns the first one and `false` takes two arguments and returns the second one?

```
pair-first = λp.(p true)
pair-second = λp.(p false)
```

`pair-first` is going to take a pair `p` and give it `true` as the accessor `a`. `pair-second` is going to give the pair `false` as the accessor.

Voilà, you can now store 2-tuples of values and recover the data from them.

➡️️ [Try it out in your browser!][20]

### Lists!

We’re going to construct [linked lists][21]. Each list item needs two things: the value at the current position in the list and a reference to the rest of the list.

One additional caveat is we want to be able to identify an empty list, so we’re going to store whether or not the current value is the end of a list as well. In [LISP][22]-based programming languages, the end of the list is the special value `nil`, and checking if we’ve hit the end of the list is accomplished with the `nil?` predicate.

Because we want to distinguish `nil` from a list with a value, we’re going to store three things in each linked list item. Whether or not the list is empty, and if not, the value and the rest of the list. So we need a 3-tuple.

Once we have pairs, other-sized tuples are easy. For instance, a 3-tuple is just one pair with another pair inside for one of the slots.

For each list element, we’ll store:

```
[not-empty [value rest-of-list]]
```

As an example, a list element with a value of `1` would look like:

```
[true [1 remainder]]
```

whereas `nil` will look like

```
[false whatever]
```

That second part of `nil` just doesn’t matter.

First, let’s define `nil` and `nil?`:

```
nil = (make-pair false false)
nil? = λl. (not (pair-first l))
```

The important thing about `nil` is that the first element in the pair is `false`.

Now that we have an empty list, let’s define how to add something to the front of it. In LISP-based languages, the operation to _construct_ a new list element is called `cons`, so we’ll call this `cons`, too.

`cons` will take a value and an existing list and return a new list with the given value at the front of the list.

```
cons = λvalue.λlist.
  (make-pair true (make-pair value list))
```

`cons` is returning a pair where, unlike `nil`, the first element of the pair is `true`. This represents that there’s something in the list here. The second pair element is what we wanted in our linked list: the value at the current position, and a reference to the rest of the list.

So how do we access things in the list? Let’s define two functions called `head` and `tail`. `head` is going to return the value at the front of the list, and `tail` is going to return everything but the front of the list. In LISP-based languages, these functions are sometimes called `car` and `cdr` for surprisingly [esoteric reasons][23]. `head` and `tail` have undefined behavior here when called on `nil`, so let’s just assume `nil?` is false for the list and keep going.

```
head = λlist. (pair-first (pair-second list))
tail = λlist. (pair-second (pair-second list))
```

Both `head` and `tail` first get `(pair-second list)`, which returns the tuple that has the value and reference to the remainder. Then, they use either `pair-first` or `pair-second` to get the current value or the rest of the list.

Great, we have lists!

➡️️ [Try it out in your browser!][24]

### Recursion and loops

Let’s make a simple function that sums up a list of numbers.

```
sum = λlist.
  (if (nil? list)
      λ_. 0
      λ_. (+ (head list) (sum (tail list))))
```

If the list is empty, let’s return 0. If the list has an element, let’s add that element to the sum of the rest of the list. [Recursion][25] is a cornerstone tool of computer science, and being able to assume a solution to a subproblem to solve a problem is super neat!

Okay, except, this doesn’t work like this in lambda calculus. Remember how I said assignment wasn’t something that exists in lambda calculus? If you have:

```
x = y
<stuff>
```

This really means you have:

```
(λx.<stuff> y)
```

In the case of our sum definition, we have:

```
(λsum.
  <your-program>

 λlist.
  (if (nil? list)
      λ_. 0
      λ_. (+ (head list) (sum (tail list)))))
```

What that means is `sum` doesn’t have any access to itself. It can’t call itself like we’ve written, because when it tries to call `sum`, it’s undefined!

This is a pretty crushing blow, but it turns out there’s a mind bending and completely unexpected trick the universe has up its sleeve.

Assume we wrote `sum` so that it takes two arguments. A reference to something like `sum` we’ll call `helper` and then the list. If we could figure out how to solve the recursion problem, then we could use this `sum`. Let’s do that.

```
sum = λhelper.λlist.
  (if (nil? list)
      λ_. 0
      λ_. (+ (head list) (helper (tail list))))
```

But hey! When we call `sum`, we have a reference to `sum` then! Let’s just give `sum` itself before the list.

```
(sum sum list)
```

This seems promising, but unfortunately now the `helper` invocation inside of `sum` is broken. `helper` is just `sum` and `sum` expects a reference to itself. Let’s try again, changing the `helper` call:

```
sum = λhelper.λlist.
  (if (nil? list)
      λ_. 0
      λ_. (+ (head list) (helper helper (tail list))))

(sum sum list)
```

We did it! This actually works! We engineered recursion out of math! At no point does `sum` refer to itself inside of itself, and yet we managed to make a recursive function anyways!

➡️️ [Try it out in your browser!][26]

Despite the minor miracle we’ve just performed, we’ve now ruined how we program recursion to involve calling recursive functions with themselves. This isn’t the end of the world, but it’s a little annoying. Luckily for us, there’s a function that cleans this all right up called the [Y combinator][27].

The _Y combinator_ is probably now more famously known as [a startup incubator][28], or perhaps even more so as the domain name for one of the most popular sites that has a different name than its URL, [Hacker News][29], but fixed point combinators such as the Y combinator have had a longer history.

The Y combinator can be defined in different ways, but definition I’m using is:

```
Y = λf.(λx.(x x) λx.(f λy.((x x) y)))
```

You might consider reading more about how the Y combinator can be derived from an excellent tutorial such as [this one][30] or [this one][31].

Anyway, `Y` will make our original `sum` work as expected.

```
sum = (Y λhelper.λlist.
  (if (nil? list)
      λ_. 0
      λ_. (+ (head list) (helper (tail list)))))
```

We can now call `(sum list)` without any wacky doubling of the function name, either inside or outside of the function. Hooray!

➡️️ [Try it out in your browser!][32]

### More math

“Get ready to do more math! We now have enough building blocks to do subtraction, division, and modulo, which we’ll need for fizz buzz,” you tell the security guards that are approaching you.

Just like addition, before we define subtraction we’ll define a predecessor function. Unlike addition, the predecessor function `pred` is much more complicated than the successor function `succ`.

The basic idea is we’re going to create a pair to keep track of the previous value. We’ll start from zero and build up `n` but also drag the previous value such that at `n` we also have `n - 1`. Notably, this solution does not figure out how to deal with negative numbers. The predecessor of 0 will be 0, and negatives will have to be dealt with some other time and some other way.

First, we’ll make a helper function that takes a pair of numbers and returns a new pair where the first number in the old pair is the second number in the new pair, and the new first number is the successor of the old first number.

```
pred-helper = λpair.
  (make-pair (succ (pair-first pair)) (pair-first pair))
```

Make sense? If we call `pred-helper` on a pair `[0 0]`, the result will be `[1 0]`. If we call it on `[1 0]`, the result will be `[2 1]`. Essentially this helper slides older numbers off to the right.

Okay, so now we’re going to call `pred-helper` _n_ times, with a starting pair of `[0 0]`, and then get the _second_ value, which should be `n - 1` when we’re done, from the pair.

```
pred = λn.
  (pair-second (n pred-helper (make-pair 0 0)))
```

We can combine these two functions now for the full effect:

```
pred = λn.
  (pair-second
    (n
     λpair.(make-pair (succ (pair-first pair)) (pair-first pair))
     (make-pair 0 0)))
```

➡️️ [Try it out in your browser!][33]

Now that we have `pred`, subtraction is easy! To subtract `n` from `m`, we’re going to apply `pred` to `m` _n_ times.

```
- = λm.λn.(n pred m)
```

Keep in mind that if `n` is equal to _or greater than_ `m`, the result of `(- m n)` will be zero, since there are no negative numbers and the predecessor of `0` is `0`. This fact means we can implement some new logic tests. Let’s make `(ge? m n)` return `true` if `m` is greater than or equal to `n` and make `(le? m n)` return `true` if `m` is less than or equal to `n`.

```
ge? = λm.λn.(zero? (- n m))
le? = λm.λn.(zero? (- m n))
```

If we have greater-than-or-equal-to and less-than-or-equal-to, then we can make equal!

```
eq? = λm.λn.(and (ge? m n) (le? m n))
```

Now we have enough for integer division! The idea for integer division of `n` and `m` is we will keep count of the times we can subtract `m` from `n` without going past zero.

```
/ = (Y λ/.λm.λn.
  (if (eq? m n)
      λ_. 1
      λ_. (if (le? m n)
              λ_. 0
              λ_. (+ 1 (/ (- m n) n)))))
```

Once we have subtraction, multiplication, and integer division, we can create modulo.

```
% = λm.λn. (- m (* (/ m n) n))
```

➡️️ [Try it out in your browser!][34]

### Aside about performance

You might be wondering about performance at this point. Every time we subtract one from 100, we count up from 0 to 100 to generate 99. This effect compounds itself for division and modulo. The truth is that Church numerals and other encodings aren’t very performant! Just like how tapes in Turing machines aren’t a particularly efficient way to deal with data, Church encodings are most interesting from a theoretical perspective for proving facts about computation.

That doesn’t mean we can’t make things faster though!

Lambda calculus is purely functional and side-effect free, which means that all sorts of optimizations can applied. Functions can be aggressively memoized. In other words, once a specific function and its arguments have been computed, there’s no need to compute them ever again. The result of that function will always be the same anyways. Further, functions can be computed lazily and only if needed. What this means is if a branch of your program’s execution renders a result that’s never used, the compiler can decide to just not run that part of the program and end up with the exact same result.

[My interpreter][35] does have side effects, since programs written in it can cause the system to write output to the user via the special built-in function `PRINT_BYTE`. As a result, I didn’t choose lazy evaluation. The only optimization I chose was aggressive memoization for all functions that are side-effect free. The memoization still has room for improvement, but the result is much faster than a naive implementation.

### Output

“We’re rounding the corner on fizz buzz!” you shout at the receptionist as security drags you around the corner on the way to the door. “We just need to figure out how to communicate results to the user!”

Unfortunately, lambda calculus can’t communicate with your operating system kernel without some help, but a small concession is all we need. [Sheepda][35] provides a single built-in function `PRINT_BYTE`. `PRINT_BYTE` takes a number as its argument (a Church encoded numeral) and prints the corresponding byte to the configured output stream (usually `stdout`).

With `PRINT_BYTE`, we’re going to need to reference a number of different [ASCII bytes][36], so we should make writing numbers in code easier. Earlier we defined numbers 0 - 5, so let’s start and define numbers 6 - 10.

```
6 = (succ 5)
7 = (succ 6)
8 = (succ 7)
9 = (succ 8)
10 = (succ 9)
```

Now let’s define a helper to create three digit decimal numbers.

```
num = λa.λb.λc.(+ (+ (* (* 10 10) a) (* 10 b)) c)
```

The newline byte is decimal 10. Here’s a function to print newlines!

```
print-newline = λ_.(PRINT_BYTE (num 0 1 0))
```

### Doing multiple things

Now that we have this `PRINT_BYTE` function, we have functions that can cause side-effects. We want to call `PRINT_BYTE` but we don’t care about its return value. We need a way to call multiple functions in sequence.

What if we make a function that takes two arguments and throws away the first one again?

```
do2 = λ_.λx.x
```

Here’s a function to print every value in a list:

```
print-list = (Y λrecurse.λlist.
    (if (nil? list)
        λ_. 0
        λ_. (do2 (PRINT_BYTE (head list))
                 (recurse (tail list)))))
```

And here’s a function that works like a for loop. It calls `f` with every number from `0` to `n`. It uses a small helper function that continues to call itself until `i` is equal to `n`, and starts `i` off at `0`.

```
for = λn.λf.(
  (Y λrecurse.λi.
    (if (eq? i n)
        λ_. void
        λ_. (do2 (f i)
                 (recurse (succ i)))))
  0)
```

### Converting an integer to a string

The last thing we need to complete fizz buzz is a function that turns a number into a string of bytes to print. You might have noticed the `print-num` calls in some of the web-based examples above. We’re going to see how to make it! Writing this function is sometimes a whiteboard problem in its own right. In C, this function is called `itoa`, for integer to ASCII.

Here’s an example of how it works. Imagine the number we’re converting to bytes is `123`. We can get the `3` out by doing `(% 123 10)`, which will be `3`. Then we can divide by `10` to get `12`, and then start over. `(% 12 10)` is `2`. We’ll loop down until we hit zero.

Once we have a number, we can convert it to ASCII by adding the value of the `'0'` ASCII byte. Then we can make a list of ASCII bytes for use with `print-list`.

```
zero-char = (num 0 4 8)  # the ascii code for the byte that represents 0.

itoa = λn.(
  (Y λrecurse.λn.λresult.
    (if (zero? n)
        λ_. (if (nil? result)
                λ_. (cons zero-char nil)
                λ_. result)
        λ_. (recurse (/ n 10) (cons (+ zero-char (% n 10)) result))))
  n nil)

print-num = λn.(print-list (itoa n))
```

### Fizz buzz

“Here we go,” you shout at the building you just got kicked out of, “here’s how you do fizz buzz.”

First, we need to define three strings: “Fizz”, “Buzz”, and “Fizzbuzz”.

```
fizzmsg =     (cons (num 0 7 0)  # F
              (cons (num 1 0 5)  # i
              (cons (num 1 2 2)  # z
              (cons (num 1 2 2)  # z
              nil))))
buzzmsg =     (cons (num 0 6 6)  # B
              (cons (num 1 1 7)  # u
              (cons (num 1 2 2)  # z
              (cons (num 1 2 2)  # z
              nil))))
fizzbuzzmsg = (cons (num 0 7 0)  # F
              (cons (num 1 0 5)  # i
              (cons (num 1 2 2)  # z
              (cons (num 1 2 2)  # z
              (cons (num 0 9 8)  # b
              (cons (num 1 1 7)  # u
              (cons (num 1 2 2)  # z
              (cons (num 1 2 2)  # z
              nil))))))))
```

Okay, now let’s define a function that will run from 0 to `n` and output numbers, fizzes, and buzzes:

```
fizzbuzz = λn.
  (for n λi.
    (do2
      (if (zero? (% i 3))
          λ_. (if (zero? (% i 5))
                  λ_. (print-list fizzbuzzmsg)
                  λ_. (print-list fizzmsg))
          λ_. (if (zero? (% i 5))
                  λ_. (print-list buzzmsg)
                  λ_. (print-list (itoa i))))
      (print-newline 0)))
```

Let’s do the first 20!

```
(fizzbuzz (num 0 2 0))
```

➡️️ [Try it out in your browser!][37]

### Reverse a string

“ENCORE!” you shout to no one as the last cars pull out of the company parking lot. Everyone’s gone home but this is your last night before the restraining order goes through.

```
reverse-list = λlist.(
  (Y λrecurse.λold.λnew.
    (if (nil? old)
        λ_.new
        λ_.(recurse (tail old) (cons (head old) new))))
  list nil)
```

➡️️ [Try it out in your browser!][38]

### Sheepda

As I mentioned, I wrote a lambda calculus interpreter called [Sheepda][35] for playing around. By itself it’s pretty interesting if you’re interested in learning more about how to write programming language interpreters. Lambda calculus is as simple of a language as you can make, so the interpreter is very simple itself!

It’s written in Go and thanks to [GopherJS][39] it’s what powers the [web playground][40].

There are some fun projects if someone’s interested in getting more involved. Using the library to prune lambda expression trees and simplify expressions if possible would be a start! I’m sure my fizz buzz implementation isn’t as minimal as it could be, and playing [code golf][41] with it would be pretty neat!

Feel free to fork <https://github.com/jtolds/sheepda/>, star it, bop it, twist it, or even pull it!

--------------------------------------------------------------------------------

via: https://www.jtolio.com/2017/03/whiteboard-problems-in-pure-lambda-calculus

作者：[jtolio.com][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.jtolio.com/
[b]: https://github.com/lujun9972
[1]: https://www.vivint.com/
[2]: https://www.spacemonkey.com/
[3]: https://en.wikipedia.org/wiki/Festivus
[4]: https://twitter.com/aphyr
[5]: https://aphyr.com/posts/340-acing-the-technical-interview
[6]: https://en.wikipedia.org/wiki/Church_encoding
[7]: https://en.wikipedia.org/wiki/Lambda_calculus
[8]: https://en.wikipedia.org/wiki/Turing_completeness
[9]: https://imranontech.com/2007/01/24/using-fizzbuzz-to-find-developers-who-grok-coding/
[10]: https://jtolio.github.io/sheepda/#JTdCJTIyc3RkbGliJTIyJTNBZmFsc2UlMkMlMjJvdXRwdXQlMjIlM0ElMjJvdXRwdXQlMjIlMkMlMjJjb2RlJTIyJTNBJTIyKCVDRSVCQlUuKCVDRSVCQlkuKCVDRSVCQnZvaWQuKCVDRSVCQjAuKCVDRSVCQnN1Y2MuKCVDRSVCQiUyQi4oJUNFJUJCKi4oJUNFJUJCMS4oJUNFJUJCMi4oJUNFJUJCMy4oJUNFJUJCNC4oJUNFJUJCNS4oJUNFJUJCNi4oJUNFJUJCNy4oJUNFJUJCOC4oJUNFJUJCOS4oJUNFJUJCMTAuKCVDRSVCQm51bS4oJUNFJUJCdHJ1ZS4oJUNFJUJCZmFsc2UuKCVDRSVCQmlmLiglQ0UlQkJub3QuKCVDRSVCQmFuZC4oJUNFJUJCb3IuKCVDRSVCQm1ha2UtcGFpci4oJUNFJUJCcGFpci1maXJzdC4oJUNFJUJCcGFpci1zZWNvbmQuKCVDRSVCQnplcm8lM0YuKCVDRSVCQnByZWQuKCVDRSVCQi0uKCVDRSVCQmVxJTNGLiglQ0UlQkIlMkYuKCVDRSVCQiUyNS4oJUNFJUJCbmlsLiglQ0UlQkJuaWwlM0YuKCVDRSVCQmNvbnMuKCVDRSVCQmNhci4oJUNFJUJCY2RyLiglQ0UlQkJkbzIuKCVDRSVCQmRvMy4oJUNFJUJCZG80LiglQ0UlQkJmb3IuKCVDRSVCQnByaW50LWJ5dGUuKCVDRSVCQnByaW50LWxpc3QuKCVDRSVCQnByaW50LW5ld2xpbmUuKCVDRSVCQnplcm8tYnl0ZS4oJUNFJUJCaXRvYS4oJUNFJUJCZml6em1zZy4oJUNFJUJCYnV6em1zZy4oJUNFJUJCZml6emJ1enptc2cuKCVDRSVCQmZpenpidXp6LihmaXp6YnV6eiUyMCgoKG51bSUyMDEpJTIwMCklMjAxKSklMjAlQ0UlQkJuLigoZm9yJTIwbiklMjAlQ0UlQkJpLigoZG8yJTIwKCgoaWYlMjAoemVybyUzRiUyMCgoJTI1JTIwaSklMjAzKSkpJTIwJUNFJUJCXy4oKChpZiUyMCh6ZXJvJTNGJTIwKCglMjUlMjBpKSUyMDUpKSklMjAlQ0UlQkJfLihwcmludC1saXN0JTIwZml6emJ1enptc2cpKSUyMCVDRSVCQl8uKHByaW50LWxpc3QlMjBmaXp6bXNnKSkpJTIwJUNFJUJCXy4oKChpZiUyMCh6ZXJvJTNGJTIwKCglMjUlMjBpKSUyMDUpKSklMjAlQ0UlQkJfLihwcmludC1saXN0JTIwYnV6em1zZykpJTIwJUNFJUJCXy4ocHJpbnQtbGlzdCUyMChpdG9hJTIwaSkpKSkpJTIwKHByaW50LW5ld2xpbmUlMjBuaWwpKSkpJTIwKChjb25zJTIwKCgobnVtJTIwMCklMjA3KSUyMDApKSUyMCgoY29ucyUyMCgoKG51bSUyMDEpJTIwMCklMjA1KSklMjAoKGNvbnMlMjAoKChudW0lMjAxKSUyMDIpJTIwMikpJTIwKChjb25zJTIwKCgobnVtJTIwMSklMjAyKSUyMDIpKSUyMCgoY29ucyUyMCgoKG51bSUyMDApJTIwOSklMjA4KSklMjAoKGNvbnMlMjAoKChudW0lMjAxKSUyMDEpJTIwNykpJTIwKChjb25zJTIwKCgobnVtJTIwMSklMjAyKSUyMDIpKSUyMCgoY29ucyUyMCgoKG51bSUyMDEpJTIwMiklMjAyKSklMjBuaWwpKSkpKSkpKSklMjAoKGNvbnMlMjAoKChudW0lMjAwKSUyMDYpJTIwNikpJTIwKChjb25zJTIwKCgobnVtJTIwMSklMjAxKSUyMDcpKSUyMCgoY29ucyUyMCgoKG51bSUyMDEpJTIwMiklMjAyKSklMjAoKGNvbnMlMjAoKChudW0lMjAxKSUyMDIpJTIwMikpJTIwbmlsKSkpKSklMjAoKGNvbnMlMjAoKChudW0lMjAwKSUyMDcpJTIwMCkpJTIwKChjb25zJTIwKCgobnVtJTIwMSklMjAwKSUyMDUpKSUyMCgoY29ucyUyMCgoKG51bSUyMDEpJTIwMiklMjAyKSklMjAoKGNvbnMlMjAoKChudW0lMjAxKSUyMDIpJTIwMikpJTIwbmlsKSkpKSklMjAlQ0UlQkJuLigoKFklMjAlQ0UlQkJyZWN1cnNlLiVDRSVCQm4uJUNFJUJCcmVzdWx0LigoKGlmJTIwKHplcm8lM0YlMjBuKSklMjAlQ0UlQkJfLigoKGlmJTIwKG5pbCUzRiUyMHJlc3VsdCkpJTIwJUNFJUJCXy4oKGNvbnMlMjB6ZXJvLWJ5dGUpJTIwbmlsKSklMjAlQ0UlQkJfLnJlc3VsdCkpJTIwJUNFJUJCXy4oKHJlY3Vyc2UlMjAoKCUyRiUyMG4pJTIwMTApKSUyMCgoY29ucyUyMCgoJTJCJTIwemVyby1ieXRlKSUyMCgoJTI1JTIwbiklMjAxMCkpKSUyMHJlc3VsdCkpKSklMjBuKSUyMG5pbCkpJTIwKCgobnVtJTIwMCklMjA0KSUyMDgpKSUyMCVDRSVCQl8uKHByaW50LWJ5dGUlMjAoKChudW0lMjAwKSUyMDEpJTIwMCkpKSUyMChZJTIwJUNFJUJCcmVjdXJzZS4lQ0UlQkJsLigoKGlmJTIwKG5pbCUzRiUyMGwpKSUyMCVDRSVCQl8udm9pZCklMjAlQ0UlQkJfLigoZG8yJTIwKHByaW50LWJ5dGUlMjAoY2FyJTIwbCkpKSUyMChyZWN1cnNlJTIwKGNkciUyMGwpKSkpKSklMjBQUklOVF9CWVRFKSUyMCVDRSVCQm4uJUNFJUJCZi4oKCgoWSUyMCVDRSVCQnJlY3Vyc2UuJUNFJUJCcmVtYWluaW5nLiVDRSVCQmN1cnJlbnQuJUNFJUJCZi4oKChpZiUyMCh6ZXJvJTNGJTIwcmVtYWluaW5nKSklMjAlQ0UlQkJfLnZvaWQpJTIwJUNFJUJCXy4oKGRvMiUyMChmJTIwY3VycmVudCkpJTIwKCgocmVjdXJzZSUyMChwcmVkJTIwcmVtYWluaW5nKSklMjAoc3VjYyUyMGN1cnJlbnQpKSUyMGYpKSkpJTIwbiklMjAwKSUyMGYpKSUyMCVDRSVCQmEuZG8zKSUyMCVDRSVCQmEuZG8yKSUyMCVDRSVCQmEuJUNFJUJCYi5iKSUyMCVDRSVCQmwuKHBhaXItc2Vjb25kJTIwKHBhaXItc2Vjb25kJTIwbCkpKSUyMCVDRSVCQmwuKHBhaXItZmlyc3QlMjAocGFpci1zZWNvbmQlMjBsKSkpJTIwJUNFJUJCZS4lQ0UlQkJsLigobWFrZS1wYWlyJTIwdHJ1ZSklMjAoKG1ha2UtcGFpciUyMGUpJTIwbCkpKSUyMCVDRSVCQmwuKG5vdCUyMChwYWlyLWZpcnN0JTIwbCkpKSUyMCgobWFrZS1wYWlyJTIwZmFsc2UpJTIwdm9pZCkpJTIwJUNFJUJCbS4lQ0UlQkJuLigoLSUyMG0pJTIwKCgqJTIwKCglMkYlMjBtKSUyMG4pKSUyMG4pKSklMjAoWSUyMCVDRSVCQiUyRi4lQ0UlQkJtLiVDRSVCQm4uKCgoaWYlMjAoKGVxJTNGJTIwbSklMjBuKSklMjAlQ0UlQkJfLjEpJTIwJUNFJUJCXy4oKChpZiUyMCh6ZXJvJTNGJTIwKCgtJTIwbSklMjBuKSkpJTIwJUNFJUJCXy4wKSUyMCVDRSVCQl8uKCglMkIlMjAxKSUyMCgoJTJGJTIwKCgtJTIwbSklMjBuKSklMjBuKSkpKSkpJTIwJUNFJUJCbS4lQ0UlQkJuLigoYW5kJTIwKHplcm8lM0YlMjAoKC0lMjBtKSUyMG4pKSklMjAoemVybyUzRiUyMCgoLSUyMG4pJTIwbSkpKSklMjAlQ0UlQkJtLiVDRSVCQm4uKChuJTIwcHJlZCklMjBtKSklMjAlQ0UlQkJuLigoKCVDRSVCQm4uJUNFJUJCZi4lQ0UlQkJ4LihwYWlyLXNlY29uZCUyMCgobiUyMCVDRSVCQnAuKChtYWtlLXBhaXIlMjAoZiUyMChwYWlyLWZpcnN0JTIwcCkpKSUyMChwYWlyLWZpcnN0JTIwcCkpKSUyMCgobWFrZS1wYWlyJTIweCklMjB4KSkpJTIwbiklMjBzdWNjKSUyMDApKSUyMCVDRSVCQm4uKChuJTIwJUNFJUJCXy5mYWxzZSklMjB0cnVlKSklMjAlQ0UlQkJwLihwJTIwZmFsc2UpKSUyMCVDRSVCQnAuKHAlMjB0cnVlKSklMjAlQ0UlQkJ4LiVDRSVCQnkuJUNFJUJCdC4oKHQlMjB4KSUyMHkpKSUyMCVDRSVCQmEuJUNFJUJCYi4oKGElMjB0cnVlKSUyMGIpKSUyMCVDRSVCQmEuJUNFJUJCYi4oKGElMjBiKSUyMGZhbHNlKSklMjAlQ0UlQkJwLiVDRSVCQnQuJUNFJUJCZi4oKHAlMjBmKSUyMHQpKSUyMCVDRSVCQnAuJUNFJUJCYS4lQ0UlQkJiLigoKHAlMjBhKSUyMGIpJTIwdm9pZCkpJTIwJUNFJUJCdC4lQ0UlQkJmLmYpJTIwJUNFJUJCdC4lQ0UlQkJmLnQpJTIwJUNFJUJCYS4lQ0UlQkJiLiVDRSVCQmMuKCglMkIlMjAoKCUyQiUyMCgoKiUyMCgoKiUyMDEwKSUyMDEwKSklMjBhKSklMjAoKColMjAxMCklMjBiKSkpJTIwYykpJTIwKHN1Y2MlMjA5KSklMjAoc3VjYyUyMDgpKSUyMChzdWNjJTIwNykpJTIwKHN1Y2MlMjA2KSklMjAoc3VjYyUyMDUpKSUyMChzdWNjJTIwNCkpJTIwKHN1Y2MlMjAzKSklMjAoc3VjYyUyMDIpKSUyMChzdWNjJTIwMSkpJTIwKHN1Y2MlMjAwKSklMjAlQ0UlQkJtLiVDRSVCQm4uJUNFJUJCeC4obSUyMChuJTIweCkpKSUyMCVDRSVCQm0uJUNFJUJCbi4lQ0UlQkJmLiVDRSVCQnguKCgoKG0lMjBzdWNjKSUyMG4pJTIwZiklMjB4KSklMjAlQ0UlQkJuLiVDRSVCQmYuJUNFJUJCeC4oZiUyMCgobiUyMGYpJTIweCkpKSUyMCVDRSVCQmYuJUNFJUJCeC54KSUyMCVDRSVCQnguKFUlMjBVKSklMjAoVSUyMCVDRSVCQmguJUNFJUJCZi4oZiUyMCVDRSVCQnguKCgoaCUyMGgpJTIwZiklMjB4KSkpKSUyMCVDRSVCQmYuKGYlMjBmKSklNUNuJTIyJTdE
[11]: https://en.wikipedia.org/wiki/Currying
[12]: https://en.wikipedia.org/wiki/Alonzo_Church
[13]: https://en.wikipedia.org/wiki/Church_encoding#Church_numerals
[14]: https://en.wikipedia.org/wiki/Peano_axioms#Arithmetic
[15]: https://jtolio.github.io/sheepda/#JTdCJTIyc3RkbGliJTIyJTNBZmFsc2UlMkMlMjJvdXRwdXQlMjIlM0ElMjJyZXN1bHQlMjIlMkMlMjJjb2RlJTIyJTNBJTIyMCUyMCUzRCUyMCVDRSVCQmYuJUNFJUJCeC54JTVDbjElMjAlM0QlMjAlQ0UlQkJmLiVDRSVCQnguKGYlMjB4KSU1Q24yJTIwJTNEJTIwJUNFJUJCZi4lQ0UlQkJ4LihmJTIwKGYlMjB4KSklNUNuc3VjYyUyMCUzRCUyMCVDRSVCQm4uJUNFJUJCZi4lQ0UlQkJ4LihmJTIwKChuJTIwZiklMjB4KSklNUNuJTVDbnRydWUlMjAlMjAlM0QlMjAlQ0UlQkJ0LiVDRSVCQmYudCU1Q25mYWxzZSUyMCUzRCUyMCVDRSVCQnQuJUNFJUJCZi5mJTVDbiU1Q256ZXJvJTNGJTIwJTNEJTIwJUNFJUJCbi4oKG4lMjAlQ0UlQkJfLmZhbHNlKSUyMHRydWUpJTVDbiU1Q24lMjMlMjB0cnklMjBjaGFuZ2luZyUyMHRoZSUyMG51bWJlciUyMHplcm8lM0YlMjBpcyUyMGNhbGxlZCUyMHdpdGglNUNuKHplcm8lM0YlMjAwKSU1Q24lNUNuJTIzJTIwdGhlJTIwb3V0cHV0JTIwd2lsbCUyMGJlJTIwJTVDJTIyJUNFJUJCdC4lQ0UlQkJmLnQlNUMlMjIlMjBmb3IlMjB0cnVlJTIwYW5kJTIwJTVDJTIyJUNFJUJCdC4lQ0UlQkJmLmYlNUMlMjIlMjBmb3IlMjBmYWxzZS4lMjIlN0Q=
[16]: https://en.wikipedia.org/wiki/Eager_evaluation
[17]: https://en.wikipedia.org/wiki/Lazy_evaluation
[18]: https://en.wikipedia.org/wiki/Syntactic_sugar
[19]: https://jtolio.github.io/sheepda/#JTdCJTIyc3RkbGliJTIyJTNBZmFsc2UlMkMlMjJvdXRwdXQlMjIlM0ElMjJyZXN1bHQlMjIlMkMlMjJjb2RlJTIyJTNBJTIyMCUyMCUzRCUyMCVDRSVCQmYuJUNFJUJCeC54JTVDbjElMjAlM0QlMjAlQ0UlQkJmLiVDRSVCQnguKGYlMjB4KSU1Q24yJTIwJTNEJTIwJUNFJUJCZi4lQ0UlQkJ4LihmJTIwKGYlMjB4KSklNUNuMyUyMCUzRCUyMCVDRSVCQmYuJUNFJUJCeC4oZiUyMChmJTIwKGYlMjB4KSkpJTVDbnN1Y2MlMjAlM0QlMjAlQ0UlQkJuLiVDRSVCQmYuJUNFJUJCeC4oZiUyMCgobiUyMGYpJTIweCkpJTVDbiU1Q250cnVlJTIwJTIwJTNEJTIwJUNFJUJCdC4lQ0UlQkJmLnQlNUNuZmFsc2UlMjAlM0QlMjAlQ0UlQkJ0LiVDRSVCQmYuZiU1Q24lNUNuemVybyUzRiUyMCUzRCUyMCVDRSVCQm4uKChuJTIwJUNFJUJCXy5mYWxzZSklMjB0cnVlKSU1Q24lNUNuaWYlMjAlM0QlMjAlQ0UlQkJwLiVDRSVCQmEuJUNFJUJCYi4oKChwJTIwYSklMjBiKSUyMDApJTVDbmFuZCUyMCUzRCUyMCVDRSVCQmEuJUNFJUJCYi4oYSUyMGIlMjBmYWxzZSklNUNub3IlMjAlM0QlMjAlQ0UlQkJhLiVDRSVCQmIuKGElMjB0cnVlJTIwYiklNUNubm90JTIwJTNEJTIwJUNFJUJCcC4lQ0UlQkJ0LiVDRSVCQmYuKHAlMjBmJTIwdCklNUNuJTVDbiUyMyUyMHRyeSUyMGNoYW5naW5nJTIwdGhpcyUyMHVwISU1Q24oaWYlMjAob3IlMjAoemVybyUzRiUyMDEpJTIwKHplcm8lM0YlMjAwKSklNUNuJTIwJTIwJTIwJTIwJUNFJUJCXy4lMjAyJTVDbiUyMCUyMCUyMCUyMCVDRSVCQl8uJTIwMyklMjIlN0Q=
[20]: https://jtolio.github.io/sheepda/#JTdCJTIyc3RkbGliJTIyJTNBZmFsc2UlMkMlMjJvdXRwdXQlMjIlM0ElMjJyZXN1bHQlMjIlMkMlMjJjb2RlJTIyJTNBJTIyMCUyMCUzRCUyMCVDRSVCQmYuJUNFJUJCeC54JTVDbjElMjAlM0QlMjAlQ0UlQkJmLiVDRSVCQnguKGYlMjB4KSU1Q24yJTIwJTNEJTIwJUNFJUJCZi4lQ0UlQkJ4LihmJTIwKGYlMjB4KSklNUNuMyUyMCUzRCUyMCVDRSVCQmYuJUNFJUJCeC4oZiUyMChmJTIwKGYlMjB4KSkpJTVDbiU1Q250cnVlJTIwJTIwJTNEJTIwJUNFJUJCdC4lQ0UlQkJmLnQlNUNuZmFsc2UlMjAlM0QlMjAlQ0UlQkJ0LiVDRSVCQmYuZiU1Q24lNUNubWFrZS1wYWlyJTIwJTNEJTIwJUNFJUJCeC4lQ0UlQkJ5LiUyMCVDRSVCQmEuKGElMjB4JTIweSklNUNucGFpci1maXJzdCUyMCUzRCUyMCVDRSVCQnAuKHAlMjB0cnVlKSU1Q25wYWlyLXNlY29uZCUyMCUzRCUyMCVDRSVCQnAuKHAlMjBmYWxzZSklNUNuJTVDbiUyMyUyMHRyeSUyMGNoYW5naW5nJTIwdGhpcyUyMHVwISU1Q25wJTIwJTNEJTIwKG1ha2UtcGFpciUyMDIlMjAzKSU1Q24ocGFpci1zZWNvbmQlMjBwKSUyMiU3RA==
[21]: https://en.wikipedia.org/wiki/Linked_list
[22]: https://en.wikipedia.org/wiki/Lisp_%28programming_language%29
[23]: https://en.wikipedia.org/wiki/CAR_and_CDR#Etymology
[24]: https://jtolio.github.io/sheepda/#JTdCJTIyc3RkbGliJTIyJTNBZmFsc2UlMkMlMjJvdXRwdXQlMjIlM0ElMjJyZXN1bHQlMjIlMkMlMjJjb2RlJTIyJTNBJTIyMCUyMCUzRCUyMCVDRSVCQmYuJUNFJUJCeC54JTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwMSUyMCUzRCUyMCVDRSVCQmYuJUNFJUJCeC4oZiUyMHgpJTIwJTIwJTIwJTIwJTIwMiUyMCUzRCUyMCVDRSVCQmYuJUNFJUJCeC4oZiUyMChmJTIweCkpJTIwJTIwJTIwJTIwMyUyMCUzRCUyMCVDRSVCQmYuJUNFJUJCeC4oZiUyMChmJTIwKGYlMjB4KSkpJTVDbnRydWUlMjAlMjAlM0QlMjAlQ0UlQkJ0LiVDRSVCQmYudCUyMCUyMCUyMCUyMGZhbHNlJTIwJTNEJTIwJUNFJUJCdC4lQ0UlQkJmLmYlNUNuJTVDbm1ha2UtcGFpciUyMCUzRCUyMCVDRSVCQnguJUNFJUJCeS4lMjAlQ0UlQkJhLihhJTIweCUyMHkpJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwcGFpci1maXJzdCUyMCUzRCUyMCVDRSVCQnAuKHAlMjB0cnVlKSUyMCUyMCUyMCUyMCUyMHBhaXItc2Vjb25kJTIwJTNEJTIwJUNFJUJCcC4ocCUyMGZhbHNlKSU1Q24lNUNubmlsJTIwJTNEJTIwKG1ha2UtcGFpciUyMGZhbHNlJTIwZmFsc2UpJTIwJTIwJTIwJTIwJTIwbmlsJTNGJTIwJTNEJTIwJUNFJUJCbC4lMjAobm90JTIwKHBhaXItZmlyc3QlMjBsKSklNUNuY29ucyUyMCUzRCUyMCVDRSVCQnZhbHVlLiVDRSVCQmxpc3QuKG1ha2UtcGFpciUyMHRydWUlMjAobWFrZS1wYWlyJTIwdmFsdWUlMjBsaXN0KSklNUNuJTVDbmhlYWQlMjAlM0QlMjAlQ0UlQkJsaXN0LiUyMChwYWlyLWZpcnN0JTIwKHBhaXItc2Vjb25kJTIwbGlzdCkpJTVDbnRhaWwlMjAlM0QlMjAlQ0UlQkJsaXN0LiUyMChwYWlyLXNlY29uZCUyMChwYWlyLXNlY29uZCUyMGxpc3QpKSU1Q24lNUNuJTIzJTIwdHJ5JTIwY2hhbmdpbmclMjB0aGlzJTIwdXAhJTVDbmwlMjAlM0QlMjAoY29ucyUyMDElMjAoY29ucyUyMDIlMjAoY29ucyUyMDMlMjBuaWwpKSklNUNuKGhlYWQlMjAodGFpbCUyMGwpKSUyMiU3RA==
[25]: https://en.wikipedia.org/wiki/Recursion
[26]: https://jtolio.github.io/sheepda/#JTdCJTIyc3RkbGliJTIyJTNBdHJ1ZSUyQyUyMm91dHB1dCUyMiUzQSUyMm91dHB1dCUyMiUyQyUyMmNvZGUlMjIlM0ElMjJzdW0lMjAlM0QlMjAlQ0UlQkJoZWxwZXIuJUNFJUJCbGlzdC4lNUNuJTIwJTIwKGlmJTIwKG5pbCUzRiUyMGxpc3QpJTVDbiUyMCUyMCUyMCUyMCUyMCUyMCVDRSVCQl8uJTIwMCU1Q24lMjAlMjAlMjAlMjAlMjAlMjAlQ0UlQkJfLiUyMCglMkIlMjAoaGVhZCUyMGxpc3QpJTIwKGhlbHBlciUyMGhlbHBlciUyMCh0YWlsJTIwbGlzdCkpKSklNUNuJTVDbnJlc3VsdCUyMCUzRCUyMChzdW0lMjBzdW0lMjAoY29ucyUyMDElMjAoY29ucyUyMDIlMjAoY29ucyUyMDMlMjBuaWwpKSkpJTVDbiU1Q24lMjMlMjB3ZSdsbCUyMGV4cGxhaW4lMjBob3clMjBwcmludC1udW0lMjB3b3JrcyUyMGxhdGVyJTJDJTIwYnV0JTIwd2UlMjBuZWVkJTIwaXQlMjB0byUyMHNob3clMjB0aGF0JTIwc3VtJTIwaXMlMjB3b3JraW5nJTVDbihwcmludC1udW0lMjByZXN1bHQpJTIyJTdE
[27]: https://en.wikipedia.org/wiki/Fixed-point_combinator#Fixed_point_combinators_in_lambda_calculus
[28]: https://www.ycombinator.com/
[29]: https://news.ycombinator.com/
[30]: http://matt.might.net/articles/implementation-of-recursive-fixed-point-y-combinator-in-javascript-for-memoization/
[31]: http://kestas.kuliukas.com/YCombinatorExplained/
[32]: https://jtolio.github.io/sheepda/#JTdCJTIyc3RkbGliJTIyJTNBdHJ1ZSUyQyUyMm91dHB1dCUyMiUzQSUyMm91dHB1dCUyMiUyQyUyMmNvZGUlMjIlM0ElMjJZJTIwJTNEJTIwJUNFJUJCZi4oJUNFJUJCeC4oeCUyMHgpJTIwJUNFJUJCeC4oZiUyMCVDRSVCQnkuKCh4JTIweCklMjB5KSkpJTVDbiU1Q25zdW0lMjAlM0QlMjAoWSUyMCVDRSVCQmhlbHBlci4lQ0UlQkJsaXN0LiU1Q24lMjAlMjAoaWYlMjAobmlsJTNGJTIwbGlzdCklNUNuJTIwJTIwJTIwJTIwJTIwJTIwJUNFJUJCXy4lMjAwJTVDbiUyMCUyMCUyMCUyMCUyMCUyMCVDRSVCQl8uJTIwKCUyQiUyMChoZWFkJTIwbGlzdCklMjAoaGVscGVyJTIwKHRhaWwlMjBsaXN0KSkpKSklNUNuJTVDbiUyMyUyMHdlJ2xsJTIwZXhwbGFpbiUyMGhvdyUyMHRoaXMlMjB3b3JrcyUyMGxhdGVyJTJDJTIwYnV0JTIwd2UlMjBuZWVkJTIwaXQlMjB0byUyMHNob3clMjB0aGF0JTIwc3VtJTIwaXMlMjB3b3JraW5nJTVDbnByaW50LW51bSUyMCUzRCUyMCVDRSVCQm4uKHByaW50LWxpc3QlMjAoaXRvYSUyMG4pKSU1Q24lNUNuKHByaW50LW51bSUyMChzdW0lMjAoY29ucyUyMDElMjAoY29ucyUyMDIlMjAoY29ucyUyMDMlMjBuaWwpKSkpKSUyMiU3RA
[33]: https://jtolio.github.io/sheepda/#JTdCJTIyc3RkbGliJTIyJTNBdHJ1ZSUyQyUyMm91dHB1dCUyMiUzQSUyMm91dHB1dCUyMiUyQyUyMmNvZGUlMjIlM0ElMjIwJTIwJTNEJTIwJUNFJUJCZi4lQ0UlQkJ4LnglNUNuMSUyMCUzRCUyMCVDRSVCQmYuJUNFJUJCeC4oZiUyMHgpJTVDbjIlMjAlM0QlMjAlQ0UlQkJmLiVDRSVCQnguKGYlMjAoZiUyMHgpKSU1Q24zJTIwJTNEJTIwJUNFJUJCZi4lQ0UlQkJ4LihmJTIwKGYlMjAoZiUyMHgpKSklNUNuJTVDbnByZWQlMjAlM0QlMjAlQ0UlQkJuLiU1Q24lMjAlMjAocGFpci1zZWNvbmQlNUNuJTIwJTIwJTIwJTIwKG4lNUNuJTIwJTIwJTIwJTIwJTIwJUNFJUJCcGFpci4obWFrZS1wYWlyJTIwKHN1Y2MlMjAocGFpci1maXJzdCUyMHBhaXIpKSUyMChwYWlyLWZpcnN0JTIwcGFpcikpJTVDbiUyMCUyMCUyMCUyMCUyMChtYWtlLXBhaXIlMjAwJTIwMCkpKSU1Q24lNUNuJTIzJTIwd2UnbGwlMjBleHBsYWluJTIwaG93JTIwcHJpbnQtbnVtJTIwd29ya3MlMjBsYXRlciElNUNuKHByaW50LW51bSUyMChwcmVkJTIwMykpJTVDbiUyMiU3RA==
[34]: https://jtolio.github.io/sheepda/#JTdCJTIyc3RkbGliJTIyJTNBdHJ1ZSUyQyUyMm91dHB1dCUyMiUzQSUyMm91dHB1dCUyMiUyQyUyMmNvZGUlMjIlM0ElMjIlMkIlMjAlM0QlMjAlQ0UlQkJtLiVDRSVCQm4uKG0lMjBzdWNjJTIwbiklNUNuKiUyMCUzRCUyMCVDRSVCQm0uJUNFJUJCbi4obiUyMCglMkIlMjBtKSUyMDApJTVDbi0lMjAlM0QlMjAlQ0UlQkJtLiVDRSVCQm4uKG4lMjBwcmVkJTIwbSklNUNuJTJGJTIwJTNEJTIwKFklMjAlQ0UlQkIlMkYuJUNFJUJCbS4lQ0UlQkJuLiU1Q24lMjAlMjAoaWYlMjAoZXElM0YlMjBtJTIwbiklNUNuJTIwJTIwJTIwJTIwJTIwJTIwJUNFJUJCXy4lMjAxJTVDbiUyMCUyMCUyMCUyMCUyMCUyMCVDRSVCQl8uJTIwKGlmJTIwKGxlJTNGJTIwbSUyMG4pJTVDbiUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCVDRSVCQl8uJTIwMCU1Q24lMjAlMjAlMjAlMjAlMjAlMjAlMjAlMjAlMjAlMjAlMjAlMjAlMjAlMjAlQ0UlQkJfLiUyMCglMkIlMjAxJTIwKCUyRiUyMCgtJTIwbSUyMG4pJTIwbikpKSkpJTVDbiUyNSUyMCUzRCUyMCVDRSVCQm0uJUNFJUJCbi4lMjAoLSUyMG0lMjAoKiUyMCglMkYlMjBtJTIwbiklMjBuKSklNUNuJTVDbihwcmludC1udW0lMjAoJTI1JTIwNyUyMDMpKSUyMiU3RA==
[35]: https://github.com/jtolds/sheepda/
[36]: https://en.wikipedia.org/wiki/ASCII#Code_chart
[37]: https://jtolio.github.io/sheepda/#JTdCJTIyc3RkbGliJTIyJTNBdHJ1ZSUyQyUyMm91dHB1dCUyMiUzQSUyMm91dHB1dCUyMiUyQyUyMmNvZGUlMjIlM0ElMjIlMjMlMjBkZWZpbmUlMjB0aGUlMjBtZXNzYWdlcyU1Q25maXp6bXNnJTIwJTNEJTIwKGNvbnMlMjAobnVtJTIwMCUyMDclMjAwKSUyMChjb25zJTIwKG51bSUyMDElMjAwJTIwNSklMjAoY29ucyUyMChudW0lMjAxJTIwMiUyMDIpJTIwKGNvbnMlMjAobnVtJTIwMSUyMDIlMjAyKSUyMG5pbCkpKSklNUNuYnV6em1zZyUyMCUzRCUyMChjb25zJTIwKG51bSUyMDAlMjA2JTIwNiklMjAoY29ucyUyMChudW0lMjAxJTIwMSUyMDcpJTIwKGNvbnMlMjAobnVtJTIwMSUyMDIlMjAyKSUyMChjb25zJTIwKG51bSUyMDElMjAyJTIwMiklMjBuaWwpKSkpJTVDbmZpenpidXp6bXNnJTIwJTNEJTIwKGNvbnMlMjAobnVtJTIwMCUyMDclMjAwKSUyMChjb25zJTIwKG51bSUyMDElMjAwJTIwNSklMjAoY29ucyUyMChudW0lMjAxJTIwMiUyMDIpJTIwKGNvbnMlMjAobnVtJTIwMSUyMDIlMjAyKSU1Q24lMjAlMjAlMjAlMjAoY29ucyUyMChudW0lMjAwJTIwOSUyMDgpJTIwKGNvbnMlMjAobnVtJTIwMSUyMDElMjA3KSUyMChjb25zJTIwKG51bSUyMDElMjAyJTIwMiklMjAoY29ucyUyMChudW0lMjAxJTIwMiUyMDIpJTIwbmlsKSkpKSkpKSklNUNuJTVDbiUyMyUyMGZpenpidXp6JTVDbmZpenpidXp6JTIwJTNEJTIwJUNFJUJCbi4lNUNuJTIwJTIwKGZvciUyMG4lMjAlQ0UlQkJpLiU1Q24lMjAlMjAlMjAlMjAoZG8yJTVDbiUyMCUyMCUyMCUyMCUyMCUyMChpZiUyMCh6ZXJvJTNGJTIwKCUyNSUyMGklMjAzKSklNUNuJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJUNFJUJCXy4lMjAoaWYlMjAoemVybyUzRiUyMCglMjUlMjBpJTIwNSkpJTVDbiUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCVDRSVCQl8uJTIwKHByaW50LWxpc3QlMjBmaXp6YnV6em1zZyklNUNuJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJUNFJUJCXy4lMjAocHJpbnQtbGlzdCUyMGZpenptc2cpKSU1Q24lMjAlMjAlMjAlMjAlMjAlMjAlMjAlMjAlMjAlMjAlQ0UlQkJfLiUyMChpZiUyMCh6ZXJvJTNGJTIwKCUyNSUyMGklMjA1KSklNUNuJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJUNFJUJCXy4lMjAocHJpbnQtbGlzdCUyMGJ1enptc2cpJTVDbiUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCVDRSVCQl8uJTIwKHByaW50LWxpc3QlMjAoaXRvYSUyMGkpKSkpJTVDbiUyMCUyMCUyMCUyMCUyMCUyMChwcmludC1uZXdsaW5lJTIwbmlsKSkpJTVDbiU1Q24lMjMlMjBydW4lMjBmaXp6YnV6eiUyMDIwJTIwdGltZXMlNUNuKGZpenpidXp6JTIwKG51bSUyMDAlMjAyJTIwMCkpJTIyJTdE
[38]: https://jtolio.github.io/sheepda/#JTdCJTIyc3RkbGliJTIyJTNBdHJ1ZSUyQyUyMm91dHB1dCUyMiUzQSUyMm91dHB1dCUyMiUyQyUyMmNvZGUlMjIlM0ElMjJoZWxsby13b3JsZCUyMCUzRCUyMChjb25zJTIwKG51bSUyMDAlMjA3JTIwMiklMjAoY29ucyUyMChudW0lMjAxJTIwMCUyMDEpJTIwKGNvbnMlMjAobnVtJTIwMSUyMDAlMjA4KSUyMChjb25zJTIwKG51bSUyMDElMjAwJTIwOCklMjAoY29ucyUyMChudW0lMjAxJTIwMSUyMDEpJTVDbiUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMChjb25zJTIwKG51bSUyMDAlMjA0JTIwNCklMjAoY29ucyUyMChudW0lMjAwJTIwMyUyMDIpJTIwKGNvbnMlMjAobnVtJTIwMSUyMDElMjA5KSUyMChjb25zJTIwKG51bSUyMDElMjAxJTIwMSklMjAoY29ucyUyMChudW0lMjAxJTIwMSUyMDQpJTVDbiUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMChjb25zJTIwKG51bSUyMDElMjAwJTIwOCklMjAoY29ucyUyMChudW0lMjAxJTIwMCUyMDApJTIwKGNvbnMlMjAobnVtJTIwMCUyMDMlMjAzKSUyMG5pbCkpKSkpKSkpKSkpKSklNUNuJTVDbnJldmVyc2UtbGlzdCUyMCUzRCUyMCVDRSVCQmxpc3QuKCU1Q24lMjAlMjAoWSUyMCVDRSVCQnJlY3Vyc2UuJUNFJUJCb2xkLiVDRSVCQm5ldy4lNUNuJTIwJTIwJTIwJTIwKGlmJTIwKG5pbCUzRiUyMG9sZCklNUNuJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJUNFJUJCXy5uZXclNUNuJTIwJTIwJTIwJTIwJTIwJTIwJTIwJTIwJUNFJUJCXy4ocmVjdXJzZSUyMCh0YWlsJTIwb2xkKSUyMChjb25zJTIwKGhlYWQlMjBvbGQpJTIwbmV3KSkpKSU1Q24lMjAlMjBsaXN0JTIwbmlsKSU1Q24lNUNuKGRvNCU1Q24lMjAlMjAocHJpbnQtbGlzdCUyMGhlbGxvLXdvcmxkKSU1Q24lMjAlMjAocHJpbnQtbmV3bGluZSUyMHZvaWQpJTVDbiUyMCUyMChwcmludC1saXN0JTIwKHJldmVyc2UtbGlzdCUyMGhlbGxvLXdvcmxkKSklNUNuJTIwJTIwKHByaW50LW5ld2xpbmUlMjB2b2lkKSklMjIlN0Q=
[39]: https://github.com/gopherjs/gopherjs
[40]: https://jtolio.github.io/sheepda/
[41]: https://en.wikipedia.org/wiki/Code_golf
