[#]: subject: "Crunch numbers in Python with NumPy"
[#]: via: "https://opensource.com/article/21/9/python-numpy"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Crunch numbers in Python with NumPy
======
This article discusses installing NumPy, and then creating, reading, and
sorting NumPy arrays.
![old school calculator][1]

NumPy, or **Num**erical **Py**thon, is a library that makes it easy to do statistical and set operations on linear series and matrices in Python. It is orders of magnitude faster than Python lists, [which I covered in my notes on Python Data Types][2]. NumPy is used quite frequently in data analysis and scientific calculations.

I'm going to go over installing NumPy, and then creating, reading, and sorting NumPy arrays. NumPy arrays are also called _ndarrays_, short for **n-dimensional arrays**.

### Installing NumPy

Installing the NumPy package is really simple using `pip`, and it can be installed just like you would install any other package.


```
pip install numpy
```

With the NumPy package installed, just import it into your Python file.


```
import numpy as np
```

Importing `numpy` as `np` is a standard convention, but instead of using `np` you can use any other alias that you want.

### Why use NumPy? Because it is orders of magnitude faster than Python lists.

NumPy is orders of magnitude faster than normal Python lists when it comes to handling a large number of values. To see exactly how fast it is, I'm going to first measure the time it takes for `min()` and `max()` operations on a normal Python list.

I will first create a Python list with 999,999,999 items.


```
&gt;&gt;&gt; my_list = range(1, 1000000000)
&gt;&gt;&gt; len(my_list)
999999999
```

Now I'll measure the time for finding the minimum value in this list.


```
&gt;&gt;&gt; start = time.time()
&gt;&gt;&gt; min(my_list)
1
&gt;&gt;&gt; print('Time elapsed in milliseconds: ' + str((time.time() - start) * 1000))
Time elapsed in milliseconds: 27007.00879096985
```

That took about 27,007 milliseconds or about **27 seconds**. That’s a long time. Now I'll try to find the time for finding the maximum value.


```
&gt;&gt;&gt; start = time.time()
&gt;&gt;&gt; max(my_list)
999999999
&gt;&gt;&gt; print('Time elapsed in milliseconds: ' + str((time.time() - start) * 1000))
Time elapsed in milliseconds: 28111.071348190308
```

That took about 28,111 milliseconds, which is about **28 seconds**.

Now I'll try to find the time to find the minimum and maximum value using NumPy.


```
&gt;&gt;&gt; my_list = np.arange(1, 1000000000)
&gt;&gt;&gt; len(my_list)
999999999
&gt;&gt;&gt; start = time.time()
&gt;&gt;&gt; my_list.min()
1
&gt;&gt;&gt; print('Time elapsed in milliseconds: ' + str((time.time() - start) * 1000))
Time elapsed in milliseconds: 1151.1778831481934
&gt;&gt;&gt;
&gt;&gt;&gt; start = time.time()
&gt;&gt;&gt; my_list.max()
999999999
&gt;&gt;&gt; print('Time elapsed in milliseconds: ' + str((time.time() - start) * 1000))
Time elapsed in milliseconds: 1114.8970127105713
```

That took about 1151 milliseconds for finding the minimum value, and 1114 milliseconds for finding the maximum value. These are around **1 second**.

As you can see, using NumPy reduces the time to find the minimum and maximum of a list of around a billion values **from around 28 seconds to 1 second**. This is the power of NumPy.

### Creating ndarrays using Python lists

There are several ways to create an ndarray in NumPy.

You can create an ndarray by using a list of elements.


```
&gt;&gt;&gt; my_ndarray = np.array([1, 2, 3, 4, 5])
&gt;&gt;&gt; print(my_ndarray)
[1 2 3 4 5]
```

With the above ndarray defined, I'll check out a few things. First, the type of the variable defined above is `numpy.ndarray`. This is the type of all NumPy ndarrays.


```
&gt;&gt;&gt; type(my_ndarray)
&lt;class 'numpy.ndarray'&gt;
```

Another thing to note here would be _shape_. The shape of an ndarray is the length of each dimension of the ndarray. As you can see, the shape of `my_ndarray` is `(5,)`. This means that `my_ndarray` contains one dimension with 5 elements.


```
&gt;&gt;&gt; np.shape(my_ndarray)
(5,)
```

The number of dimensions in the array is called its _rank_. So the above ndarray has a rank of 1.

I'll define another ndarray `my_ndarray2` as a multi-dimensional ndarray. What will its shape be then? See below.


```
&gt;&gt;&gt; my_ndarray2 = np.array([(1, 2, 3), (4, 5, 6)])
&gt;&gt;&gt; np.shape(my_ndarray2)
(2, 3)
```

This is a rank 2 ndarray. Another attribute to check is the `dtype`, which is the data type. Checking the `dtype` for our ndarray gives us the following:


```
&gt;&gt;&gt; my_ndarray.dtype
dtype('int64')
```

The `int64` means that our ndarray is made up of 64-bit integers. NumPy cannot create an ndarray of mixed types, and must contain only one type of element. If you define an ndarray containing a mix of element types, NumPy will automatically typecast all the elements to the highest element type available that can contain all the elements.

For example, creating a mix of `int`s and `float`s will create a `float64` ndarray.


```
&gt;&gt;&gt; my_ndarray2 = np.array([1, 2.0, 3])
&gt;&gt;&gt; print(my_ndarray2)
[1. 2. 3.]
&gt;&gt;&gt; my_ndarray2.dtype
dtype('float64')
```

Also, setting one of the elements as `string` will create string ndarray of `dtype` equal to `<U21`, meaning our ndarray contains unicode strings.


```
&gt;&gt;&gt; my_ndarray2 = np.array([1, '2', 3])
&gt;&gt;&gt; print(my_ndarray2)
['1' '2' '3']
&gt;&gt;&gt; my_ndarray2.dtype
dtype('&lt;U21')
```

The `size` attribute will show the total number of elements that are present in our ndarray.


```
&gt;&gt;&gt; my_ndarray = np.array([1, 2, 3, 4, 5])
&gt;&gt;&gt; my_ndarray.size
5
```

### Creating ndarrays using NumPy methods

There are several NumPy methods available for creating ndarrays in case you don’t want to create them directly using a list.

You can use `np.zeros()`  to create an ndarray full of zeroes. It takes a shape as a parameter, which is a list containing the number of rows and columns. It can also take an optional `dtype` parameter which is the data type of the ndarray.


```
&gt;&gt;&gt; my_ndarray = np.zeros([2,3], dtype=int)
&gt;&gt;&gt; print(my_ndarray)
[[0 0 0]
 [0 0 0]]
```

You can use `np.ones()` to create an ndarray full of ones.


```
&gt;&gt;&gt; my_ndarray = np.ones([2,3], dtype=int)
&gt;&gt;&gt; print(my_ndarray)
[[1 1 1]
 [1 1 1]]
```

You can use `np.full()` to fill an ndarray with a specific value.


```
&gt;&gt;&gt; my_ndarray = np.full([2,3], 10, dtype=int)
&gt;&gt;&gt; print(my_ndarray)
[[10 10 10]
 [10 10 10]]
```

You can use `np.eye()` to create an identity matrix/ndarray, which is a square matrix with ones all along the main diagonal. A square matrix is a matrix with the same number of rows and columns.


```
&gt;&gt;&gt; my_ndarray = np.eye(3, dtype=int)
&gt;&gt;&gt; print(my_ndarray)
[[1 0 0]
 [0 1 0]
 [0 0 1]]
```

You can use `np.diag()` to create a matrix with the specified values along the diagonal, and zeroes in the rest of the matrix.


```
&gt;&gt;&gt; my_ndarray = np.diag([10, 20, 30, 40, 50])
&gt;&gt;&gt; print(my_ndarray)
[[10  0  0  0  0]
 [ 0 20  0  0  0]
 [ 0  0 30  0  0]
 [ 0  0  0 40  0]
 [ 0  0  0  0 50]]
```

You can use `np.arange()` to create an ndarray with a specific range of values. It is used by specifying a start and end (exclusive) range of integers and a step size.


```
&gt;&gt;&gt; my_ndarray = np.arange(1, 20, 3)
&gt;&gt;&gt; print(my_ndarray)
[ 1  4  7 10 13 16 19]
```

### Reading ndarrays

The values of an ndarray can be read using indexing, slicing, or boolean indexing.

#### Reading ndarrays using indexing

In indexing, you can read the values using the integer indices of the elements of the ndarray, much like you would read a Python list. Just like Python lists, the indices start from zero.

For example, in the ndarray defined as below:


```
&gt;&gt;&gt; my_ndarray = np.arange(1, 20, 3)
```

The fourth value will be `my_ndarray[3]`, or `10`. The last value will be `my_ndarray[-1]`, or `19`.


```
&gt;&gt;&gt; my_ndarray = np.arange(1, 20, 3)
&gt;&gt;&gt; print(my_ndarray[0])
1
&gt;&gt;&gt; print(my_ndarray[3])
10
&gt;&gt;&gt; print(my_ndarray[-1])
19
&gt;&gt;&gt; print(my_ndarray[5])
16
&gt;&gt;&gt; print(my_ndarray[6])
19
```

#### Reading ndarrays using slicing

You can also use slicing to read chunks of the ndarray. Slicing works by specifying a start index and an end index using a colon (`:`) operator. Python will then fetch the slice of the ndarray between that start and end index.


```
&gt;&gt;&gt; print(my_ndarray[:])
[ 1  4  7 10 13 16 19]
&gt;&gt;&gt; print(my_ndarray[2:4])
[ 7 10]
&gt;&gt;&gt; print(my_ndarray[5:6])
[16]
&gt;&gt;&gt; print(my_ndarray[6:7])
[19]
&gt;&gt;&gt; print(my_ndarray[:-1])
[ 1  4  7 10 13 16]
&gt;&gt;&gt; print(my_ndarray[-1:])
[19]
```

Slicing creates a reference, or view, of an ndarray. This means that modifying the values in a slice will also change the values of the original ndarray.

For example:


```
&gt;&gt;&gt; my_ndarray[-1:] = 100
&gt;&gt;&gt; print(my_ndarray)
[  1   4   7  10  13  16 100]
```

For slicing ndarrays with rank more than 1, the `[row-start-index:row-end-index, column-start-index:column-end-index]` syntax can be used.


```
&gt;&gt;&gt; my_ndarray2 = np.array([(1, 2, 3), (4, 5, 6)])
&gt;&gt;&gt; print(my_ndarray2)
[[1 2 3]
 [4 5 6]]
&gt;&gt;&gt; print(my_ndarray2[0:2,1:3])
[[2 3]
 [5 6]]
```

#### Reading ndarrays using boolean indexing

Another way to read ndarrays is using boolean indexing. In this method, you specify a filtering condition within square brackets and a section of the ndarray that matches that criteria is returned.

For example, to get all the values in an ndarray greater than 5, you might specify a boolean indexing operation as `my_ndarray[my_ndarray > 5]`. This operation will return an ndarray that contains all values greater than 5.


```
&gt;&gt;&gt; my_ndarray = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
&gt;&gt;&gt; my_ndarray2 = my_ndarray[my_ndarray &gt; 5]
&gt;&gt;&gt; print(my_ndarray2)
[ 6  7  8  9 10]
```

For example, to get all the even values in an ndarray, you might use a boolean indexing operation as follows:


```
&gt;&gt;&gt; my_ndarray2 = my_ndarray[my_ndarray % 2 == 0]
&gt;&gt;&gt; print(my_ndarray2)
[ 2  4  6  8 10]
```

And to get all the odd values, you might use this:


```
&gt;&gt;&gt; my_ndarray2 = my_ndarray[my_ndarray % 2 == 1]
&gt;&gt;&gt; print(my_ndarray2)
[1 3 5 7 9]
```

### Vector and scalar arithmetic with ndarrays

NumPy ndarrays allow vector and scalar arithmetic operations. In vector arithmetic, an element-wise arithmetic operation is performed between two ndarrays. In scalar arithmetic, an arithmetic operation is performed between an ndarray and a constant scalar value.

Consider the two ndarrays below.


```
&gt;&gt;&gt; my_ndarray = np.array([1, 2, 3, 4, 5])
&gt;&gt;&gt; my_ndarray2 = np.array([6, 7, 8, 9, 10])
```

If you add the above two ndarrays, it would produce a new ndarray where each element of the two ndarrays would be added. For example, the first element of the resultant ndarray would be the result of adding the first elements of the original ndarrays, and so on.


```
&gt;&gt;&gt; print(my_ndarray2 + my_ndarray)
[ 7  9 11 13 15]
```

Here, `7` is the sum of `1` and `6`, which are the first two elements of the ndarrays I've added together. Similarly, `15` is the sum of `5` and `10`, which are the last elements.

Consider the following arithmetic operations:


```
&gt;&gt;&gt; print(my_ndarray2 - my_ndarray)
[5 5 5 5 5]
&gt;&gt;&gt;
&gt;&gt;&gt; print(my_ndarray2 * my_ndarray)
[ 6 14 24 36 50]
&gt;&gt;&gt;
&gt;&gt;&gt; print(my_ndarray2 / my_ndarray)
[6.         3.5        2.66666667 2.25       2.        ]
```

Adding a scalar value to an ndarray has a similar effect—the scalar value is added to all the elements of the ndarray. This is called _broadcasting_.


```
&gt;&gt;&gt; print(my_ndarray + 10)
[11 12 13 14 15]
&gt;&gt;&gt;
&gt;&gt;&gt; print(my_ndarray - 10)
[-9 -8 -7 -6 -5]
&gt;&gt;&gt;
&gt;&gt;&gt; print(my_ndarray * 10)
[10 20 30 40 50]
&gt;&gt;&gt;
&gt;&gt;&gt; print(my_ndarray / 10)
[0.1 0.2 0.3 0.4 0.5]
```

### Sorting ndarrays

There are two ways available to sort ndarrays—in-place or out-of-place. In-place sorting sorts and modifies the original ndarray, and out-of-place sorting will return the sorted ndarray but not modify the original one. I'll try out both examples.


```
&gt;&gt;&gt; my_ndarray = np.array([3, 1, 2, 5, 4])
&gt;&gt;&gt; my_ndarray.sort()
&gt;&gt;&gt; print(my_ndarray)
[1 2 3 4 5]
```

As you can see, the `sort()` method sorts the ndarray in-place and modifies the original array.

There is another method called `np.sort()` which sorts the array out of place.


```
&gt;&gt;&gt; my_ndarray = np.array([3, 1, 2, 5, 4])
&gt;&gt;&gt; print(np.sort(my_ndarray))
[1 2 3 4 5]
&gt;&gt;&gt; print(my_ndarray)
[3 1 2 5 4]
```

As you can see, the `np.sort()` method returns a sorted ndarray but does not modify it.

### Conclusion

I've covered quite a bit about NumPy and ndarrays. I talked about creating ndarrays, the different ways of reading them, basic vector and scalar arithmetic, and sorting. There is a lot more to explore with NumPy, including set operations like `union()` and `intersection()`, statistical operations like `min()` and `max()`, etc.

I hope the examples I demonstrated above were useful. Have fun exploring NumPy.

* * *

_This article was originally published on the [author's personal blog][3] and has been adapted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/python-numpy

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/math_money_financial_calculator_colors.jpg?itok=_yEVTST1 (old school calculator)
[2]: https://notes.ayushsharma.in/2018/09/data-types-in-python
[3]: https://notes.ayushsharma.in/2018/10/working-with-numpy-in-python
