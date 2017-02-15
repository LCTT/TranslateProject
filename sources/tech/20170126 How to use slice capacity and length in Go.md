<header class="post-header" style="text-rendering: optimizeLegibility; font-family: &quot;Noto Serif&quot;, Georgia, Cambria, &quot;Times New Roman&quot;, Times, serif; font-size: 20px; text-align: start; background-color: rgb(255, 255, 255);">[How to use slice capacity and length in Go][14]
============================================================</header>

<aside class="post-side" style="text-rendering: optimizeLegibility; position: fixed; top: 80px; left: 0px; width: 195px; padding-right: 5px; padding-left: 5px; text-align: right; z-index: 300; font-family: &quot;Noto Serif&quot;, Georgia, Cambria, &quot;Times New Roman&quot;, Times, serif; font-size: 20px;"></aside>

Quick pop quiz - what does the following code output?

```
vals := make([]int, 5)  
for i := 0; i < 5; i++ {  
  vals = append(vals, i)
}
fmt.Println(vals)  
```

_[Cheat and run it on the Go Playground][1]_

If you guessed `[0 0 0 0 0 0 1 2 3 4]` you are correct.

_Wait, what?_ Why isn't it `[0 1 2 3 4]`?

Don't worry if you got the pop quiz wrong. This is a fairly common mistake when transitioning into Go and in this post we are going to cover both why the output isn't what you expected along with how to utilize the nuances of Go to make your code more efficient.

### Slices vs Arrays

In Go there are both arrays and slices. This can be confusing at first, but once you get used to it you will love it. Trust me.

There are many differences between slices and arrays, but the primary one we want to focus on in this article is that the size of an array is part of its type, whereas slices can have a dynamic size because they are wrappers around arrays.

What does this mean in practice? Well, let's say we have the array `val a [10]int`. This array has a fixed size and that can't be changed. If we were to call `len(a)` it would always return 10, because that size is part of the type. As a result, if you suddenly need more than 10 items in your array you have to create a new object with an entirely different type, such as `val b [11]int`, and then copy all of your values from `a` over to `b`.

While having arrays with set sizes is valuable in specific cases, generally speaking this isn't what developers want. Instead, they want to work with something similar to an array in Go, but with the ability to grow over time. One crude way to do this would be to create an array that is much bigger than it needs to be and then to treat a subset of the array as your array. An example of this is shown in the code below.

```
var vals [20]int  
for i := 0; i < 5; i++ {  
  vals[i] = i * i
}
subsetLen := 5

fmt.Println("The subset of our array has a length of:", subsetLen)

// Add a new item to our array
vals[subsetLen] = 123  
subsetLen++  
fmt.Println("The subset of our array has a length of:", subsetLen)  
```

_[Run it on the Go Playground][2]_

With this code we have an array with a set size of 20, but because we are only using a subset our code can pretend that the length of the array is 5, and then 6 after we add a new item to our array.

This is (very roughly speaking) how slices work. They wrap an array with a set size, much like our array in the previous example has a set size of 20.

They also keep track of the subset of the array that is available for your program to use - this is the `length` attribute, and it is similar to the `subsetLen` variable in the previous example.

Finally, a slice also has a `capacity`, which is similar to the total length of our array (20) in the previous example. This is useful because it tells you how large your subset can grow before it will no longer fit in the array that is backing the slice. When this does happen, a new array will need to be allocated, but all of this logic is hidden behind the `append` function.

In short, combining slices with the `append` function gives us a type that is very similar to arrays, but is capable of growing over time to handle more elements.

Let's look at the previous example again, but this time we will use a slice instead of an array.

```
var vals []int  
for i := 0; i < 5; i++ {  
  vals = append(vals, i)
  fmt.Println("The length of our slice is:", len(vals))
  fmt.Println("The capacity of our slice is:", cap(vals))
}

// Add a new item to our array
vals = append(vals, 123)  
fmt.Println("The length of our slice is:", len(vals))  
fmt.Println("The capacity of our slice is:", cap(vals))

// Accessing items is the same as an array
fmt.Println(vals[5])  
fmt.Println(vals[2])  
```

_[Run it on the Go Playground][3]_

We can still access elements in our slice just like we would arrays, but by using a slice and the `append` function we no longer have to think about the size of the backing array. We are still able to figure these things out by using the `len` and `cap` functions, but we don't have to worry too much about them. Neat, right?

