ucasFL translating

Top 3 Python libraries for data science
======
Turn Python into a scientific data analysis and modeling tool with these libraries.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr)

Python's many attractions—such as efficiency, code readability, and speed—have made it the go-to programming language for data science enthusiasts. Python is usually the preferred choice for data scientists and machine learning experts who want to escalate the functionalities of their applications. (For example, Andrey Bulezyuk used the Python programming language to create an amazing [machine learning application][1].)

Because of its extensive usage, Python has a huge number of libraries that make it easier for data scientists to complete complicated tasks without many coding hassles. Here are the top 3 Python libraries for data science; check them out if you want to kickstart your career in the field.

### 1\. NumPy

[NumPy][2] (short for Numerical Python) is one of the top libraries equipped with useful resources to help data scientists turn Python into a powerful scientific analysis and modelling tool. The popular open source library is available under the BSD license. It is the foundational Python library for performing tasks in scientific computing. NumPy is part of a bigger Python-based ecosystem of open source tools called SciPy.

The library empowers Python with substantial data structures for effortlessly performing multi-dimensional arrays and matrices calculations. Besides its uses in solving linear algebra equations and other mathematical calculations, NumPy is also used as a versatile multi-dimensional container for different types of generic data.

Furthermore, it integrates flawlessly with other programming languages like C/C++ and Fortran. The versatility of the NumPy library allows it to easily and swiftly coalesce with an extensive range of databases and tools. For example, let's see how NumPy (abbreviated **np** ) can be used for multiplying two matrices.

Let's start by importing the library (we'll be using the Jupyter notebook for these examples).

```
import numpy as np
```

Next, let's use the **eye()** function to generate an identity matrix with the stipulated dimensions.

```
matrix_one = np.eye(3)
matrix_one
```

Here is the output:

```
array([[1., 0., 0.],
       [0., 1., 0.],
       [0., 0., 1.]])
```

Let's generate another 3x3 matrix.

We'll use the **arange([starting number], [stopping number])** function to arrange numbers. Note that the first parameter in the function is the initial number to be listed and the last number is not included in the generated results.

Also, the **reshape()** function is applied to modify the dimensions of the originally generated matrix into the desired dimension. For the matrices to be  "multiply-able," they should be of the same dimension.

```
matrix_two = np.arange(1,10).reshape(3,3)
matrix_two
```

Here is the output:

```
array([[1, 2, 3],
       [4, 5, 6],
       [7, 8, 9]])
```

Let's use the **dot()** function to multiply the two matrices.

```
matrix_multiply = np.dot(matrix_one, matrix_two)

matrix_multiply

```

Here is the output:

```
array([[1., 2., 3.],
       [4., 5., 6.],
       [7., 8., 9.]])
```

Great!

We managed to multiply two matrices without using vanilla Python.

Here is the entire code for this example:

```
import numpy as np
#generating a 3 by 3 identity matrix
matrix_one = np.eye(3)
matrix_one
#generating another 3 by 3 matrix for multiplication
matrix_two = np.arange(1,10).reshape(3,3)
matrix_two
#multiplying the two arrays
matrix_multiply = np.dot(matrix_one, matrix_two)
matrix_multiply
```

### 2\. Pandas

[Pandas][3] is another great library that can enhance your Python skills for data science. Just like NumPy, it belongs to the family of SciPy open source software and is available under the BSD free software license.

Pandas offers versatile and powerful tools for munging data structures and performing extensive data analysis. The library works well with incomplete, unstructured, and unordered real-world data—and comes with tools for shaping, aggregating, analyzing, and visualizing datasets.

There are three types of data structures in this library:

  * Series: single-dimensional, homogeneous array
  * DataFrame: two-dimensional with heterogeneously typed columns
  * Panel: three-dimensional, size-mutable array



For example, let's see how the Panda Python library (abbreviated **pd** ) can be used for performing some descriptive statistical calculations.

Let's start by importing the library.

```
import pandas as pd
```

Let's create a dictionary of series.

```
d = {'Name':pd.Series(['Alfrick','Michael','Wendy','Paul','Dusan','George','Andreas',
   'Irene','Sagar','Simon','James','Rose']),
   'Years of Experience':pd.Series([5,9,1,4,3,4,7,9,6,8,3,1]),
   'Programming Language':pd.Series(['Python','JavaScript','PHP','C++','Java','Scala','React','Ruby','Angular','PHP','Python','JavaScript'])
    }
```

Let's create a DataFrame.

```
df = pd.DataFrame(d)
```

Here is a nice table of the output:

```
      Name Programming Language  Years of Experience
0   Alfrick               Python                    5
1   Michael           JavaScript                    9
2     Wendy                  PHP                    1
3      Paul                  C++                    4
4     Dusan                 Java                    3
5    George                Scala                    4
6   Andreas                React                    7
7     Irene                 Ruby                    9
8     Sagar              Angular                    6
9     Simon                  PHP                    8
10    James               Python                    3
11     Rose           JavaScript                    1
```

Here is the entire code for this example:

```
import pandas as pd
#creating a dictionary of series
d = {'Name':pd.Series(['Alfrick','Michael','Wendy','Paul','Dusan','George','Andreas',
   'Irene','Sagar','Simon','James','Rose']),
   'Years of Experience':pd.Series([5,9,1,4,3,4,7,9,6,8,3,1]),
   'Programming Language':pd.Series(['Python','JavaScript','PHP','C++','Java','Scala','React','Ruby','Angular','PHP','Python','JavaScript'])
    }

#Create a DataFrame
df = pd.DataFrame(d)
print(df)
```

### 3\. Matplotlib

[Matplotlib][4] is also part of the SciPy core packages and offered under the BSD license. It is a popular Python scientific library used for producing simple and powerful visualizations. You can use the Python framework for data science for generating creative graphs, charts, histograms, and other shapes and figures—without worrying about writing many lines of code. For example, let's see how the Matplotlib library can be used to create a simple bar chart.

Let's start by importing the library.

```
from matplotlib import pyplot as plt
```

Let's generate values for both the x-axis and the y-axis.

```
x = [2, 4, 6, 8, 10]
y = [10, 11, 6, 7, 4]
```

Let's call the function for plotting the bar chart.

```
plt.bar(x,y)
```

Let's show the plot.

```
plt.show()
```

Here is the bar chart:

![](https://opensource.com/sites/default/files/uploads/matplotlib_barchart.png)

Here is the entire code for this example:

```
#importing Matplotlib Python library
from matplotlib import pyplot as plt
#same as import matplotlib.pyplot as plt
 
#generating values for x-axis
x = [2, 4, 6, 8, 10]
 
#generating vaues for y-axis
y = [10, 11, 6, 7, 4]
 
#calling function for plotting the bar chart
plt.bar(x,y)
 
#showing the plot
plt.show()
```

### Wrapping up

The Python programming language has always done a good job in data crunching and preparation, but less so for complicated scientific data analysis and modeling. The top Python frameworks for [data science][5] help fill this gap, allowing you to carry out complex mathematical computations and create sophisticated models that make sense of your data.

Which other Python data-mining libraries do you know? What's your experience with them? Please share your comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/top-3-python-libraries-data-science

作者：[Dr.Michael J.Garbade][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/drmjg
[1]: https://www.liveedu.tv/andreybu/REaxr-machine-learning-model-python-sklearn-kera/oPGdP-machine-learning-model-python-sklearn-kera/
[2]: http://www.numpy.org/
[3]: http://pandas.pydata.org/
[4]: https://matplotlib.org/
[5]: https://www.liveedu.tv/guides/data-science/
