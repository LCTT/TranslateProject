[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fatih’s question)
[#]: via: (https://dave.cheney.net/2020/05/16/fatihs-question)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

Fatih’s question
======

A few days ago Fatih posted [this question][1] on twitter.

I’m going to attempt to give my answer, however to do that I need to apply some simplifications as my previous attempts to answer it involved a lot of phrases like _a pointer to a pointer_, and other unhelpful waffling. Hopefully my simplified answer can be useful in building a mental framework to answer Fatih’s original question.

### Restating the question

Fatih’s original tweet showed [four different variations][2] of `json.Unmarshal`. I’m going to focus on the last two, which I’ll rewrite a little:

```
package main

import (
    "encoding/json"
    "fmt"
)

type Result struct {
    Foo string `json:"foo"`
}

func main() {
    content := []byte(`{"foo": "bar"}`)
    var result1, result2 *Result

    err := json.Unmarshal(content, &result1)
    fmt.Println(result1, err) // &{bar} <nil>

    err = json.Unmarshal(content, result2)
    fmt.Println(result2, err) // <nil> json: Unmarshal(nil *main.Result)
}
```

Restated in words, `result1` and `result2` are the same type; `*Result`. Decoding into `result1` works as expected, whereas decoding into `result2` causes the `json` package to complain that the value passed to `Unmarshal` is `nil`. However, both values were declared without an initialiser so both would have taken on the type’s zero value, `nil`.

Eagle eyed readers will have spotted that the reason for the difference is the first` `invocation is passed `&result1`, while the second is passed `result2`, but this explanation is unsatisfactory because the documentation for `json.Unmarshal` states:

> Unmarshal parses the JSON-encoded data and stores the result in the value pointed to by v. **If v is nil or not a pointer**, Unmarshal returns an InvalidUnmarshalError.

Which is confusing because `result1` and `result2` _are_ pointers. Furthermore, without initialisation, both _are_ `nil`. Now, the documentation is correct (as you’d expect from a package that has been hammered on for a decade), but explaining _why_ takes a little more investigation.

### Functions receive a copy of their arguments

Every assignment in Go is a copy, this includes function arguments and return values.

```
package main

import (
    "fmt"
)

func increment(v int) {
    v++
}

func main() {
    v := 1
    increment(v)
    fmt.Println(v) // 1
}
```

In this example, `increment` is operating on a _copy_ of `main`‘s `v`. This is because the `v` declared in `main` and `increment`‘s `v` parameter have different addresses in memory. Thus changes to `increment`‘s `v` cannot affect the contents of `main`‘s `v`.

```
package main

import (
    "fmt"
)

func increment(v *int) {
    *v++
}

func main() {
    v := 1
    increment(&v)
    fmt.Println(v) // 2
}
```

If we wanted to write `increment` in a way that it could affect the contents of its caller we would need to pass a reference, a pointer, to `main.v`.[1][3] This example demonstrates why `json.Unmarshal` needs a pointer to the value to decode JSON into.

### Pointers to pointers

Returning to the original question, both `result1` and `result2` are declared as `*Result`, that is, pointers to a `Result` value. We established that you have to pass the address of caller’s value to `json.Unmarshal` otherwise it won’t be able to alter the contents of the caller’s value. Why then must we pass the address of `result1`, a `**Result`, a pointer to a pointer to a `Result`, for the operation to succeed.

To explain this another detour is required. Consider this code:

```
package main

import (
    "encoding/json"
    "fmt"
)

type Result struct {
    Foo *string `json:"foo"`
}

func main() {
    content := []byte(`{"foo": "bar"}`)
    var result1 *Result

    err := json.Unmarshal(content, &result1)
    fmt.Printf("%#v %v", result1, err) // &main.Result{Foo:(*string)(0xc0000102f0)} <nil>
}
```

In this example `Result` contains a pointer typed field, `Foo *string`. During JSON decoding `Unmarshal` allocated a new `string` value, stored the value `bar` in it, then placed the address of the string in `Result.Foo`. This behaviour is quite handy as it frees the caller from having to initialise `Result.Foo` and makes it easier to detect when a field was not initialised because the JSON did not contain a value. Beyond the convenience this offers for simple examples it would be prohibitively difficult for the caller to properly initialise all the reference type fields in a structure before decoding unknown JSON without first inspecting the incoming JSON which itself may be problematic if the input is coming from an `io.Reader` without the ability to rewind the input.

> To unmarshal JSON into a pointer, Unmarshal first handles the case of the JSON being the JSON literal null. In that case, Unmarshal sets the pointer to nil. Otherwise, Unmarshal unmarshals the JSON into the value pointed at by the pointer. **If the pointer is nil, Unmarshal allocates a new value for it to point to**.

`json.Unmarshal`‘s handling of pointer fields is clearly documented, and works as you would expect, allocating a new value whenever there is a need to decode into a pointer shaped field. It is this behaviour that gives us a hint to what is happening in the original example.

We’ve seen that when `json.Unmarshal` encounters a field which points to `nil` it will allocate a new value of the correct type and assign its address the field before proceeding. Not only is does behaviour is applied recursively–for example in the case of a complex structure which contains pointers to other structures–but it also applies to the _value passed to `Unmarshal`._

```
package main

import (
    "encoding/json"
    "fmt"
)

func main() {
    content := []byte(`1`)
    var result *int

    err := json.Unmarshal(content, &result)
    fmt.Println(*result, err) // 1 <nil>
}
```

In this example `result` is not a struct, but a simple `*int` which, lacking an initialiser, defaults to `nil`. After JSON decoding, `result` now points to an `int` with the value `1`.

### Putting the pieces together

Now I think I’m ready to take a shot at answering Fatih’s question.

`json.Unmarshal` requires the address of the variable you want to decode into, otherwise it would decode into a temporary copy which would be discard on return. Normally this is done by declaring a value, then passing its address, or explicitly initialising the the value

```
var result1 Result
err := json.Unmarshal(content, &result1) // this is fine

var result2 = new(Result)
err = json.Unmarshal(content, result2) // and this

var result3 = &Result{}
err = json.Unmarshal(content, result3) // this is also fine
```

In all three cases the address that the `*Result` points too is not `nil`, it points to initialised memory that `json.Unmarshal` decodes into.

Now consider what happens when `json.Unmarshal` encounters this

```
var result4 *Result
err = json.Unmarshal(content, result4) // err json: Unmarshal(nil *main.Result)
```

`result2`, `result3`, and the expression `&result1` point to a `Result`. However `result4`, even though it has the same type as the previous three, does not point to initialised memory, it points to `nil`. Thus, according to the examples we saw previously, before `json.Unmarshal` can decode into it, the memory `result4` points too must be initialised.

However, because each function receives a copy of its arguments, the caller’s `result4` variable and the copy inside `json.Unmarshal` are unique. `json.Unmarshal` can allocate a new `Result` value and decode into it, but it cannot alter `result4` to point to this new value because it was not provided with a reference to `result4`, only a copy of its contents.

  1. This does not violate the _everything is a copy_ rule, a copy of a pointer to `main.v` still points to `main.v`.[][4]



#### Related posts:

  1. [Should methods be declared on T or *T][5]
  2. [Ice cream makers and data races][6]
  3. [Understand Go pointers in less than 800 words or your money back][7]
  4. [Slices from the ground up][8]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2020/05/16/fatihs-question

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://twitter.com/fatih/status/1260683136842608640
[2]: https://play.golang.org/p/g2yUIYrV67F
[3]: tmp.dRxkHxYRQS#easy-footnote-bottom-1-4153 (This does not violate the <em>everything is a copy</em> rule, a copy of a pointer to <code>main.v</code> still points to <code>main.v</code>.)
[4]: tmp.dRxkHxYRQS#easy-footnote-1-4153
[5]: https://dave.cheney.net/2016/03/19/should-methods-be-declared-on-t-or-t (Should methods be declared on T or *T)
[6]: https://dave.cheney.net/2014/06/27/ice-cream-makers-and-data-races (Ice cream makers and data races)
[7]: https://dave.cheney.net/2017/04/26/understand-go-pointers-in-less-than-800-words-or-your-money-back (Understand Go pointers in less than 800 words or your money back)
[8]: https://dave.cheney.net/2018/07/12/slices-from-the-ground-up (Slices from the ground up)
