[#]: subject: "The Functions in the R Stats Package"
[#]: via: "https://www.opensourceforu.com/2022/08/the-functions-in-the-r-stats-package/"
[#]: author: "Shakthi Kannan https://www.opensourceforu.com/author/shakthi-kannan/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

The Functions in the R Stats Package
======
We have learnt the basics of the R programming language, its syntax and semantics, and are now ready to delve into the statistics domain using R. In this eleventh article in the R series, we will learn to use the statistics functions available in the R stats package.

As we have done in the earlier parts of this series, we are going to use the R version 4.1.2 installed on Parabola GNU/Linux-libre (x86-64) for the code snippets.

```
$ R --version
R version 4.1.2 (2021-11-01) -- “Bird Hippie”
Copyright (C) 2021 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under the terms of the
GNU General Public License versions 2 or 3.
For more information about these matters see https://www.gnu.org/licenses/
```

### Mean

The R function for calculating the arithmetic mean is mean. It accepts an R object ‘x’ as an argument, and a ‘trim’ option to trim any fractions before computing the mean value. The ‘na.rm’ logical argument can be used to ignore any NA values. Its syntax is as follows:

```
mean(x, trim = 0, na.rm = FALSE, ...)
```

The function supports numerical and logical values, as well as date and time intervals. A few examples for the mean function are given below:

```
> mean(c(1, 2, 3))
2

> mean(c(1:5, 10, 20))
6.428571

> mean(c(FALSE, TRUE, FALSE))
0.3333333

> mean(c(TRUE, TRUE, TRUE))
1
```

Consider the ‘Bank Marketing Data Set’ for a Portuguese banking institution that is available from the UCI Machine Learning Repository available at *https://archive.ics.uci.edu/ml/datasets/Bank+Marketing*. The data can be used for public research. There are four data sets available, and we will use the read.*csv()* function to import the data from a ‘bank*.csv*’ file.

```
> bank <- read.csv(file=”bank.csv”, sep=”;”)

> bank[1:3,]
  age        job marital education default balance housing loan  contact day
1  30 unemployed married   primary      no    1787      no   no cellular  19
2  33   services married secondary      no    4789     yes  yes cellular  11
3  35 management  single  tertiary      no    1350     yes   no cellular  16
  month duration campaign pdays previous poutcome  y
1   oct       79        1    -1        0  unknown no
2   may      220        1   339        4  failure no
3   apr      185        1   330        1  failure no
```

We can find the mean age from the bank data as follows:

```
> mean(bank$age)
41.1701
```

### Median

The *median* function in the R stats package computes the sample median. It accepts a numeric vector ‘x’, and a logical value ‘na.rm’ to indicate if it should discard ‘NA’ values before computing the median. Its syntax is as follows:

```
median(x, na.rm = FALSE, ...)
```

A couple of examples are given below:

```
> median(3:5)
4
> median(c(3:5, 50, 150))
[1] 5
```

We can now find the median age from the bank data set as follows:

```
> median(bank$age)
39
```

### Pair

The*pair* function can be used to combine two vectors. It accepts two arguments, and vectors ‘x’ and ‘y’. Both the vectors should have the same length. The syntax is as follows:

```
Pair(x, y)
```

The function returns a two column matrix of class ‘Pair’. An example is given below:

```
> Pair(c(1,2,3), c(4,5,6))
     x y
[1,] 1 4
[2,] 2 5
[3,] 3 6
attr(,”class”)
[1] “Pair”
```

The function is used for paired tests such as *t.test* and *wilcox.test*.

### dist

The *dist* function is used to calculate the distance matrix for the rows in a data matrix, and accepts the following arguments:

| Argument | Description | 
| :- | :- |
| x | A numeric matrix | 
| method | The distance measure to be used | 
| diag | Prints diagonal of distance matrix if TRUE | 
| upper | Prints upper triangle of distance matrix if TRUE | 
| p | Power of the Minkowski distance |

The distance measurement methods supported are: ‘euclidean’, ‘maximum’, ‘manhattan’, ‘canberra’, ‘binary’ and ‘minkowski’. The distance measurement for the age data set using the Euclidean distance is given below:

```
> dist(bank$age, method=”euclidean”, diag=FALSE, upper=FALSE, p=2)
      1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
2     3                                                                        
3     5  2                                                                     
4     0  3  5                                                                  
5    29 26 24 29                                                               
6     5  2  0  5 24                                                            
7     6  3  1  6 23  1                                                         
8     9  6  4  9 20  4  3                                                      
9    11  8  6 11 18  6  5  2                                                   
10   13 10  8 13 16  8  7  4  2                                                
11    9  6  4  9 20  4  3  0  2  4                                             
12   13 10  8 13 16  8  7  4  2  0  4                                          
13    6  3  1  6 23  1  0  3  5  7  3  7                                       
14   10 13 15 10 39 15 16 19 21 23 19 23 16                                    
15    1  2  4  1 28  4  5  8 10 12  8 12  5 11                                 
16   10  7  5 10 19  5  4  1  1  3  1  3  4 20  9                              
17   26 23 21 26  3 21 20 17 15 13 17 13 20 36 25 16                           
18    7  4  2  7 22  2  1  2  4  6  2  6  1 17  6  3 19                        
19    5  8 10  5 34 10 11 14 16 18 14 18 11  5  6 15 31 12                     
20    1  2  4  1 28  4  5  8 10 12  8 12  5 11  0  9 25  6  6                  
21    8  5  3  8 21  3  2  1  3  5  1  5  2 18  7  2 18  1 13  7               
22   12  9  7 12 17  7  6  3  1  1  3  1  6 22 11  2 14  5 17 11  4            
23   14 11  9 14 15  9  8  5  3  1  5  1  8 24 13  4 12  7 19 13  6  2         
     26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50
...
```

The binary distance measurement output for the same bank age data is as follows:

```
> dist(bank$age, method=”binary”, diag=FALSE, upper=FALSE, p=2)
     1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28
2    0                                                                         
3    0 0                                                                       
4    0 0 0                                                                     
5    0 0 0 0                                                                   
6    0 0 0 0 0                                                                 
7    0 0 0 0 0 0                                                               
8    0 0 0 0 0 0 0                                                             
9    0 0 0 0 0 0 0 0                                                           
10   0 0 0 0 0 0 0 0 0                                                         
11   0 0 0 0 0 0 0 0 0  0                                                      
12   0 0 0 0 0 0 0 0 0  0  0                                                   
13   0 0 0 0 0 0 0 0 0  0  0  0                                                
14   0 0 0 0 0 0 0 0 0  0  0  0  0                                             
15   0 0 0 0 0 0 0 0 0  0  0  0  0  0                                          
16   0 0 0 0 0 0 0 0 0  0  0  0  0  0  0                                       
17   0 0 0 0 0 0 0 0 0  0  0  0  0  0  0  0                                    
18   0 0 0 0 0 0 0 0 0  0  0  0  0  0  0  0  0                                 
19   0 0 0 0 0 0 0 0 0  0  0  0  0  0  0  0  0  0                              
20   0 0 0 0 0 0 0 0 0  0  0  0  0  0  0  0  0  0  0                           
21   0 0 0 0 0 0 0 0 0  0  0  0  0  0  0  0  0  0  0  0                        
22   0 0 0 0 0 0 0 0 0  0  0  0  0  0  0  0  0  0  0  0  0                     
23   0 0 0 0 0 0 0 0 0  0  0  0  0  0  0  0  0  0  0  0  0  0                  
     29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53
```

### Quantile

The quantiles can be generated for a numeric vector ‘x’ along with their given probabilities using the quantile function. The ‘NA’ and ‘NaN’ values are not allowed in the vector, unless ‘na.rm’ is set to TRUE. The probability of 0 is for the lowest observation and 1 for the highest. Its syntax is as follows:

```
quantile(x, ...)
```

The quantile function accepts the following arguments:

| Argument | Description | 
| :- | :- |
| x | A numeric vector | 
| probs | A vector of probabilities between 0 and 1 | 
| na.rm | NA and NaN values are ignored if TRUE | 
| names | If TRUE, the result has the names attribute | 
| type | An integer to select any of the nine quantile algorithms | 
| digits | The decimal precision to use | 
| … | Additional arguments passed to or from other methods |

The *rnorm* function can be used to generate random values for the normal distribution. It can take ‘n’ number of observations, a vector of ‘means’, and a vector ‘sd’ of standard deviations as its arguments. We can obtain the quantiles for the values produced by the ‘rnorm’ function. For example:

```
> quantile(x <- rnorm(100))
    0%          25%          50%          75%         100% 
-1.978171612 -0.746829079 -0.009440368  0.698271134  1.897942805
```

The quantiles for bank age data with the following probabilities can be generated as follows:

```
> quantile(bank$age, probs = c(0.1, 0.5, 1, 2, 5, 10, 50)/100)
0.1% 0.5%   1%   2%   5%  10%  50% 
20.0 22.6 24.0 25.0 27.0 29.0 39.0
```

### Interquartile range

The *IQR* function computes the interquartile range for the numeric values of a vector. Its syntax is as follows:

```
IQR(x, na.rm = FALSE, type = 7)
```

The ‘type’ argument specifies an integer to select the quantile algorithm, which is discussed in Hyndman and Fan (1996). The interquartile range for the bank age can be computed as shown below:

```
> IQR(bank$age, na.rm = FALSE, type=7)
16
```

### Standard deviation

The *sd* function is used to calculate the standard deviation for a set of values. It accepts a numeric vector ‘x’ and a logical value for ‘na.rm’ to remove missing values. Its syntax is as follows:

```
sd(x, na.rm = FALSE)
```

The standard deviation for a vector with length zero or 1 is ‘NA’. A couple of examples are given below:

```
> sd(1:10)
3.02765

> sd(1)
NA
```

We can calculate the standard deviation for the bank age column as follows:

```
> sd(bank$age)
10.57621
```

You are encouraged to explore more functions available in the stats packages available in R.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/08/the-functions-in-the-r-stats-package/

作者：[Shakthi Kannan][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/shakthi-kannan/
[b]: https://github.com/lkxed
