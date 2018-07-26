name1e5s is translating


Slices from the ground up
============================================================

This blog post was inspired by a conversation with a co-worker about using a slice as a stack. The conversation turned into a wider discussion on the way slices work in Go, so I thought it would be useful to write it up.

### Arrays

Every discussion of Go’s slice type starts by talking about something that isn’t a slice, namely, Go’s array type. Arrays in Go have two relevant properties:

1.  They have a fixed size; `[5]int` is both an array of 5 `int`s and is distinct from `[3]int`.

2.  They are value types. Consider this example:
    ```
    package main

    import "fmt"

    func main() {
            var a [5]int
            b := a
            b[2] = 7
            fmt.Println(a, b) // prints [0 0 0 0 0] [0 0 7 0 0]
    }
    ```

    The statement `b := a` declares a new variable, `b`, of type `[5]int`, and  _copies _ the contents of `a` to `b`. Updating `b` has no effect on the contents of `a` because `a` and `b` are independent values.[1][1]

### Slices

Go’s slice type differs from its array counterpart in two important ways:

1.  Slices do not have a fixed length. A slice’s length is not declared as part of its type, rather it is held within the slice itself and is recoverable with the built-in function `len`.[2][2]

2.  Assigning one slice variable to another  _does not_  make a copy of the slices contents. This is because a slice does not directly hold its contents. Instead a slice holds a pointer to its  _underlying_  array[3][3] which holds the contents of the slice.

As a result of the second property, two slices can share the same underlying array. Consider these examples:

1.  Slicing a slice:
    ```
    package main

    import "fmt"

    func main() {
            var a = []int{1,2,3,4,5}
            b := a[2:]
            b[0] = 0
            fmt.Println(a, b) // prints [1 2 0 4 5] [0 4 5]
    }
    ```

    In this example `a` and `b` share the same underlying array–even though `b` starts at a different offset in that array, and has a different length. Changes to the underlying array via `b` are thus visible to `a`.

2.  Passing a slice to a function:
    ```
    package main

    import "fmt"

    func negate(s []int) {
            for i := range s {
                    s[i] = -s[i]
            }
    }

    func main() {
            var a = []int{1, 2, 3, 4, 5}
            negate(a)
            fmt.Println(a) // prints [-1 -2 -3 -4 -5]
    }
    ```

    In this example `a` is passed to `negate`as the formal parameter `s.` `negate` iterates over the elements of `s`, negating their sign. Even though `negate` does not return a value, or have any way to access the declaration of `a` in `main`, the contents of `a` are modified when passed to `negate`.

Most programmers have an intuitive understanding of how a Go slice’s underlying array works because it matches how array-like concepts in other languages tend to work. For example, here’s the first example of this section rewritten in Python:

```
Python 2.7.10 (default, Feb  7 2017, 00:08:15) 
[GCC 4.2.1 Compatible Apple LLVM 8.0.0 (clang-800.0.34)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> a = [1,2,3,4,5]
>>> b = a
>>> b[2] = 0
>>> a
[1, 2, 0, 4, 5]
```

And also in Ruby:

```
irb(main):001:0> a = [1,2,3,4,5]
=> [1, 2, 3, 4, 5]
irb(main):002:0> b = a
=> [1, 2, 3, 4, 5]
irb(main):003:0> b[2] = 0
=> 0
irb(main):004:0> a
=> [1, 2, 0, 4, 5]
```

The same applies to most languages that treat arrays as objects or reference types.[4][8]

### The slice header value

The magic that makes a slice behave both as a value and a pointer is to understand that a slice is actually a struct type. This is commonly referred to as a  _slice header_  after its [counterpart in the reflect package][20]. The definition of a slice header looks something like this:

