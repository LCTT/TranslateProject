Translating by Torival Linear Regression Classifier from scratch using Numpy and Stochastic gradient descent as an optimization technique
======

![](https://process.filestackapi.com/cache=expiry:max/resize=width:700/compress/cKkX2ryQteXTdZYSR6t7)

In statistics, linear regression is a linear approach for modelling the relationship between a scalar dependent variable y and one or more explanatory variables (or independent variables) denoted X. The case of one explanatory variable is called simple linear regression. For more than one explanatory variable, the process is called multiple linear regression.

As you may know the equation of line with a slope **m** and intercept **c** is given by **y=mx+c** .Now in our dataset **x** is a feature and **y** is the label that is the output.

Now we will start with some random values of m and c and by using our classifier we will adjust their values so that we obtain a line with the best fit.

Suppose we have a dataset with a single feature given by **X=[1,2,3,4,5,6,7,8,9,10]** and label/output being **Y=[1,4,9,16,25,36,49,64,81,100]**.We start with random value of **m** being **1** and **c** being **0**. Now starting with the first data point which is **x=1** we will calculate its corresponding output which is **y=m*x+c** - > **y=1-1+0** - > **y=1** .

Now this is our guess for the given input.Now we will subtract the calculated y which is our guess whith the actual output which is **y(original)=1** to calculate the error which is **y(guess)-y(original)** which can also be termed as our cost function when we take the square of its mean and our aim is to minimize this cost.

After each iteration through the data points we will change our values of **m** and **c** such that the obtained m and c gives the line with the best fit.Now how we can do this?

The answer is using **Gradient Descent Technique**.

![Gd_demystified.png][1] 

In gradient descent we look to minimize the cost function and in order to minimize the cost function we need to minimize the error which is given by **error=y(guess)-y(original)**.


Now error depends on two values **m** and **c** . Now if we take the partial derivative of error with respect to **m** and **c** we can get to know the oreintation i.e whether we need to increase the values of m and c or decrease them in order to obtain the line of best fit.

Now error depends on two values **m** and **c**.So on taking partial derivative of error with respect to **m** we get **x** and taking partial derivative of error with repsect to **c** we get a constant.

So if we apply two changes that is **m=m-error*x** and **c=c-error*1** after every iteration we can adjust the value of m and c to obtain the line with the best fit.

Now error can be negative as well as positive.When the error is negative it means our **m** and **c** are smaller than the actual **m** and **c** and hence we would need to increase their values and if the error is positive we would need to decrease their values that is what we are doing.

But wait we also need a constant called the learning_rate so that we don't increase or decrease the values of **m** and **c** with a steep rate .so we need to multiply **m=m-error * x * learning_rate** and **c=c-error * 1 * learning_rate** so as to make the process smooth.

So we need to update **m** to **m=m-error * x * learning_rate** and **c** to **c=c-error * 1 * learning_rate** to obtain the line with the best fit and this is our linear regreesion model using stochastic gradient descent meaning of stochastic being that we are updating the values of m and c in every iteration.

You can check the full code in python :[https://github.com/assassinsurvivor/MachineLearning/blob/master/Regression.py][2]

--------------------------------------------------------------------------------

via: https://www.codementor.io/prakharthapak/linear-regression-classifier-from-scratch-using-numpy-and-stochastic-gradient-descent-as-an-optimization-technique-gf5gm9yti

作者：[Prakhar Thapak][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.codementor.io/prakharthapak
[1]:https://process.filestackapi.com/cache=expiry:max/5TXRH28rSo27kTNZLgdN
[2]:https://www.codementor.io/prakharthapak/here