### Back to the pop quiz

With that in mind, let's look back at our pop quiz code to see what went wrong.

```
vals := make([]int, 5)  
for i := 0; i < 5; i++ {  
  vals = append(vals, i)
}
fmt.Println(vals)  
```

When calling `make` we are permitted to pass in up to 3 arguments. The first is the type that we are allocating, the second is the `length` of the type, and the third is the `capacity` of the type (_this parameter is optional_).

By passing in the arguments `make([]int, 5)` we are telling our program that we want to create a slice with a length of 5, and the capacity is defaulted to the length provided - 5 in this instance.

While this might seem like what we wanted at first, the important distinction here is that we told our slice that we wanted to set both the `length` and `capacity` to 5, and then we proceeded to call the `append` function which assumes you want to add a new element _after_ the initial 5, so it will increase the capacity and start adding new elements at the end of the slice.

You can actually see the capacity changing if you add a `Println()` statement to your code.

```
vals := make([]int, 5)  
fmt.Println("Capacity was:", cap(vals))  
for i := 0; i < 5; i++ {  
  vals = append(vals, i)
  fmt.Println("Capacity is now:", cap(vals))
}

fmt.Println(vals)  
```

_[Run it on the Go Playground][4]_

As a result, we end up getting the output `[0 0 0 0 0 0 1 2 3 4]` instead of the desired `[0 1 2 3 4]`.

How do we fix it? Well, there are several ways to do this, so we are going to cover two of them and you can pick whichever makes the most sense in your situation.

### Write directly to indexes instead of using `append`

The first fix is to leave the `make` call unchanged and explicitly state the index that you want to set each element to. Doing this, we would get the following code:

```
vals := make([]int, 5)  
for i := 0; i < 5; i++ {  
  vals[i] = i
}
fmt.Println(vals)  
```

_[Run it on the Go Playground][5]_

In this case the value we are setting happens to be the same as the index we want to use, but you can also keep track of the index independently.

For example, if you wanted to get the keys of a map you could use the following code.

```
package main

import "fmt"

func main() {  
  fmt.Println(keys(map[string]struct{}{
    "dog": struct{}{},
    "cat": struct{}{},
  }))
}

func keys(m map[string]struct{}) []string {  
  ret := make([]string, len(m))
  i := 0
  for key := range m {
    ret[i] = key
    i++
  }
  return ret
}
```

_[Run it on the Go Playground][6]_

This works well because we know that the exact length of the slice we return will be the same as the length of the map, so we can initialize our slice with that length and then assign each element to an appropriate index. The downside to this approach is that we have to keep track of `i` so that we know what index to place every value in.

This leads us to the second approach we are going to cover...

### Use `0` as your length and specify your capacity instead

Rather than keeping track of which index we want to add our values to, we can instead update our `make` call and provide it with two arguments after the slice type. The first, the length of our new slice, will be set to `0`, as we haven't added any new elements to our slice. The second, the capacity of our new slice, will be set to the length of the map parameter because we know that our slice will eventually have that many strings added to it.

This will still construct the same array behind the scenes as the previous example, but now when we call `append` it will know to place items at the start of our slice because the length of the slice is 0.

```
package main

import "fmt"

func main() {  
  fmt.Println(keys(map[string]struct{}{
    "dog": struct{}{},
    "cat": struct{}{},
  }))
}

func keys(m map[string]struct{}) []string {  
  ret := make([]string, 0, len(m))
  for key := range m {
    ret = append(ret, key)
  }
  return ret
}
```

_[Run it on the Go Playground][7]_

### Why do we bother with capacity at all if `append` handles it?

The next thing you might be asking is, "Why are we even telling our program a capacity if the `append` function can handle increasing the capacity of my slice for me?"

The truth is, in most cases you don't need to worry about this too much. If it makes your code significantly more complicated, just initialize your slice with `var vals []int` and let the `append`function handle the heavy lifting for you.

But this case is different. It isn't an instance where declaring the capacity is difficult; In fact, it is actually quite easy to determine what the final capacity of our slice needs to be because we know it will map directly to the provided map. As a result, we can declare the capacity of our slice when we initialize it and save our program from needing to perform unnecessary memory allocations.