![](https://dave.cheney.net/wp-content/uploads/2018/07/slice.001-300x257.png)

```
package runtime

type slice struct {
        ptr   unsafe.Pointer
        len   int
        cap   int
}
```

This is important because  [_unlike_  `map` and `chan`types][21] slices are value types and are  _copied_ when assigned or passed as arguments to functions.

To illustrate this, programmers instinctively understand that `square`‘s formal parameter `v` is an independent copy of the `v` declared in `main`.

```
package main

import "fmt"

func square(v int) {
        v = v * v
}

func main() {
        v := 3
        square(v)
        fmt.Println(v) // prints 3, not 9
}
```

So the operation of `square` on its `v` has no effect on `main`‘s `v`. So too the formal parameter `s` of `double` is an independent copy of the slice `s` declared in `main`,  _not_  a pointer to `main`‘s `s` value.

```
package main

import "fmt"

func double(s []int) {
        s = append(s, s...)
}

func main() {
        s := []int{1, 2, 3}
        double(s)
        fmt.Println(s, len(s)) // prints [1 2 3] 3
}
```

The slightly unusual nature of a Go slice variable is it’s passed around as a value, not than a pointer. 90% of the time when you declare a struct in Go, you will pass around a pointer to values of that struct.[5][9] This is quite uncommon, the only other example of passing a struct around as a value I can think of off hand is `time.Time`.

It is this exceptional behaviour of slices as values, rather than pointers to values, that can confuses Go programmer’s understanding of how slices work. Just remember that any time you assign, subslice, or pass or return, a slice, you’re making a copy of the three fields in the slice header; the pointer to the underlying array, and the current length and capacity.

### Putting it all together

I’m going to conclude this post on the example of a slice as a stack that I opened this post with:

```
package main

import "fmt"

func f(s []string, level int) {
        if level > 5 {
               return
        }
        s = append(s, fmt.Sprint(level))
        f(s, level+1)
        fmt.Println("level:", level, "slice:", s)
}

func main() {
        f(nil, 0)
}
```

Starting from `main` we pass a `nil` slice into `f` as `level` 0\. Inside `f` we append to `s` the current `level`before incrementing `level` and recursing. Once `level` exceeds 5, the calls to `f` return, printing their current level and the contents of their copy of `s`.

```
level: 5 slice: [0 1 2 3 4 5]
level: 4 slice: [0 1 2 3 4]
level: 3 slice: [0 1 2 3]
level: 2 slice: [0 1 2]
level: 1 slice: [0 1]
level: 0 slice: [0]
```

You can see that at each level the value of `s` was unaffected by the operation of other callers of `f`, and that while four underlying arrays were created [6][10] higher levels of `f` in the call stack are unaffected by the copy and reallocation of new underlying arrays as a by-product of `append`.

### Further reading

If you want to find out more about how slices work in Go, I recommend these posts from the Go blog:

*   [Go Slices: usage and internals][11] (blog.golang.org)

*   [Arrays, slices (and strings): The mechanics of ‘append’][12] (blog.golang.org)

### Notes

1.  This is not a unique property of arrays. In Go  _every_  assignment is a copy.[][13]

2.  You can also use `len` on array values, but the result is a forgone conclusion.[][14]

3.  This is also known as the backing array or sometimes, less correctly, as the backing slice[][15]

4.  In Go we tend to say value type and pointer type because of the confusion caused by C++’s  _reference_  type, but in this case I think calling arrays as objects reference types is appropriate.[][16]

5.  I’d argue if that struct has a [method defined on it and/or is used to satisfy an interface][17]then the percentage that you will pass around a pointer to your struct raises to near 100%.[][18]

6.  Proof of this is left as an exercise to the reader.[][19]

### Related Posts:

1.  [If a map isn’t a reference variable, what is it?][4]

2.  [What is the zero value, and why is it useful ?][5]

3.  [The empty struct][6]

4.  [Should methods be declared on T or *T][7]

--------------------------------------------------------------------------------

via: https://dave.cheney.net/2018/07/12/slices-from-the-ground-up

作者：[Dave Cheney][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://dave.cheney.net/
[1]:https://dave.cheney.net/2018/07/12/slices-from-the-ground-up#easy-footnote-bottom-1-3265
[2]:https://dave.cheney.net/2018/07/12/slices-from-the-ground-up#easy-footnote-bottom-2-3265
[3]:https://dave.cheney.net/2018/07/12/slices-from-the-ground-up#easy-footnote-bottom-3-3265
[4]:https://dave.cheney.net/2017/04/30/if-a-map-isnt-a-reference-variable-what-is-it
[5]:https://dave.cheney.net/2013/01/19/what-is-the-zero-value-and-why-is-it-useful
[6]:https://dave.cheney.net/2014/03/25/the-empty-struct
[7]:https://dave.cheney.net/2016/03/19/should-methods-be-declared-on-t-or-t
[8]:https://dave.cheney.net/2018/07/12/slices-from-the-ground-up#easy-footnote-bottom-4-3265
[9]:https://dave.cheney.net/2018/07/12/slices-from-the-ground-up#easy-footnote-bottom-5-3265
[10]:https://dave.cheney.net/2018/07/12/slices-from-the-ground-up#easy-footnote-bottom-6-3265
[11]:https://blog.golang.org/go-slices-usage-and-internals
[12]:https://blog.golang.org/slices
[13]:https://dave.cheney.net/2018/07/12/slices-from-the-ground-up#easy-footnote-1-3265
[14]:https://dave.cheney.net/2018/07/12/slices-from-the-ground-up#easy-footnote-2-3265
[15]:https://dave.cheney.net/2018/07/12/slices-from-the-ground-up#easy-footnote-3-3265
[16]:https://dave.cheney.net/2018/07/12/slices-from-the-ground-up#easy-footnote-4-3265
[17]:https://dave.cheney.net/2016/03/19/should-methods-be-declared-on-t-or-t
[18]:https://dave.cheney.net/2018/07/12/slices-from-the-ground-up#easy-footnote-5-3265
[19]:https://dave.cheney.net/2018/07/12/slices-from-the-ground-up#easy-footnote-6-3265
[20]:https://golang.org/pkg/reflect/#SliceHeader
[21]:https://dave.cheney.net/2017/04/30/if-a-map-isnt-a-reference-variable-what-is-it
