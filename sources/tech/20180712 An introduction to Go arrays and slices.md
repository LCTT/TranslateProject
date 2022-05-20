[#]: subject: "An introduction to Go arrays and slices"
[#]: via: "https://opensource.com/article/18/7/introduction-go-arrays-and-slices"
[#]: author: "Mihalis Tsoukalos https://opensource.com/users/mtsouk"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

An introduction to Go arrays and slices
======
Learn the pros and cons of storing data in Go using arrays and slices and why one is usually better than the other.

![Testing certificate chains with a 34-line Go program][1]

Image by: carrotmadman6. Modified by Opensource.com. CC BY-SA 2.0

In this fourth article in the series, I will explain [Go][5] arrays and slices, how to use them, and why you'll usually want to choose one over the other.

### Arrays

Arrays are one of the most popular data structures among programming languages for two main reasons: They are simple and easy to understand, and they can store many different kinds of data.

You can declare a Go array named `anArray` that stores four integers with the following:

```
anArray := [4]int{-1, 2, 0, -4}
```

The array's size should be stated before its type, which should be defined before its elements. The `len()` function can help you find the length of any array. The size of the array above is 4.

If you are familiar with other programming languages, you might try to access all the elements of an array using a `for` loop. However, as you will see below, Go's `range` keyword allows you to access all the elements of an array or a slice in a more elegant way.

Last, here is how you can define an array with two dimensions:

```
twoD := [3][3]int{
    {1, 2, 3},
    {6, 7, 8},
    {10, 11, 12}}
```

The `arrays.go` source file explains the use of Go arrays. The most important code in `arrays.go` is:

```
for i := 0; i < len(twoD); i++ {
        k := twoD[i]
        for j := 0; j < len(k); j++ {
                fmt.Print(k[j], " ")
        }
        fmt.Println()
}

for _, a := range twoD {
        for _, j := range a {
                fmt.Print(j, " ")
        }
        fmt.Println()
}
```

This shows how you can iterate over the elements of an array using a `for` loop and the `range` keyword. The rest of the code of `arrays.go` shows how to pass an array into a function as a parameter.

Following is the output of `arrays.go` :

```
$ go run arrays.go
Before change(): [-1 2 0 -4]
After change(): [-1 2 0 -4]
1 2 3
6 7 8
10 11 12
1 2 3
6 7 8
10 11 12
```

This output demonstrates that the changes you make to an array inside a function are lost after the function exits.

### Disadvantages of arrays

Go arrays have many disadvantages that will make you reconsider using them in your Go projects. First, you can't change the size of an array after you define it, which means Go arrays are not dynamic. Putting it simply, if you need to add an element to an array that doesn't have any space left, you will need to create a bigger array and copy all the elements of the old array to the new one. Second, when you pass an array to a function as a parameter, you actually pass a copy of the array, which means any changes you make to an array inside a function will be lost after the function exits. Last, passing a large array to a function can be pretty slow, mostly because Go has to create a copy of the array.

The solution to all these problems is to use Go slices.

### Slices

A Go slice is similar to a Go array without the shortcomings. First, you can add an element to an existing slice using the `append()` function. Moreover, Go slices are implemented internally using arrays, which means Go uses an underlying array for each slice.

Slices have a *capacity* property and a *length* property, which are not always the same. The length of a slice is the same as the length of an array with the same number of elements, and it can be found using the `len()` function. The capacity of a slice is the room that has currently been allocated for the slice, and it can be found with the `cap()` function.

As slices are dynamic in size, if a slice runs out of room (which means the current length of the array is the same as its capacity while you are trying to add another element to the array), Go automatically doubles its current capacity to make room for more elements and adds the requested element to the array.

Additionally, slices are passed by reference to functions, which means what is actually passed to a function is the memory address of the slice variable, and any modifications you make to a slice inside a function won't get lost after the function exits. As a result, passing a big slice to a function is significantly faster than passing an array with the same number of elements to the same function. This is because Go will not have to make a copy of the slice—it will just pass the memory address of the slice variable.

Go slices are illustrated in `slice.go`, which contains the following code:

```
package main

import (
        "fmt"
)

func negative(x []int) {
        for i, k := range x {
                x[i] = -k
        }
}

func printSlice(x []int) {
        for _, number := range x {
                fmt.Printf("%d ", number)
        }
        fmt.Println()
}

func main() {
        s := []int{0, 14, 5, 0, 7, 19}
        printSlice(s)
        negative(s)
        printSlice(s)

        fmt.Printf("Before. Cap: %d, length: %d\n", cap(s), len(s))
        s = append(s, -100)
        fmt.Printf("After. Cap: %d, length: %d\n", cap(s), len(s))
        printSlice(s)

        anotherSlice := make([]int, 4)
        fmt.Printf("A new slice with 4 elements: ")
        printSlice(anotherSlice)
}
```

The biggest difference between a slice definition and an array definition is that you do not need to specify the size of the slice, which is determined by the number of elements you want to put in it. Additionally, the `append()` function allows you to add an element to an existing slice—notice that even if the capacity of a slice allows you to add an element to that slice, its length will not be modified unless you call `append()`. The `printSlice()` function is a helper function used for printing the elements of its slice parameter, whereas the `negative()` function processes all the elements of its slice parameter.

The output of `slice.go` is:

```
$ go run slice.go
0 14 5 0 7 19
0 -14 -5 0 -7 -19
Before. Cap: 6, length: 6
After. Cap: 12, length: 7
0 -14 -5 0 -7 -19 -100
A new slice with 4 elements: 0 0 0 0
```

Please note that when you create a new slice and allocate memory space for a given number of elements, Go will automatically initialize all the elements to the zero value of its type, which in this case is 0.

### Referencing arrays with slices

Go allows you to reference an existing array with a slice using the `[:]` notation. In that case, any changes you make into a slice's function will be propagated to the array—this is illustrated in `refArray.go`. Please remember that the `[:]` notation does not create a copy of the array, just a reference to it.

The most interesting part of `refArray.go` is:

```
func main() {
        anArray := [5]int{-1, 2, -3, 4, -5}
        refAnArray := anArray[:]

        fmt.Println("Array:", anArray)
        printSlice(refAnArray)
        negative(refAnArray)
        fmt.Println("Array:", anArray)
}
```

The output of `refArray.go` is:

```
$ go run refArray.go
Array: [-1 2 -3 4 -5]
-1 2 -3 4 -5
Array: [1 -2 3 -4 5]
```

So, the elements of the `anArray` array changed because of the slice reference to it.

### Summary

Although Go supports both arrays and slices, it should be clear by now that you will most likely use slices because they are more versatile and powerful than Go arrays. There are only a few occasions where you will need to use an array instead of a slice. The most obvious one is when you are absolutely sure that you will need to store a fixed number of elements.

You can find the Go code of `arrays.go`, `slice.go`, and `refArray.go` at [GitHub][6].

If you have any questions or feedback, please leave a comment below or reach out to me on [Twitter][7].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/introduction-go-arrays-and-slices

作者：[Mihalis Tsoukalos][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mtsouk
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/traffic-light-go.png
[2]: https://opensource.com/article/18/5/creating-random-secure-passwords-go
[3]: https://opensource.com/article/18/5/building-concurrent-tcp-server-go
[4]: https://opensource.com/article/18/6/copying-files-go
[5]: https://golang.org/
[6]: https://github.com/mactsouk/opensource.com
[7]: https://twitter.com/mactsouk