If you want to see what the extra memory allocations look like, run the following code on the Go Playground. Every time capacity increases our program needed to do another memory allocation.

```
package main

import "fmt"

func main() {  
  fmt.Println(keys(map[string]struct{}{
    "dog":       struct{}{},
    "cat":       struct{}{},
    "mouse":     struct{}{},
    "wolf":      struct{}{},
    "alligator": struct{}{},
  }))
}

func keys(m map[string]struct{}) []string {  
  var ret []string
  fmt.Println(cap(ret))
  for key := range m {
    ret = append(ret, key)
    fmt.Println(cap(ret))
  }
  return ret
}
```

_[Run it on the Go Playground][8]_

Now compare this to the same code but with a predefined capacity.

```
package main

import "fmt"

func main() {  
  fmt.Println(keys(map[string]struct{}{
    "dog":       struct{}{},
    "cat":       struct{}{},
    "mouse":     struct{}{},
    "wolf":      struct{}{},
    "alligator": struct{}{},
  }))
}

func keys(m map[string]struct{}) []string {  
  ret := make([]string, 0, len(m))
  fmt.Println(cap(ret))
  for key := range m {
    ret = append(ret, key)
    fmt.Println(cap(ret))
  }
  return ret
}
```

_[Run it on the Go Playground][9]_

In the first code sample our capacity starts at `0`, and then increases to `1`, `2`, `4`, and then finally `8`, meaning we had to allocate a new array 5 different times, and on top of that the final array used to back our slice has a capacity of `8`, which is bigger than we ultimately needed.

On the other hand, our second sample starts and ends with the same capacity (`5`) and only needs to allocate it once at the start of the `keys()` function. We also avoid wasting any extra memory and return a slice with the perfect size array backing it.

### Don't over-optimize

As I said before, I typically wouldn't encourage anyone to worry about minor optimizations like this, but in cases where it is really obvious what the final size should be I strongly encourage you to try to set an appropriate capacity or length for your slices.

Not only does it help improve the performance of your application, but it can also help clarify your code a bit by explicitly stating the relationship between the size of your input and the size of your output.

### In summary...

> Hi there! I write a lot about Go, web development, and other topics I find interesting.
> 
> If you want to stay up to date with my writing, please [sign up for my mailing list][10]. I'll send you a FREE sample of my upcoming book, Web Development with Go, and an occasional email when I publish a new article (usually 1-2 per week).
> 
> Oh, and I promise I don't spam. I hate it as much as you do :)

This article is not meant to be an exhaustive discussion on the differences between slices or arrays, but instead is meant to serve as a brief introduction into how capacity and length affect your slices, and what purpose they serve in the grand scheme of things.

For further reading, I highly recommend the following articles from the Go Blog:

*   [Go Slices: usage and internals][11]
*   [Arrays, slices (and strings): The mechanics of 'append'][12]
*   [Slice Tricks][13]

--------------------------------------------------------------------------------

作者简介：

Jon is a software consultant and the author of the book Web Development with Go. Prior to that he founded EasyPost, a Y Combinator backed startup, and worked at Google.
https://www.usegolang.com

--------------------------------------------------------------------------------


via: https://www.calhoun.io/how-to-use-slice-capacity-and-length-in-go

作者：[Jon Calhoun][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.calhoun.io/hire-me
[1]:https://play.golang.org/p/7PgUqBdZ6Z
[2]:https://play.golang.org/p/Np6-NEohm2
[3]:https://play.golang.org/p/M_qaNGVbC-
[4]:https://play.golang.org/p/d6OUulTYM7
[5]:https://play.golang.org/p/JI8Fx3fJCU
[6]:https://play.golang.org/p/kIKxkdX35B
[7]:https://play.golang.org/p/h5hVAHmqJm
[8]:https://play.golang.org/p/fDbAxtAjLF
[9]:https://play.golang.org/p/nwT8X9-7eQ
[10]:https://www.calhoun.io/how-to-use-slice-capacity-and-length-in-go/?utm_source=golangweekly&utm_medium=email#mailing-list-form
[11]:https://blog.golang.org/go-slices-usage-and-internals
[12]:https://blog.golang.org/slices
[13]:https://github.com/golang/go/wiki/SliceTricks
[14]:https://www.calhoun.io/how-to-use-slice-capacity-and-length-in-go/
